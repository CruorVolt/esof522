ANEFacebook_smoothed = data.frame(
  time = as.POSIXct(ANEFacebook$time, origin="1970-01-01"),
  forks = lowess(ANEFacebook$time, ANEFacebook$forks, f=1/15)$y,
  issues = lowess(ANEFacebook$time, ANEFacebook$issues, f=1/15)$y,
  commits = lowess(ANEFacebook$time, ANEFacebook$commits, f=1/15)$y,
  quality =lowess(ANEFacebook$time, ANEFacebook$combined, f=1/30)$y 
)
ANEFacebook_smoothed$forks_deriv = c(diff(ANEFacebook_smoothed$forks)[1], diff(ANEFacebook_smoothed$forks)) / c(diff(as.numeric(ANEFacebook_smoothed$time))[1], diff(as.numeric(ANEFacebook_smoothed$time)))
ANEFacebook_smoothed$issues_deriv = c(diff(ANEFacebook_smoothed$issues)[1], diff(ANEFacebook_smoothed$issues)) / c(diff(as.numeric(ANEFacebook_smoothed$time))[1], diff(as.numeric(ANEFacebook_smoothed$time)))
ANEFacebook_smoothed$commits_deriv = c(diff(ANEFacebook_smoothed$commits)[1], diff(ANEFacebook_smoothed$commits)) / c(diff(as.numeric(ANEFacebook_smoothed$time))[1], diff(as.numeric(ANEFacebook_smoothed$time)))
ANEFacebook_smoothed$quality_deriv = c(diff(ANEFacebook_smoothed$quality)[1], diff(ANEFacebook_smoothed$quality)) / c(diff(as.numeric(ANEFacebook_smoothed$time))[1], diff(as.numeric(ANEFacebook_smoothed$time)))


androidsimplefacebook_smoothed = data.frame(
  time = as.POSIXct(androidsimplefacebook$time, origin="1970-01-01"),
  forks = lowess(androidsimplefacebook$time, androidsimplefacebook$forks, f=1/15)$y,
  issues = lowess(androidsimplefacebook$time, androidsimplefacebook$issues, f=1/15)$y,
  commits = lowess(androidsimplefacebook$time, androidsimplefacebook$commits, f=1/15)$y,
  quality =lowess(androidsimplefacebook$time, androidsimplefacebook$combined, f=1/30)$y 
)
androidsimplefacebook_smoothed$forks_deriv = c(diff(androidsimplefacebook_smoothed$forks)[1], diff(androidsimplefacebook_smoothed$forks)) / c(diff(as.numeric(androidsimplefacebook_smoothed$time))[1], diff(as.numeric(androidsimplefacebook_smoothed$time)))
androidsimplefacebook_smoothed$issues_deriv = c(diff(androidsimplefacebook_smoothed$issues)[1], diff(androidsimplefacebook_smoothed$issues)) / c(diff(as.numeric(androidsimplefacebook_smoothed$time))[1], diff(as.numeric(androidsimplefacebook_smoothed$time)))
androidsimplefacebook_smoothed$commits_deriv = c(diff(androidsimplefacebook_smoothed$commits)[1], diff(androidsimplefacebook_smoothed$commits)) / c(diff(as.numeric(androidsimplefacebook_smoothed$time))[1], diff(as.numeric(androidsimplefacebook_smoothed$time)))
androidsimplefacebook_smoothed$quality_deriv = c(diff(androidsimplefacebook_smoothed$quality)[1], diff(androidsimplefacebook_smoothed$quality)) / c(diff(as.numeric(androidsimplefacebook_smoothed$time))[1], diff(as.numeric(androidsimplefacebook_smoothed$time)))

