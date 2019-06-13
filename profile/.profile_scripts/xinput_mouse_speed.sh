# Configures xinput mouse acceleration speed, allowing for lower sensitivities
# than typically available in the mouse config interface.
MOUSE=$(xinput | grep -i mouse | grep -Po '(id=)(\d+)' | grep -m 1 -Po '\d+')
xinput --set-prop $MOUSE 'libinput Accel Speed' -0.8
