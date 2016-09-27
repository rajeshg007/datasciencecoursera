library(httr)
require(httpuv)
require(jsonlite)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications
#    Insert your values below - if secret is omitted, it will look it up in
#    the GITHUB_CONSUMER_SECRET environmental variable.
#
#    Use http://localhost:1410 as the callback url
myapp <- oauth_app("DataCleaningQuiz2", "5fbb129e9b0a7bd0f4cd", secret="acac0e54520524bd45b1ac56968039b54aabb79f")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)
output <- content(req)
list(output[[0]]$name, output[[0]]$created_at)

for(i in 1:30)
{
  if(output[[i]]$name == "datasharing"){
  print(output[[i]]$created_at)
  }
} 
