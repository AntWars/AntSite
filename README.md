# AntSite
Site for AntWars project.
To automatically update site with new changes in .txt files create file "pre-commit" with following entrance in .git/hooks and make it executable:
 #!/usr/bin/sh
 perl generator.pl
 exit $?

