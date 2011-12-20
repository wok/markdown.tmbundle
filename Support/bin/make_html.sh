#!/bin/bash

base_dir="${TM_FILEPATH%/*}"
output_dir="${base_dir}/output"

# make the output directory
mkdir -p "$output_dir"

cd $output_dir


# ensure that we link to possible images directory
if [[ -d "$base_dir/images" &&  ! -d "$output_dir/images" ]]; then
    ln -s ../images
fi


content=`cat "${TM_FILEPATH}"`
content="CSS: $TM_BUNDLE_SUPPORT/css/taikala.css
${content}"

target_name=`basename "${TM_FILEPATH%.*}"`
md_name="${target_name}_tmp.md"
html_name="${target_name}.html"
pdf_name="${target_name}.pdf"

echo "${content}" > ${md_name}

title=`multimarkdown -e "Title" ${md_name}`

echo $title


echo "${content}" | multimarkdown > ${html_name}

open ${html_name}

# wkhtmltopdf -t -s A4 --header-left "${title}" \
#                      --header-right "Page [page] of [toPage]" \
#                      --header-line \
#                      \
#                      "${html_name}" "${pdf_name}"

#open ${pdf_name}