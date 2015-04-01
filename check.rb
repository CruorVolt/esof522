REPOS_LIST = "repos.txt"

data_abtract_string = "Class Data Abstract Coupling is "
cyclomatic_string = "Cyclomatic Complexity is "
fan_out_string = "Class Fain-Out Complexity is "
npath_string = "NPath Complexity is "
line_length_string = "Line is longer than"
file_length_string = "File length is "

def check(dir_path = Dir.pwd)
	File.open REPOS_LIST do |repos|
		repos.each do |repo_name|
			repo_name.chomp!
			repo = repo_name.split("/")[1] #seperate name from GitHub user name
			repo_path = File.join(dir_path, "checkstyle_output", repo)
			puts "found repo: #{repo}, checking directory #{repo_path}"
			if !(Dir.exist? repo_path) #clone if repo doesn't exist
				puts "That directory doesn't exist, running git clone https://github.com/#{repo_name}.git #{File.join(dir_path, 'checkstyle_output')}"
				system("git clone https://github.com/#{repo_name}.git #{File.join(dir_path, 'checkstyle_output', repo)}")
			else 
				puts "That directory already exists"
			end
			#list commits
			IO.popen("git --git-dir=#{repo_path}/.git --work-tree=#{repo_path} rev-list master --reverse") { |io| 
				while (sha = io.gets) do 
					analyze_repo(repo_path, sha)
				end 
			}
		end
	end
end

def analyze_repo(repo_path, commit_sha)
	system("git --git-dir=#{repo_path}/.git --work-tree=#{repo_path} checkout #{commit_sha}")
	IO.popen("java -jar checkstyle.jar -c config.xml #{repo_path}") { |io|
		class_count = 0
		total_complexity = 0
		while (audit_line = io.gets) do 
			
			puts audit_line

			#cyclomatic compexity
			location = audit_line.index cyclomatic_string
			if !location.nil? 
				complexity = audit_line[location+25, 2].to_i
				total_complexity = total_complexity + complexity
				class_count = class_count + 1
			end
		end
		if (class_count > 0)
			average_complexity = total_complexity / Float(class_count)
			#puts "Commit average = #{average_complexity}"
		end
	}

	#each commit:
		#run checkstyle
			#cyclomatic complexity - average of (max-per-file)
		#collate results
		#write "result, time" to output file
end

check
