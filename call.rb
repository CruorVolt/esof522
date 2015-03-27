require 'octokit'

API_KEY = File.read("api_token.txt")
REPOS_LIST = "repos.txt"

client = Octokit::Client.new(:access_token => API_KEY)
client.auto_paginate = true #auto rate-limiting and page concat (theoretically)

File.open REPOS_LIST do |repos|
	repos.each do |repo|
		repo.chomp!
		file_path = File.join(Dir.pwd, "api_results")

		#Issues call
		issues_file = "#{repo.split("/")[1].chomp}_issues.csv"
		File.open(File.join(file_path, issues_file), "w") do |new_file|
			issues = client.list_issues(repo, :state => "all", :sort => "created") #newest-first
			num = issues.length
			puts "Found #{num} issues for #{repo}"
			new_file.puts "issue_id, total, time"
			issues.each do |issue|
				new_file.puts  "#{issue.id}, #{num}, #{issue.created_at.to_i}"
				num = num -1 #count down to issue-0
			end
		end

		#Commits call
		commits_file = "#{repo.split("/")[1].chomp}_commits.csv"
		File.open(File.join(file_path, commits_file), "w") do |new_file|
			commits = client.list_commits(repo) #newest first
			num = commits.length
			puts "Found #{num} commits for #{repo}"
			new_file.puts "commit_sha, total, time"
			commits.each do |commit|
				new_file.puts  "#{commit.sha}, #{num}, #{commit.commit.author.date.to_i}" 
				num = num -1 #count down to initial commit
			end
		end

=begin
		#Stars call
		stars_file = "#{repo.split("/")[1].chomp}_stars.csv"
		File.open(File.join(file_path, stars_file), "w") do |new_file|
			stars = client.stargazers(repo, :accept => "application/vnd.github.v3.star+json")
			num = stars.length
			puts "Found #{num} stars for #{repo}"
			new_file.puts "total, time"
			stars.each do |star|
				new_file.puts  "#{num}, #{star.starred_at}" 
				num = num -1 #count down to initial commit
			end
		end
=end

	end
end