dagger_smoothed = data.frame(
  time = as.POSIXct(dagger$time, origin="1970-01-01"),
  forks = lowess(dagger$time, dagger$forks, f=1/15)$y,
  issues = lowess(dagger$time, dagger$issues, f=1/15)$y,
  commits = lowess(dagger$time, dagger$commits, f=1/15)$y,
  quality =lowess(dagger$time, dagger$combined, f=1/30)$y 
)
dagger_smoothed$forks_deriv = c(diff(dagger_smoothed$forks)[1], diff(dagger_smoothed$forks)) / c(diff(as.numeric(dagger_smoothed$time))[1], diff(as.numeric(dagger_smoothed$time)))
dagger_smoothed$issues_deriv = c(diff(dagger_smoothed$issues)[1], diff(dagger_smoothed$issues)) / c(diff(as.numeric(dagger_smoothed$time))[1], diff(as.numeric(dagger_smoothed$time)))
dagger_smoothed$commits_deriv = c(diff(dagger_smoothed$commits)[1], diff(dagger_smoothed$commits)) / c(diff(as.numeric(dagger_smoothed$time))[1], diff(as.numeric(dagger_smoothed$time)))
dagger_smoothed$quality_deriv = c(diff(dagger_smoothed$quality)[1], diff(dagger_smoothed$quality)) / c(diff(as.numeric(dagger_smoothed$time))[1], diff(as.numeric(dagger_smoothed$time)))

eclipsethemes_smoothed = data.frame(
  time = as.POSIXct(eclipsethemes$time, origin="1970-01-01"),
  forks = lowess(eclipsethemes$time, eclipsethemes$forks, f=1/15)$y,
  issues = lowess(eclipsethemes$time, eclipsethemes$issues, f=1/15)$y,
  commits = lowess(eclipsethemes$time, eclipsethemes$commits, f=1/15)$y,
  quality =lowess(eclipsethemes$time, eclipsethemes$combined, f=1/30)$y 
)
eclipsethemes_smoothed$forks_deriv = c(diff(eclipsethemes_smoothed$forks)[1], diff(eclipsethemes_smoothed$forks)) / c(diff(as.numeric(eclipsethemes_smoothed$time))[1], diff(as.numeric(eclipsethemes_smoothed$time)))
eclipsethemes_smoothed$issues_deriv = c(diff(eclipsethemes_smoothed$issues)[1], diff(eclipsethemes_smoothed$issues)) / c(diff(as.numeric(eclipsethemes_smoothed$time))[1], diff(as.numeric(eclipsethemes_smoothed$time)))
eclipsethemes_smoothed$commits_deriv = c(diff(eclipsethemes_smoothed$commits)[1], diff(eclipsethemes_smoothed$commits)) / c(diff(as.numeric(eclipsethemes_smoothed$time))[1], diff(as.numeric(eclipsethemes_smoothed$time)))
eclipsethemes_smoothed$quality_deriv = c(diff(eclipsethemes_smoothed$quality)[1], diff(eclipsethemes_smoothed$quality)) / c(diff(as.numeric(eclipsethemes_smoothed$time))[1], diff(as.numeric(eclipsethemes_smoothed$time)))

facebookandroidsdk_smoothed = data.frame(
  time = as.POSIXct(facebookandroidsdk$time, origin="1970-01-01"),
  forks = lowess(facebookandroidsdk$time, facebookandroidsdk$forks, f=1/15)$y,
  issues = lowess(facebookandroidsdk$time, facebookandroidsdk$issues, f=1/15)$y,
  commits = lowess(facebookandroidsdk$time, facebookandroidsdk$commits, f=1/15)$y,
  quality =lowess(facebookandroidsdk$time, facebookandroidsdk$combined, f=1/30)$y 
)
facebookandroidsdk_smoothed$forks_deriv = c(diff(facebookandroidsdk_smoothed$forks)[1], diff(facebookandroidsdk_smoothed$forks)) / c(diff(as.numeric(facebookandroidsdk_smoothed$time))[1], diff(as.numeric(facebookandroidsdk_smoothed$time)))
facebookandroidsdk_smoothed$issues_deriv = c(diff(facebookandroidsdk_smoothed$issues)[1], diff(facebookandroidsdk_smoothed$issues)) / c(diff(as.numeric(facebookandroidsdk_smoothed$time))[1], diff(as.numeric(facebookandroidsdk_smoothed$time)))
facebookandroidsdk_smoothed$commits_deriv = c(diff(facebookandroidsdk_smoothed$commits)[1], diff(facebookandroidsdk_smoothed$commits)) / c(diff(as.numeric(facebookandroidsdk_smoothed$time))[1], diff(as.numeric(facebookandroidsdk_smoothed$time)))
facebookandroidsdk_smoothed$quality_deriv = c(diff(facebookandroidsdk_smoothed$quality)[1], diff(facebookandroidsdk_smoothed$quality)) / c(diff(as.numeric(facebookandroidsdk_smoothed$time))[1], diff(as.numeric(facebookandroidsdk_smoothed$time)))

