
# Academic Template for [Hugo](https://github.com/gohugoio/hugo)

This is a stripped down version of the [Hugo Academic template](https://github.com/wowchemy/starter-academic). For full features of this template, [see the **documentation**](https://wowchemy.com/docs/).

I created this template as a quick way for job market candidates to set up their website. The colours come from McGill's [visual identity guide](https://www.mcgill.ca/visual-identity/visual-identity-guide).


## Start Up Instructions

### Initial setup
- On GitHub:
  - Fork this repo. For the steps below, use your own GitHub username and repo name instead of `EvanJo` and `McHugo`.
- On [Netlify](http://netlify.com)
  - Sign up with your GitHub account
  - Create a new site, using the repo you just forked. Your website is now live!
  - Get your own domain, either from Netlify or from another provider. [See details here](https://docs.netlify.com/domains-https/custom-domains/)

### Editing your site
- Clone your repo to work on it locally
```bash
git clone git@github.com:EvanJo/McHugo.git
cd ./McHugo
```
  - Change the website info in `./config/_default/config.yaml`
  - Change the contents in `./content/`
  - Add linked files to `./static/files/`
- Pushing updates to GitHub will automatically trigger Netlify to rebuild your website
```bash
git add .
git commit -am ''
```

### To preview your site locally, you will need to install Hugo Extended and Go

- See instructions for installing [Go](https://golang.org/doc/install) and [Hugo](https://gohugo.io/getting-started/installing/). On MacOS with homebrew:
```bash
brew install go hugo
```
- To preview your site locally, run
```bash
hugo server
```
