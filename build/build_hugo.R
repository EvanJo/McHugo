library(magrittr)
library(glue)
  contentfolder = "content"
  read_gsheet <- function(sheet_id){
    googlesheets4::read_sheet(data_location, sheet = sheet_id, skip = 1, col_types = "c")
  }
  cv <- list()
    cv$publication   <- read_gsheet(sheet_id = "publication")
    cv$experience <- read_gsheet(sheet_id = "experience")
    cv$publication <- cv$publication %>%
      base::subset(!is.na(cv$publication[,"title"]))
    cv$experience <- cv$experience %>%
      base::subset(!is.na(cv$experience[,"title"]))

# publications
for (i in 1:nrow(cv$publication)) {
  currentglue <- glue::glue_data(cv$publication[i,], {
    "---
title: \"{title}\"
date: {date}
date_print: \"{date_print}\"

authors:
- {authors}
publication_types: [\"{publication_types}\"]

publication: \"{publication}\"

abstract: \"{abstract}\"

links:
{links}
---
" }, .na = "")

    writepath <- glue_data(cv$publication[i,],contentfolder,"/publication/{dir}/")
    writefile <- glue(writepath,"index.md")
    dir.create(writepath,showWarnings=FALSE)
    if (!file.exists(writefile)) {
      file.create(writefile)
    }
    writeLines(currentglue, writefile)
}

### experience
      currentglue <- glue::glue({
        "+++
# Experience widget.
widget = \"experience\"  # See https://sourcethemes.com/academic/docs/page-builder/
headless = true  # This file represents a page section.
active = true  # Activate this widget? true/false
weight = 40  # Order that this section will appear.

title = \"Experience\"
subtitle = \"\"

# Date format for experience
#   Refer to https://sourcethemes.com/academic/docs/customization/#date-format
date_format = \"2006\"

# Experiences.
#   Add/remove as many `[[experience]]` blocks below as you like.
#   Required fields are `title`, `company`, and `date_start`.
#   Leave `date_end` empty if it's your current employer.
#   Begin/end multi-line descriptions with 3 quotes `\"\"\"`

        "}, .na = "" )

      for (i in 1:nrow(cv$experience)) {
        currentglue <- glue::glue_data(cv$experience[i,], currentglue, {
          "[[experience]]
  title = \"{title}\"
  company = \"{company}\"
  company_url = \"{company_url}\"
  location = \"{location}\"
  date_start = \"{date_start}\"
  date_end = \"{date_end}\"
  description = \"\"\"
{description}
\"\"\"

" }, .na = "")
      }

      currentglue <- glue::glue(currentglue, { "+++"}, .na ="")

        writepath <- glue(contentfolder,"/home/")
        writefile <- glue(writepath,"experience.md")
        dir.create(writepath,showWarnings=FALSE)
        if (!file.exists(writefile)) {
          file.create(writefile)
        }
        writeLines(currentglue, writefile)
