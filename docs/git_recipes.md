Contributing to the book
------------------------
github -> fork
git clone git@github.com:<USERNAME>/yap-phpro-book.git

git remote add flavius git@github.com:OriginalCopy/yap-phpro-book.git
git fetch flavius
git checkout -b flavius flavius/master

before any change:
git checkout master
git merge flavius
<do one change>
git commit
<do another change>
git commit

when you're done making changes:
git push
on github: pull request