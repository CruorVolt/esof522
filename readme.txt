Set the repositories to pull data from by adding them one-per-line to repos.txt (format "user/repo_name").

PULLING REPO HISTORY FROM THE GITHUB API

GitHub api access requires an api-key. Right now repo_history.rb expects the key in a file called 'api_token.txt' in the root directory.

Output will be in three files per repository located in /api_results/repo_name.

STATIC ANALYSIS WITH CHECKSTYLE
run_checkstlye.rb uses sytem java calls with checkstle.jar to produce results. It will clone repositories as needed into /repo_clones.

Output is a single file containing all metrics for all commits in a repository, located in /checkstyle_results/repo_name.

If this script is cancelled while running or crashes during a git system call the repository may be left in an unexpected state. Remove the repository folder or manually git checkout any altered files to return to a working state. 
