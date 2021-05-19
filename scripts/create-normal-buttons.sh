#!/bin/sh

echo "Creating Normal Button mixins"
echo "------------------------------"


file_name="mixins/buttons/_normal.pug"
colors="scripts/colors.txt"
sizes="scripts/sizes.txt"

# remove old file
rm $file_name

cat $sizes | while read size
do
  cat $colors | while read color name 
  do
    echo "+tw-btn-$size-$color() $name Button"
    echo "mixin tw-btn-$size-$color()
  button.inline-flex.justify-center.py-2.px-4.border.border-transparent.shadow-sm.text-$size.rounded-md.hover_bg-$color-700.hover_text-white.focus_outline-none.focus_ring-2.focus_ring-offset-2.focus_ring-$color-500.text-white.border-$color-300.bg-$color-600(
    type='button' 
    )&attributes(attributes)
    block
    " >> $file_name
  done
done

# Generate default size mixins withoug size name
cat $colors | while read color name 
do
  echo "+tw-btn-$color() $name Button"
  echo "mixin tw-btn-$color()
  button.inline-flex.justify-center.py-2.px-4.border.border-transparent.shadow-sm.text-base.rounded-md.hover_bg-$color-700.hover_text-white.focus_outline-none.focus_ring-2.focus_ring-offset-2.focus_ring-$color-500.text-white.border-$color-300.bg-$color-600(
    type='button' 
    )&attributes(attributes)
    block

  " >> $file_name
done

