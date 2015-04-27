library(plotrix)
library(plyr)
#setwd("~/Documents/esof_522/project")

fillNAgaps <- function(x, firstBack=FALSE) {
  ## NA's in a vector or factor are replaced with last non-NA values
  ## If firstBack is TRUE, it will fill in leading NA's with the first
  ## non-NA value. If FALSE, it will not change leading NA's.
  
  # If it's a factor, store the level labels and convert to integer
  lvls <- NULL
  if (is.factor(x)) {
    lvls <- levels(x)
    x    <- as.integer(x)
  }
  
  goodIdx <- !is.na(x)
  
  # These are the non-NA values from x only
  # Add a leading NA or take the first good value, depending on firstBack   
  if (firstBack)   goodVals <- c(x[goodIdx][1], x[goodIdx])
  else             goodVals <- c(NA,            x[goodIdx])
  
  # Fill the indices of the output vector with the indices pulled from
  # these offsets of goodVals. Add 1 to avoid indexing to zero.
  fillIdx <- cumsum(goodIdx)+1
  
  x <- goodVals[fillIdx]
  
  # If it was originally a factor, convert it back
  if (!is.null(lvls)) {
    x <- factor(x, levels=seq_along(lvls), labels=lvls)
  }
  
  x
}

#merged = Reduce(function(...) merge(..., by='time', all=T), list(dagger_commits, dagger_forks, dagger_issues, dagger_quality))
#merged$total.y = fillNAgaps(merged$total.y, firstBack='TRUE')

#legend("topleft", c("cyclomatic complexity", "npath complexity", "data abstraction coupling", "class fanout"), lty=c(1,1,1,1), col=c("red", "blue", "purple", "green")

ANEFacebook = colwise(fillNAgaps)(Reduce(function(...) merge(..., by='time', all=T), list(
	read.csv("api_results/ANE-Facebook/ANE-Facebook_forks.csv"), 
	read.csv("api_results/ANE-Facebook/ANE-Facebook_issues.csv"), 
	read.csv("checkstyle_results/ANE-Facebook.csv")
)), firstBack='TRUE')
colnames(ANEFacebook) <- c("time", "forks", "issues", "commits", "sha", "cyclo", "abstract", "fanout", "npath")


androidsimplefacebook = colwise(fillNAgaps)(Reduce(function(...) merge(..., by='time', all=T), list(
	read.csv("api_results/android-simple-facebook/android-simple-facebook_forks.csv"), 
	read.csv("api_results/android-simple-facebook/android-simple-facebook_issues.csv"), 
	read.csv("checkstyle_results/android-simple-facebook.csv")
)), firstBack='TRUE')
colnames(androidsimplefacebook) <- c("time", "forks", "issues", "commits", "sha", "cyclo", "abstract", "fanout", "npath")

dagger = colwise(fillNAgaps)(Reduce(function(...) merge(..., by='time', all=T), list(
	read.csv("api_results/dagger/dagger_forks.csv"), 
	read.csv("api_results/dagger/dagger_issues.csv"), 
	read.csv("checkstyle_results/dagger.csv")
)), firstBack='TRUE')
colnames(dagger) <- c("time", "forks", "issues", "commits", "sha", "cyclo", "abstract", "fanout", "npath")

eclipsethemes = colwise(fillNAgaps)(Reduce(function(...) merge(..., by='time', all=T), list(
	read.csv("api_results/eclipse-themes/eclipse-themes_forks.csv"), 
	read.csv("api_results/eclipse-themes/eclipse-themes_issues.csv"), 
	read.csv("checkstyle_results/eclipse-themes.csv")
)), firstBack='TRUE')
colnames(eclipsethemes) <- c("time", "forks", "issues", "commits", "sha", "cyclo", "abstract", "fanout", "npath")

facebookandroidsdk = colwise(fillNAgaps)(Reduce(function(...) merge(..., by='time', all=T), list(
	read.csv("api_results/facebook-android-sdk/facebook-android-sdk_forks.csv"), 
	read.csv("api_results/facebook-android-sdk/facebook-android-sdk_issues.csv"), 
	read.csv("checkstyle_results/facebook-android-sdk.csv")
)), firstBack='TRUE')
colnames(facebookandroidsdk) <- c("time", "forks", "issues", "commits", "sha", "cyclo", "abstract", "fanout", "npath")

