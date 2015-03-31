REPOS_LIST = "repos.txt"

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
	system("java -jar checkstyle.jar' -c config.xml #{repo_path}")

	#each commit:
		#run checkstyle
			#cyclomatic complexity - average of (max-per-file)
		#collate results
		#write "result, time" to output file
end

check
