#!/bin/bash

# Get id of touchpad and the id of the field corresponding to
# tapping to click
id=`xinput list | grep "TouchPad" | cut -d'=' -f2 | cut -d'[' -f1`
tap_to_click_id=`xinput list-props $id | \
                      grep "Tap Action (" \
                      | cut -d'(' -f2 | cut -d')' -f1`
# echo $tap_to_click_id
# Set the property to true
xinput --set-prop $id $tap_to_click_id 1, 1, 1, 1, 1, 1, 1

#原
#0, 0, 0, 0, 0, 0, 0