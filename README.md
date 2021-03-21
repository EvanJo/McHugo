
# Academic Template for [Hugo](https://github.com/gohugoio/hugo)

I created this template as a quick and easy way for job market candidates to set up their website. It is a stripped down version of the [Hugo Academic template](https://github.com/wowchemy/starter-academic). For full features of this template, [see its documentation](https://wowchemy.com/docs/).

The colours come from McGill's [visual identity guide](https://www.mcgill.ca/visual-identity/visual-identity-guide).

[Here's the demo](https://john-doe-mcgill.netlify.app/).

## Getting Started

### Initial setup
- On GitHub, fork this repo
- On [Netlify](http://netlify.com)
  - Sign up with your GitHub account
  - Create a new site, using the repo you just forked. Your website is now live!
  - Get your own domain, either from Netlify or from another provider. [See details here](https://docs.netlify.com/domains-https/custom-domains/)

### Editing your site
- Clone your repo to work on it locally
```bash
git clone git@github.com:$YourGitHubUsername/McHugo.git
cd ./McHugo
```
  - Change the website info in `./config/_default/config.yaml`
  - Update relevant info (SEO, initials) in `./config/params.yaml`
  - Change the contents in `./content/`
  - Add linked files to `./static/files/`
  - Add your profile picture to `./content/authors/default/avatar.jpg`
  - Copy this image to `./assets/media/sharing.jpg` for it to show up in search engines

- Pushing updates to GitHub will automatically trigger Netlify to rebuild your website
```bash
git add .
git commit -am 'Updated content XYZ'
```

### To preview your site locally, you will need to install Hugo Extended and Go

- See instructions for installing [Go](https://golang.org/doc/install) and [Hugo](https://gohugo.io/getting-started/installing/). On MacOS with homebrew:
```bash
brew update
brew install go hugo
```
- To preview your site locally, run
```bash
hugo server
```

- To get more advanced features (e.g.: view draft website on netlify, debug serverless Lambda functions), check out the [Netlify CLI](https://docs.netlify.com/cli/get-started/)

## Optional Builder
As an option, you can build contents of your site and CV from a googlesheets. These files are in the `./build/` folder. The R scripts read information from a googlesheets and builds a PDF CV and the publications pages and the experience module on Hugo.

The CV building code is adapted from [Nick Strayer](https://github.com/nstrayer/cv). Some features have been taken out in this version for simplicity and compatibility.

### Initialization

- Copy this [googlesheet](https://docs.google.com/spreadsheets/d/11pLgd0LQSYeRmBUZkM2lLCJ3qii_kj7dr2Lf-71pLSM).
- Modify the `main_sheet`, `contact_info` and `text_blocks`. The rest of the sheets should not be modified.

### To update
To update the CV and site entries

- Open `./build/run.r`
- Modify the `data_location` to your googlesheets.
- Run the script.
- The CV PDF will be placed into the `./static/files/` folder by default. The `./content/publications/` folder and `./content/home/experience.md` file will be updated.

| Note: this will overwrite existing files |
|:--|

- The site is ready to be built.

### Customization

- To change the cv appearance, modify `cv.css`.
