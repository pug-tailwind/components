#!/bin/sh

echo "Creating Outline Button mixins"
echo "------------------------------"


file_name="mixins/buttons/_outline.pug"
colors="scripts/colors.txt"
sizes="scripts/sizes.txt"

# Remove old file
rm $file_name

cat $sizes | while read size
do
  cat $colors | while read color name 
  do
    echo "+tw-btn-outline-$size-$color() $name Button"
    echo "mixin tw-btn-outline-$size-$color()
  button.inline-flex.justify-center.py-2.px-4.border.border-transparent.shadow-sm.text-$size.font-bold.rounded-md.hover_bg-$color-700.hover_text-white.focus_outline-none.focus_ring-2.focus_ring-offset-2.focus_ring-$color-500.text-$color-600.border-$color-300(
    type='button' 
    )&attributes(attributes)
    block
    " >> $file_name
  done
done

# Generate default size mixin
cat $colors | while read color name
do
  echo "+tw-btn-outline-$color() $name Button"
  echo "mixin tw-btn-outline-$color()
  button.inline-flex.justify-center.py-2.px-4.border.border-transparent.shadow-sm.text-base.font-bold.rounded-md.hover_bg-$color-700.hover_text-white.focus_outline-none.focus_ring-2.focus_ring-offset-2.focus_ring-$color-500.text-$color-600.border-$color-300(
  type='button' 
  )&attributes(attributes)
    block
  " >> $file_name
done