golangideaplugin_smoothed = data.frame(
  time = as.POSIXct(golangideaplugin$time, origin="1970-01-01"),
  forks = lowess(golangideaplugin$time, golangideaplugin$forks, f=1/15)$y,
  issues = lowess(golangideaplugin$time, golangideaplugin$issues, f=1/15)$y,
  commits = lowess(golangideaplugin$time, golangideaplugin$commits, f=1/15)$y,
  quality =lowess(golangideaplugin$time, golangideaplugin$combined, f=1/30)$y
)
golangideaplugin_smoothed$forks_deriv = c(diff(golangideaplugin_smoothed$forks)[1], diff(golangideaplugin_smoothed$forks)) / c(diff(as.numeric(golangideaplugin_smoothed$time))[1], diff(as.numeric(golangideaplugin_smoothed$time)))
golangideaplugin_smoothed$issues_deriv = c(diff(golangideaplugin_smoothed$issues)[1], diff(golangideaplugin_smoothed$issues)) / c(diff(as.numeric(golangideaplugin_smoothed$time))[1], diff(as.numeric(golangideaplugin_smoothed$time)))
golangideaplugin_smoothed$commits_deriv = c(diff(golangideaplugin_smoothed$commits)[1], diff(golangideaplugin_smoothed$commits)) / c(diff(as.numeric(golangideaplugin_smoothed$time))[1], diff(as.numeric(golangideaplugin_smoothed$time)))
golangideaplugin_smoothed$quality_deriv = c(diff(golangideaplugin_smoothed$quality)[1], diff(golangideaplugin_smoothed$quality)) / c(diff(as.numeric(golangideaplugin_smoothed$time))[1], diff(as.numeric(golangideaplugin_smoothed$time)))

guice_smoothed = data.frame(
  time = as.POSIXct(guice$time, origin="1970-01-01"),
  forks = lowess(guice$time, guice$forks, f=1/15)$y,
  issues = lowess(guice$time, guice$issues, f=1/15)$y,
  commits = lowess(guice$time, guice$commits, f=1/15)$y,
  quality =lowess(guice$time, guice$combined, f=1/30)$y 
)
guice_smoothed$forks_deriv = c(diff(guice_smoothed$forks)[1], diff(guice_smoothed$forks)) / c(diff(as.numeric(guice_smoothed$time))[1], diff(as.numeric(guice_smoothed$time)))
guice_smoothed$issues_deriv = c(diff(guice_smoothed$issues)[1], diff(guice_smoothed$issues)) / c(diff(as.numeric(guice_smoothed$time))[1], diff(as.numeric(guice_smoothed$time)))
guice_smoothed$commits_deriv = c(diff(guice_smoothed$commits)[1], diff(guice_smoothed$commits)) / c(diff(as.numeric(guice_smoothed$time))[1], diff(as.numeric(guice_smoothed$time)))
guice_smoothed$quality_deriv = c(diff(guice_smoothed$quality)[1], diff(guice_smoothed$quality)) / c(diff(as.numeric(guice_smoothed$time))[1], diff(as.numeric(guice_smoothed$time)))

jedis_smoothed = data.frame(
  time = as.POSIXct(jedis$time, origin="1970-01-01"),
  forks = lowess(jedis$time, jedis$forks, f=1/15)$y,
  issues = lowess(jedis$time, jedis$issues, f=1/15)$y,
  commits = lowess(jedis$time, jedis$commits, f=1/15)$y,
  quality =lowess(jedis$time, jedis$combined, f=1/30)$y 
)
jedis_smoothed$forks_deriv = c(diff(jedis_smoothed$forks)[1], diff(jedis_smoothed$forks)) / c(diff(as.numeric(jedis_smoothed$time))[1], diff(as.numeric(jedis_smoothed$time)))
jedis_smoothed$issues_deriv = c(diff(jedis_smoothed$issues)[1], diff(jedis_smoothed$issues)) / c(diff(as.numeric(jedis_smoothed$time))[1], diff(as.numeric(jedis_smoothed$time)))
jedis_smoothed$commits_deriv = c(diff(jedis_smoothed$commits)[1], diff(jedis_smoothed$commits)) / c(diff(as.numeric(jedis_smoothed$time))[1], diff(as.numeric(jedis_smoothed$time)))
jedis_smoothed$quality_deriv = c(diff(jedis_smoothed$quality)[1], diff(jedis_smoothed$quality)) / c(diff(as.numeric(jedis_smoothed$time))[1], diff(as.numeric(jedis_smoothed$time)))