golangideaplugin = colwise(fillNAgaps)(Reduce(function(...) merge(..., by='time', all=T), list(
	read.csv("api_results/go-lang-idea-plugin/go-lang-idea-plugin_forks.csv"), 
	read.csv("api_results/go-lang-idea-plugin/go-lang-idea-plugin_issues.csv"), 
	read.csv("checkstyle_results/go-lang-idea-plugin.csv")
)), firstBack='TRUE')
colnames(golangideaplugin) <- c("time", "forks", "issues", "commits", "sha", "cyclo", "abstract", "fanout", "npath")

guice = colwise(fillNAgaps)(Reduce(function(...) merge(..., by='time', all=T), list(
	read.csv("api_results/guice/guice_forks.csv"), 
	read.csv("api_results/guice/guice_issues.csv"), 
	read.csv("checkstyle_results/guice.csv")
)), firstBack='TRUE')
colnames(guice) <- c("time", "forks", "issues", "commits", "sha", "cyclo", "abstract", "fanout", "npath")

jedis= colwise(fillNAgaps)(Reduce(function(...) merge(..., by='time', all=T), list(
	read.csv("api_results/jedis/jedis_forks.csv"), 
	read.csv("api_results/jedis/jedis_issues.csv"), 
	read.csv("checkstyle_results/jedis.csv")
)), firstBack='TRUE')
colnames(jedis) <- c("time", "forks", "issues", "commits", "sha", "cyclo", "abstract", "fanout", "npath")

junit = colwise(fillNAgaps)(Reduce(function(...) merge(..., by='time', all=T), list(
	read.csv("api_results/junit/junit_forks.csv"), 
	read.csv("api_results/junit/junit_issues.csv"), 
	read.csv("checkstyle_results/junit.csv")
)), firstBack='TRUE')
colnames(junit) <- c("time", "forks", "issues", "commits", "sha", "cyclo", "abstract", "fanout", "npath")

okhttp = colwise(fillNAgaps)(Reduce(function(...) merge(..., by='time', all=T), list(
	read.csv("api_results/okhttp/okhttp_forks.csv"), 
	read.csv("api_results/okhttp/okhttp_issues.csv"), 
	read.csv("checkstyle_results/okhttp.csv")
)), firstBack='TRUE')
colnames(okhttp) <- c("time", "forks", "issues", "commits", "sha", "cyclo", "abstract", "fanout", "npath")

phonegapfacebookplugin = colwise(fillNAgaps)(Reduce(function(...) merge(..., by='time', all=T), list(
	read.csv("api_results/phonegap-facebook-plugin/phonegap-facebook-plugin_forks.csv"), 
	read.csv("api_results/phonegap-facebook-plugin/phonegap-facebook-plugin_issues.csv"), 
	read.csv("checkstyle_results/phonegap-facebook-plugin.csv")
)), firstBack='TRUE')
colnames(phonegapfacebookplugin) <- c("time", "forks", "issues", "commits", "sha", "cyclo", "abstract", "fanout", "npath")

retrofit = colwise(fillNAgaps)(Reduce(function(...) merge(..., by='time', all=T), list(
	read.csv("api_results/retrofit/retrofit_forks.csv"), 
	read.csv("api_results/retrofit/retrofit_issues.csv"), 
	read.csv("checkstyle_results/retrofit.csv")
)), firstBack='TRUE')
colnames(retrofit) <- c("time", "forks", "issues", "commits", "sha", "cyclo", "abstract", "fanout", "npath")

roboguice = colwise(fillNAgaps)(Reduce(function(...) merge(..., by='time', all=T), list(
	read.csv("api_results/roboguice/roboguice_forks.csv"), 
	read.csv("api_results/roboguice/roboguice_issues.csv"), 
	read.csv("checkstyle_results/roboguice.csv")
)), firstBack='TRUE')
colnames(roboguice) <- c("time", "forks", "issues", "commits", "sha", "cyclo", "abstract", "fanout", "npath")

