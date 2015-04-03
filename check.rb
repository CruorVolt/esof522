REPOS_LIST = "repos.txt"

def is_float?(obj)
	Float(obj.sub(/,/,"")) rescue false #thousands have commas in the string for some reason
end

def p50(arr)
	if (arr.length == 0) then return 0 end
	#puts "got #{arr}, will be returning index #{(arr.length / 2.0).floor}"
	return arr[(arr.length / 2.0).floor]
end

def p95(arr)
	#puts "got #{arr}, returning index #{arr.length - (arr.length/20.0).floor - 1}"
	if (arr.length == 0) then return 0 end
	return arr[arr.length - (arr.length/20.0).floor - 1]
end

def mean(arr)
	if (arr.length == 0) then return 0 end
	total = 0
	arr.each do |index|
		total = total + index
	end
	total / Float(arr.length)
end

def check(dir_path = Dir.pwd)
	@processed = 0
	@out = File.open("out.csv", "w")
	@out.puts "commit,sha,cyclo,abstract,fanout,npath"
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
					analyze_repo(repo_path, sha.chomp)
				end 
			}
		end
	end
end

def analyze_repo(repo_path, commit_sha)

	data_abstract_string = "Class Data Abstraction Coupling is "
	cyclomatic_string = "Cyclomatic Complexity is "
	fan_out_string = "Class Fan-Out Complexity is "
	npath_string = "NPath Complexity is "
	line_length_string = "Line is longer than"
	file_length_string = "File length is "

	system("git --git-dir=#{repo_path}/.git --work-tree=#{repo_path} checkout #{commit_sha}")
	IO.popen("java -jar checkstyle.jar -c config.xml #{repo_path}") { |io|
		class_count = 0
		total_complexity = 0

		cyclomatic_arr = Array.new
		data_abstract_arr = Array.new
		fan_out_arr = Array.new
		npath_arr = Array.new
		line_length_arr = Array.new
		file_length_arr = Array.new
		
		while (audit_line = io.gets) do 

			splitline = audit_line.split(/[ )]/)
			
			#cyclomatic complexity - add the cyclomatic complexity to the array
			location = audit_line.index cyclomatic_string
			if !location.nil? 
				splitline.each do |slice|
					if (complexity = is_float? slice)
						cyclomatic_arr << complexity
						break
					end
				end
			end

			#data abstract coupling
			location = audit_line.index data_abstract_string
			if !location.nil?
				splitline.each do |slice|
					if (coupling = is_float? slice)
						data_abstract_arr << coupling
						break
					end
				end
			end

			#class fan-out
			location = audit_line.index fan_out_string
			if !location.nil?
				splitline.each do |slice|
					if (fan = is_float? slice)
						fan_out_arr << fan
						break
					end
				end
			end

			#npath complexity
			location = audit_line.index npath_string
			if !location.nil?
				splitline.each do |slice|
					if (npath = is_float? slice)
						npath_arr << npath
						break
					end
				end
			end

		end
		@out.puts [@processed = @processed + 1, commit_sha[0,8], cyclomatic_arr.length, data_abstract_arr.length, fan_out_arr.length, npath_arr.length].join(",")

	}

end

check ""
