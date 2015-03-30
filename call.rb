require 'octokit'

API_KEY = File.read("api_token.txt")
REPOS_LIST = "repos.txt"

client = Octokit::Client.new(:access_token => API_KEY)
client.auto_paginate = true #auto rate-limiting and page concat (theoretically)

issues_call = Proc.new do |repo| client.list_issues(repo, :state => "all", :sort => "created") end
issues_time = Proc.new do |issue| issue.created_at.to_i end

commits_call = Proc.new do |repo| client.list_commits(repo) end
commits_time = Proc.new do |commit| commit.commit.author.date.to_i end

forks_call = Proc.new do |repo| client.forks(repo) end
forks_time = issues_time

def write_api_results(call_proc, time_proc, repo_name, header = ["total","time"], dir_path = Dir.pwd, type = "")
	repo = repo_name.split("/")[1] #seperate name from user name
	File.open(File.join(dir_path, "#{repo}#{type}.csv"), "w") do |file|
		results = call_proc.call repo_name
		count = results.length
		file.puts header.join(",")
		results.each do |result|
			time = time_proc.call result
			file.puts "#{count},#{time}"
			count = count - 1
		end
		
	end
end

File.open REPOS_LIST do |repos|
	repos.each do |repo|
		repo.chomp!
		file_path = File.join(Dir.pwd, "api_results")
		puts "starting"
		write_api_results(issues_call, issues_time, repo, ["total", "time"], file_path, "_issues")
		puts "done with issues for #{repo}"
		write_api_results(commits_call, commits_time, repo, ["total", "time"], file_path, "_commits")
		puts "done with commits for #{repo}"
		write_api_results(forks_call, forks_time, repo, ["total", "time"], file_path, "_forks")
		puts "done with forks for #{repo}"
	end
end