junit_smoothed = data.frame(
  time = as.POSIXct(junit$time, origin="1970-01-01"),
  forks = lowess(junit$time, junit$forks, f=1/15)$y,
  issues = lowess(junit$time, junit$issues, f=1/15)$y,
  commits = lowess(junit$time, junit$commits, f=1/15)$y,
  quality =lowess(junit$time, junit$combined, f=1/30)$y 
)
junit_smoothed$forks_deriv = c(diff(junit_smoothed$forks)[1], diff(junit_smoothed$forks)) / c(diff(as.numeric(junit_smoothed$time))[1], diff(as.numeric(junit_smoothed$time)))
junit_smoothed$issues_deriv = c(diff(junit_smoothed$issues)[1], diff(junit_smoothed$issues)) / c(diff(as.numeric(junit_smoothed$time))[1], diff(as.numeric(junit_smoothed$time)))
junit_smoothed$commits_deriv = c(diff(junit_smoothed$commits)[1], diff(junit_smoothed$commits)) / c(diff(as.numeric(junit_smoothed$time))[1], diff(as.numeric(junit_smoothed$time)))
junit_smoothed$quality_deriv = c(diff(junit_smoothed$quality)[1], diff(junit_smoothed$quality)) / c(diff(as.numeric(junit_smoothed$time))[1], diff(as.numeric(junit_smoothed$time)))

okhttp_smoothed = data.frame(
  time = as.POSIXct(okhttp$time, origin="1970-01-01"),
  forks = lowess(okhttp$time, okhttp$forks, f=1/15)$y,
  issues = lowess(okhttp$time, okhttp$issues, f=1/15)$y,
  commits = lowess(okhttp$time, okhttp$commits, f=1/15)$y,
  quality =lowess(okhttp$time, okhttp$combined, f=1/30)$y 
)
okhttp_smoothed$forks_deriv = c(diff(okhttp_smoothed$forks)[1], diff(okhttp_smoothed$forks)) / c(diff(as.numeric(okhttp_smoothed$time))[1], diff(as.numeric(okhttp_smoothed$time)))
okhttp_smoothed$issues_deriv = c(diff(okhttp_smoothed$issues)[1], diff(okhttp_smoothed$issues)) / c(diff(as.numeric(okhttp_smoothed$time))[1], diff(as.numeric(okhttp_smoothed$time)))
okhttp_smoothed$commits_deriv = c(diff(okhttp_smoothed$commits)[1], diff(okhttp_smoothed$commits)) / c(diff(as.numeric(okhttp_smoothed$time))[1], diff(as.numeric(okhttp_smoothed$time)))
okhttp_smoothed$quality_deriv = c(diff(okhttp_smoothed$quality)[1], diff(okhttp_smoothed$quality)) / c(diff(as.numeric(okhttp_smoothed$time))[1], diff(as.numeric(okhttp_smoothed$time)))

