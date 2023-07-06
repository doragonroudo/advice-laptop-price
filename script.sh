#!/usr/bin/env bash

echo "# Advice Laptop Price" > README.md
echo "" >> README.md
echo "Fetched on $(date)" >> README.md
echo "GitHub Sort Content: [LINK](https://github.com/Mottie/GitHub-userscripts/wiki/GitHub-sort-content)" >> README.md
echo "" >> README.md
echo "Brand | Name | Spec | Price | Sale Price" >> README.md
echo "- | - | - | - | -" >> README.md

# declare an array variable
declare -a MENUS=(
  "23438" # HP
  "23430" # Gigabyte
  "24786" # DELL
  "23451" # MSI
  "23557" # LENOVO
  "13605" # ASUS
  "23437" # ACER
  )

## now loop through the above array
for i in "${MENUS[@]}"
do
  curl 'https://www.advice.co.th/avi/getProduct' \
    --data-raw "menu_level=2&menu=${i}&skip=0&take=100&key=0&sort_promotion=" |
  jq -r '.res[] | "\(.item_brand_name) | [\(.item_name)](\(.item_url)) | \(.item_spec) | \(.item_srp|tonumber|round) | \(.item_saleprice|tonumber|round)"' >> README.md
done
