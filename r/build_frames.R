library(plotrix)
setwd("~/Documents/esof_522/project")

ANEFacebook_quality <- read.csv("checkstyle_results/ANE-Facebook.csv")
androidsimplefacebook_quality <- read.csv("checkstyle_results/android-simple-facebook.csv")
dagger_quality <- read.csv("checkstyle_results/dagger.csv")
eclipsethemes_quality <- read.csv("checkstyle_results/eclipse-themes.csv")
facebookandroidsdk_quality <- read.csv("checkstyle_results/facebook-android-sdk.csv")
golangideaplugin_quality <- read.csv("checkstyle_results/go-lang-idea-plugin.csv")
guice_quality <- read.csv("checkstyle_results/guice.csv")
jedis_quality <- read.csv("checkstyle_results/jedis.csv")
junit_quality <- read.csv("checkstyle_results/junit.csv")
okhttp_quality <- read.csv("checkstyle_results/okhttp.csv")
phonegapfacebookplugin_quality <- read.csv("checkstyle_results/phonegap-facebook-plugin.csv")
retrofit_quality <- read.csv("checkstyle_results/retrofit.csv")
roboguice_quality <- read.csv("checkstyle_results/roboguice.csv")

ANEFacebook_commits <- read.csv("api_results/ANE-Facebook/ANE-Facebook_commits.csv")
ANEFacebook_forks <- read.csv("api_results/ANE-Facebook/ANE-Facebook_forks.csv")
ANEFacebook_issues <- read.csv("api_results/ANE-Facebook/ANE-Facebook_issues.csv")

androidsimplefacebook_commits <- read.csv("api_results/android-simple-facebook/android-simple-facebook_commits.csv")
androidsimplefacebook_forks <- read.csv("api_results/android-simple-facebook/android-simple-facebook_forks.csv")
androidsimplefacebook_issues <- read.csv("api_results/android-simple-facebook/android-simple-facebook_issues.csv")

dagger_commits <- read.csv("api_results/dagger/dagger_commits.csv")
dagger_forks <- read.csv("api_results/dagger/dagger_forks.csv")
dagger_issues <- read.csv("api_results/dagger/dagger_issues.csv")

eclipsethemes_commits <- read.csv("api_results/eclipse-themes/eclipse-themes_commits.csv")
eclipsethemes_forks <- read.csv("api_results/eclipse-themes/eclipse-themes_forks.csv")
eclipsethemes_issues <- read.csv("api_results/eclipse-themes/eclipse-themes_issues.csv")

facebookandroidsdk_commits <- read.csv("api_results/facebook-android-sdk/facebook-android-sdk_commits.csv")
facebookandroidsdk_forks <- read.csv("api_results/facebook-android-sdk/facebook-android-sdk_forks.csv")
facebookandroidsdk_issues <- read.csv("api_results/facebook-android-sdk/facebook-android-sdk_issues.csv")

golangideaplugin_commits <- read.csv("api_results/go-lang-idea-plugin/go-lang-idea-plugin_commits.csv")
golangideaplugin_forks <- read.csv("api_results/go-lang-idea-plugin/go-lang-idea-plugin_forks.csv")
golangideaplugin_issues <- read.csv("api_results/go-lang-idea-plugin/go-lang-idea-plugin_issues.csv")

guice_commits <- read.csv("api_results/guice/guice_commits.csv")
guice_forks <- read.csv("api_results/guice/guice_forks.csv")
guice_issues <- read.csv("api_results/guice/guice_issues.csv")

jedis_commits <- read.csv("api_results/jedis/jedis_commits.csv")
jedis_forks <- read.csv("api_results/jedis/jedis_forks.csv")
jedis_issues <- read.csv("api_results/jedis/jedis_issues.csv")

junit_commits <- read.csv("api_results/junit/junit_commits.csv")
junit_forks <- read.csv("api_results/junit/junit_forks.csv")
junit_issues <- read.csv("api_results/junit/junit_issues.csv")

okhttp_commits <- read.csv("api_results/okhttp/okhttp_commits.csv")
okhttp_forks <- read.csv("api_results/okhttp/okhttp_forks.csv")
okhttp_issues <- read.csv("api_results/okhttp/okhttp_issues.csv")

phonegapfacebookplugin_commits <- read.csv("api_results/phonegap-facebook-plugin/phonegap-facebook-plugin_commits.csv")
phonegapfacebookplugin_forks <- read.csv("api_results/phonegap-facebook-plugin/phonegap-facebook-plugin_forks.csv")
phonegapfacebookplugin_issues <- read.csv("api_results/phonegap-facebook-plugin/phonegap-facebook-plugin_issues.csv")

retrofit_commits <- read.csv("api_results/retrofit/retrofit_commits.csv")
retrofit_forks <- read.csv("api_results/retrofit/retrofit_forks.csv")
retrofit_issues <- read.csv("api_results/retrofit/retrofit_issues.csv")

roboguice_commits <- read.csv("api_results/roboguice/roboguice_commits.csv")
roboguice_forks <- read.csv("api_results/roboguice/roboguice_forks.csv")
roboguice_issues <- read.csv("api_results/roboguice/roboguice_issues.csv")


jedis_combined = data.frame(
  time = jedis_quality$time,
  cyclo = jedis_quality$cyclo,
  npath = jedis_quality$npath,
  fanout = jedis_quality$fanout,
  abstract = jedis_quality$abstract,
  combined = jedis_quality$abstract + jedis_quality$fanout + jedis_quality$npath + jedis_quality$cyclo
)

monotonic_jedis_commits <- data.frame(
  time = order(jedis_commits$time),
  total = jedis_commits$total
)

merged <- merge(dagger_commits, dagger_issues, by ='time', all.x='TRUE', all.y='TRUE')

#legend("topleft", c("cyclomatic complexity", "npath complexity", "data abstraction coupling", "class fanout"), lty=c(1,1,1,1), col=c("red", "blue", "purple", "green")
