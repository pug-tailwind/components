#!/bin/sh

echo "Creating Nav Link  mixins"
echo "------------------------------"


file_name="mixins/navbars/_nav-links.pug"
colors="scripts/colors.txt"
sizes="scripts/sizes.txt"

# remove old file
rm $file_name

cat $colors | while read color name 
do
  echo "+tw-nav-link-$color() "

  echo "mixin tw-nav-link-$color(href, active)
  a.px-3.py-2.rounded-md.text-sm.font-medium(
    href=href
    aria-current='page' 
    class=active === href ? 'bg-$color-900 text-white' :  'text-$color-300 hover_bg-$color-700 hover_text-white'
    )
    block

      " >> $file_name
done
