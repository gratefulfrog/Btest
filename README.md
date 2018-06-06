# Btest

Following Microsoft's purchase of Github, this project has migrated to gitlab.

# Testing Devt. with gh-pages branch

I'm trying to find a way of using the gh-pages branch to have a website, while 
developing in the master branch with releases.

# Workflow

## Initialization

* create the repo
* create the gh-pages branch: `$ git branch gh-pages`
* checkout gh-pages, add initial stuff and commit
````shell
$ git checkout gh-pages
$ git add index.html processing.min.js 
$ git commit -a -m "first gh-pages commit"
$ git push --set-upstream origin gh-pages
````
* return to master branch for general work: `$ git checkout master`

## Loop

1. do work in master branch: `git checkout master`
2. add files to master: `$ git add <other stuff, not the stuff that is only in gh-pages>`
3. commit to master: `$ git commit -a -m "changed or added stuff to master"`
4. push to master: `$ git push --set-upstream origin master`
5. merge master's changes into gh-pages & push to gh-pages:

    ````shell
    $ git checkout gh-pages
    $ git merge master
    $ git push
    ````
6. return to master branch for more work: `$ git checkout master`

# Viewing

The web visualization for repo named REPO:  `https://gratefulfrog.github.io/REPO/index.html`

# Maybe write a script to automate all that?

# Use credentials to avoid typing passwords (for 1 year)
````
$ git config --global credential.helper "cache --timeout=31536000"
````
