#!/bin/sh

echo "Creating Navbar mixins"
echo "------------------------------"


file_name="mixins/navbars/_navbar.pug"
colors="scripts/colors.txt"
sizes="scripts/sizes.txt"

# remove old file
rm $file_name

cat $colors | while read color name 
do
  echo "+tw-navbar-$color()"

  echo "mixin tw-navbar-$color()
    nav(class='bg-$color-800')&attributes(attributes)
      .max-w-7xl.mx-auto.px-2(class='sm_px-6 lg_px-8')
        .relative.flex.items-center.justify-between.h-16
          .absolute.inset-y-0.left-0.flex.items-center(class='sm_hidden')
            button.inline-flex.items-center.justify-center.p-2.rounded-md.text-gray-400(type='button' class='hover_text-white hover_bg-gray-700 focus_outline-none focus_ring-2 focus_ring-inset focus_ring-white' aria-controls='mobile-menu' aria-expanded='false')
              span.sr-only Open main menu
              svg.block.h-6.w-6(xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='currentColor' aria-hidden='true')
                path(stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M4 6h16M4 12h16M4 18h16')
              svg.hidden.h-6.w-6(xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='currentColor' aria-hidden='true')
                path(stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M6 18L18 6M6 6l12 12')
          block
      #mobile-menu(class='sm_hidden')
        .px-2.pt-2.pb-3.space-y-1
          a.bg-gray-900.text-white.block.px-3.py-2.rounded-md.text-base.font-medium(href='#' aria-current='page') Dashboard
          a.text-gray-300.block.px-3.py-2.rounded-md.text-base.font-medium(href='#' class='hover_bg-gray-700 hover_text-white') Team
          a.text-gray-300.block.px-3.py-2.rounded-md.text-base.font-medium(href='#' class='hover_bg-gray-700 hover_text-white') Projects
          a.text-gray-300.block.px-3.py-2.rounded-md.text-base.font-medium(href='#' class='hover_bg-gray-700 hover_text-white') Calendar
  " >> $file_name
done