phonegapfacebookplugin_smoothed = data.frame(
  time = as.POSIXct(phonegapfacebookplugin$time, origin="1970-01-01"),
  forks = lowess(phonegapfacebookplugin$time, phonegapfacebookplugin$forks, f=1/15)$y,
  issues = lowess(phonegapfacebookplugin$time, phonegapfacebookplugin$issues, f=1/15)$y,
  commits = lowess(phonegapfacebookplugin$time, phonegapfacebookplugin$commits, f=1/15)$y,
  quality =lowess(phonegapfacebookplugin$time, phonegapfacebookplugin$combined, f=1/30)$y 
)
phonegapfacebookplugin_smoothed$forks_deriv = c(diff(phonegapfacebookplugin_smoothed$forks)[1], diff(phonegapfacebookplugin_smoothed$forks)) / c(diff(as.numeric(phonegapfacebookplugin_smoothed$time))[1], diff(as.numeric(phonegapfacebookplugin_smoothed$time)))
phonegapfacebookplugin_smoothed$issues_deriv = c(diff(phonegapfacebookplugin_smoothed$issues)[1], diff(phonegapfacebookplugin_smoothed$issues)) / c(diff(as.numeric(phonegapfacebookplugin_smoothed$time))[1], diff(as.numeric(phonegapfacebookplugin_smoothed$time)))
phonegapfacebookplugin_smoothed$commits_deriv = c(diff(phonegapfacebookplugin_smoothed$commits)[1], diff(phonegapfacebookplugin_smoothed$commits)) / c(diff(as.numeric(phonegapfacebookplugin_smoothed$time))[1], diff(as.numeric(phonegapfacebookplugin_smoothed$time)))
phonegapfacebookplugin_smoothed$quality_deriv = c(diff(phonegapfacebookplugin_smoothed$quality)[1], diff(phonegapfacebookplugin_smoothed$quality)) / c(diff(as.numeric(phonegapfacebookplugin_smoothed$time))[1], diff(as.numeric(phonegapfacebookplugin_smoothed$time)))

retrofit_smoothed = data.frame(
  time = as.POSIXct(retrofit$time, origin="1970-01-01"),
  forks = lowess(retrofit$time, retrofit$forks, f=1/15)$y,
  issues = lowess(retrofit$time, retrofit$issues, f=1/15)$y,
  commits = lowess(retrofit$time, retrofit$commits, f=1/15)$y,
  quality =lowess(retrofit$time, retrofit$combined, f=1/30)$y 
)
retrofit_smoothed$forks_deriv = c(diff(retrofit_smoothed$forks)[1], diff(retrofit_smoothed$forks)) / c(diff(as.numeric(retrofit_smoothed$time))[1], diff(as.numeric(retrofit_smoothed$time)))
retrofit_smoothed$issues_deriv = c(diff(retrofit_smoothed$issues)[1], diff(retrofit_smoothed$issues)) / c(diff(as.numeric(retrofit_smoothed$time))[1], diff(as.numeric(retrofit_smoothed$time)))
retrofit_smoothed$commits_deriv = c(diff(retrofit_smoothed$commits)[1], diff(retrofit_smoothed$commits)) / c(diff(as.numeric(retrofit_smoothed$time))[1], diff(as.numeric(retrofit_smoothed$time)))
retrofit_smoothed$quality_deriv = c(diff(retrofit_smoothed$quality)[1], diff(retrofit_smoothed$quality)) / c(diff(as.numeric(retrofit_smoothed$time))[1], diff(as.numeric(retrofit_smoothed$time)))

roboguice_smoothed = data.frame(
  time = as.POSIXct(roboguice$time, origin="1970-01-01"),
  forks = lowess(roboguice$time, roboguice$forks, f=1/15)$y,
  issues = lowess(roboguice$time, roboguice$issues, f=1/15)$y,
  commits = lowess(roboguice$time, roboguice$commits, f=1/15)$y,
  quality =lowess(roboguice$time, roboguice$combined, f=1/30)$y 
)
roboguice_smoothed$forks_deriv = c(diff(roboguice_smoothed$forks)[1], diff(roboguice_smoothed$forks)) / c(diff(as.numeric(roboguice_smoothed$time))[1], diff(as.numeric(roboguice_smoothed$time)))
roboguice_smoothed$issues_deriv = c(diff(roboguice_smoothed$issues)[1], diff(roboguice_smoothed$issues)) / c(diff(as.numeric(roboguice_smoothed$time))[1], diff(as.numeric(roboguice_smoothed$time)))
roboguice_smoothed$commits_deriv = c(diff(roboguice_smoothed$commits)[1], diff(roboguice_smoothed$commits)) / c(diff(as.numeric(roboguice_smoothed$time))[1], diff(as.numeric(roboguice_smoothed$time)))
roboguice_smoothed$quality_deriv = c(diff(roboguice_smoothed$quality)[1], diff(roboguice_smoothed$quality)) / c(diff(as.numeric(roboguice_smoothed$time))[1], diff(as.numeric(roboguice_smoothed$time)))
