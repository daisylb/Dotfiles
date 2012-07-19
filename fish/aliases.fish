alias fixlyrics 'pbpaste | tr "[:upper:]" "[:lower:]" | perl -pe "s/^(.)/\U\1/g" | perl -pe "s/\bi(['\s])/I\1/g" | pbcopy'

#function subp

