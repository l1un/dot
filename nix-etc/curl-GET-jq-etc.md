##### pipe jq through less

`curl -s https://api.github.com/users/octocat/repos | jq '.' | cat`
