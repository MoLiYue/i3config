#!/bin/bash

while read -a Line; do
	if [[ ${Line[*]} == *\ TouchPad\ * ]]; then
		for Field in "${Line[@]}"; {
			if [[ $Field == id=* ]]; then
				natural_scrolling_id=`xinput list-props ${Field#*=} | \
				                      grep "Two-Finger Scrolling (" \
				                      | cut -d'(' -f2 | cut -d')' -f1`
				# echo $natural_scrolling_id
				# Set the property to true
				xinput --set-prop $id $natural_scrolling_id 1, 0

				break
			fi
		}

		break
	fi
done <<< "$(xinput list)"

#原
#1, 0
