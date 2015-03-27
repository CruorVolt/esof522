require 'octokit'

API_KEY = File.read("api_token.txt")
REPOS_LIST = "repos.txt"

client = Octokit::Client.new(:access_token => API_KEY)
client.auto_paginate = true #auto rate-limiting and page concat (theoretically)

File.open REPOS_LIST do |repos|
	repos.each do |line|
		line.chomp!
		file_path = File.join(Dir.pwd, "issues_json", "#{line.split("/")[1].chomp}.json")
		File.open(file_path, "w") do |new_file|
			issues = client.list_issues(line, :state => "all")
			num = issues.length
			puts "Found #{num} issues for #{line}"
			new_file.puts "IssueID, TotalIssues, CreationTime"
			issues.each do |issue|
				new_file.puts  "#{issue.id}, #{num}, #{issue.created_at.to_i}"
				num = num -1
			end
		end
	end
end
