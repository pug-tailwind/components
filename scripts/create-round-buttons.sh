#!/bin/sh

echo "Creating Round Button mixins"
echo "------------------------------"


file_name="mixins/buttons/_round.pug"
colors="scripts/colors.txt"
sizes="scripts/sizes.txt"

# remove old file
rm $file_name

cat $sizes | while read size
do
  cat $colors | while read color name 
  do
    echo "+tw-btn-round-$size-$color() $name Button"
    echo "mixin tw-btn-round-$size-$color()
  button.inline-flex.justify-center.py-2.px-4.border.border-transparent.shadow-sm.font-medium.rounded-full.text-white(
    type='button' 
    class='hover_bg-$color-700 focus_outline-none focus_ring-2 focus_ring-offset-2 focus_ring-$color-500 text-$size bg-$color-600')&attributes(attributes)
    block
    " >> $file_name
  done
done

# Generate default size mixins withoug size name
cat $colors | while read color name 
do
  echo "+tw-btn-round-$color() $name Button"
  echo "mixin tw-btn-round-$color()
  button.inline-flex.justify-center.py-2.px-4.border.border-transparent.shadow-sm.font-medium.rounded-full.text-white(
    type='button' 
    class='hover_bg-$color-700 focus_outline-none focus_ring-2 focus_ring-offset-2 focus_ring-$color-500 text-base bg-$color-600')&attributes(attributes)
    block
  " >> $file_name
done

