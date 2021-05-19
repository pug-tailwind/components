#!/bin/sh

echo "Creating Light Button mixins"
echo "------------------------------"


file_name="mixins/buttons/_light.pug"
colors="scripts/colors.txt"
sizes="scripts/sizes.txt"

# remove old file
rm $file_name

cat $sizes | while read size
do
  cat $colors | while read color name 
  do
    echo "+tw-btn-light-$size-$color() $name Button"
    echo "mixin tw-btn-light-$size-$color()
  button.inline-flex.justify-center.py-2.px-4.border.border-transparent.shadow-sm.font-bold.rounded-md(
    type='button' 
    class='hover_bg-$color-700 hover_text-white focus_outline-none focus_ring-2 focus_ring-offset-2 focus_ring-$color-500 text-$size bg-$color-100 text-$color-600 ')&attributes(attributes)
    block
    " >> $file_name
  done
done

# Generate default size mixins withoug size name
cat $colors | while read color name 
do
  echo "+tw-btn-light-$color() $name Button"
  echo "mixin tw-btn-light-$color()
  button.inline-flex.justify-center.py-2.px-4.border.border-transparent.shadow-sm.font-bold.rounded-md(
    type='button' 
    class='hover_bg-$color-700 hover_text-white focus_outline-none focus_ring-2 focus_ring-offset-2 focus_ring-$color-500 text-base bg-$color-100 text-$color-600 ')&attributes(attributes)
    block

  " >> $file_name
done

