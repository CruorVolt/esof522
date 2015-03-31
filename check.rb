REPOS_LIST = "repos.txt"

def check(dir_path = Dir.pwd)
	File.open REPOS_LIST do |repos|
		repos.each do |repo_name|
			repo_name.chomp!
			repo = repo_name.split("/")[1] #seperate name from GitHub user name
			puts "found repo: #{repo}, checking directory #{File.join(dir_path, "checkstyle_output", repo)}"
			if !(Dir.exist? File.join(dir_path, "checkstyle_output", repo)) #clone if repo doesn't exist
				puts "That directory doesn't exist, running git clone https://github.com/#{repo_name}.git #{File.join(dir_path, 'checkstyle_output')}"
				system("git clone https://github.com/#{repo_name}.git #{File.join(dir_path, 'checkstyle_output', repo)}")
			else 
				puts "That directory already exists"
			end
			#list commits
			#prep output file
			#each commit:
				#run checkstyle
					#cyclomatic complexity - average of (max-per-file)
				#collate results
				#write "result, time" to output file
		end
	end
end

check
