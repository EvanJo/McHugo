# This script builds a PDF version of your CV and publication and experience
# pages compatible with Hugo Academic from the same file (optimized for the
# McHugo build)
#
# McHugo without the builder: https://github.com/evanjo/mchugo
# Original CV building script and inspiration: https://github.com/nstrayer/cv
#
# See readme for details

# You may need to run this if your googlesheets is private. A browser prompt
# should arise. You should only need to do this once every so often.

require("googlesheets4")
require("rmarkdown")
require("pagedown")
require("tidyr")

### If running script outside of RStudio, run one of the following lines
### so that pandoc is added to the environment.
# Sys.setenv(RSTUDIO_PANDOC="/usr/lib/rstudio/bin/pandoc") #Linux
# Sys.setenv(RSTUDIO_PANDOC="/Applications/RStudio.app/Contents/MacOS/pandoc") #MacOS
# Sys.setenv(RSTUDIO_PANDOC="/c/Program Files/RStudio/bin/pandoc/") #Windows

gs4_deauth()
gs4_auth()

# Change to where your googlesheets is
data_location = "https://docs.google.com/spreadsheets/d/1AomByoMj_LhPizchiXdSVZY5k7XSnnu_Wd60jbmNGoE/edit?usp=sharing"

# Knit the PDF version to temporary html location
tmp_html_cv_loc <- fs::file_temp(ext = ".html")
render("build/cv.rmd",
                  params = list(pdf_mode = TRUE,data_location = data_location),
                  output_file = tmp_html_cv_loc)

# Convert to PDF using Pagedown. Change output location below if necessary.
chrome_print(input = tmp_html_cv_loc,
                       output = "static/files/John_Doe_CV.pdf")

# Output Hugo Publication and Experience pages. Note this will overwrite any
# files that are there.
source("build/build_hugo.R")

# Commit updated files to start new netlify build
system("git add .")
this_comment=paste("Auto building from google sheet data retrieved on", Sys.time())
system(paste('git commit -am \"',this_comment,'\"'))
