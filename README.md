# awscn

A More Secure Method: Caching

We can use git-credential-store to cache our username and password for a time period. Simply enter the following in your CLI (terminal or command prompt):

git config --global credential.helper cache
You can also set the timeout period (in seconds) as such:

git config --global credential.helper 'cache --timeout=3600'

An Even Less Secure Method

Git-credential-store may also be used, but saves passwords in plain text file on your disk as such:

git config credential.helper store

Outdated Answer - Quick and Insecure

This is an insecure method of storing your password in plain text. If someone gains control of your computer, your password will be exposed!

You can set your username and password like this:

git config --global user.name "your username"

git config --global user.password "your password"




#git config credential.helper store
#git config user.name "your username"
#git config user.password "your password"
