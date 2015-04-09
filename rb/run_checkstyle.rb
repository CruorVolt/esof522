require_relative 'metric'

REPOS_LIST = "repos.txt"
OUTPUT_DIR = "checkstyle_results"

def is_float?(obj)
	Float(obj.sub(/,/,"")) rescue false #thousands have commas in the string for some reason
end

def check(dir_path = Dir.pwd)
	File.open REPOS_LIST do |repos|
		repos.each do |repo_name|
			@processed = 0
			repo_name.chomp!
			repo = repo_name.split("/")[1] #seperate name from GitHub user name
			#repo_path = File.join(dir_path, "repo_clones", repo) # OSX VERSION
			repo_path = File.join("repo_clones", repo) # WINDOWS VERSION
			puts "found repo: #{repo}, checking directory #{repo_path}"
			if !(Dir.exist? repo_path) #clone if repo doesn't exist
				puts "That directory doesn't exist, running git clone https://github.com/#{repo_name}.git #{File.join(dir_path, 'repo_clones')}"
				system("git clone https://github.com/#{repo_name}.git #{File.join(dir_path, 'repo_clones', repo)}")
			else 
				puts "That directory already exists"
			end

			results_file = File.open(File.join(OUTPUT_DIR, repo), "w")
			results_file.puts "commit,sha,time,cyclo,abstract,fanout,npath"

			IO.popen("git --git-dir=#{repo_path}/.git --work-tree=#{repo_path} rev-list --format='%at' master --reverse") { |io| 
				while (sha_line = io.gets) do 
					sha = sha_line.split(" ")[1].chomp
					timestamp = io.gets.chomp
					analyze_commit(repo_path, results_file, sha, timestamp)
				end 
			}
		end
	end
end

def analyze_commit(repo_path, output_file, commit_sha, commit_time)

	data_abstract = Metric.new "Class Data Abstraction Coupling is "
	cyclomatic = Metric.new "Cyclomatic Complexity is "
	fan_out = Metric.new "Class Fan-Out Complexity is "
	npath = Metric.new "NPath Complexity is "

	system("git --git-dir=#{repo_path}/.git --work-tree=#{repo_path} checkout #{commit_sha} --quiet")
	puts "CHECKOUT #{@processed} : #{commit_sha[0,8]}"
	IO.popen("java -jar checkstyle.jar -c config.xml #{repo_path}") { |io|
		class_count = 0

		while (audit_line = io.gets) do 
			[data_abstract, cyclomatic, fan_out, npath].each do |metric|
				check_audit_line(audit_line,metric)
			end
		end
		print "\tcyclo #{cyclomatic.length}\n\tdata_abstract #{data_abstract.length}\n\tfan_out #{fan_out.length}\n\tnpath #{npath.length}\n"
		output_file.puts [@processed = @processed + 1, commit_sha[0,8], commit_time, cyclomatic.length, data_abstract.length, fan_out.length, npath.length].join(",")
	}
end

def check_audit_line (line, metric)
	location = line.index(metric.string)
	splitline = line.split(/[ )]/)
	if !location.nil?
		splitline.each do |slice|
			if (val = is_float? slice)
				metric.add val
				break
			end
		end
	end
end

check 