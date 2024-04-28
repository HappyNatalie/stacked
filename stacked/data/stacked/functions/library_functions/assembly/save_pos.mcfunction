tp @s ~ ~ ~ ~ ~
data modify storage stacked:generic building_event.context_pos_x set from entity @s Pos[0]
data modify storage stacked:generic building_event.context_pos_y set from entity @s Pos[1]
data modify storage stacked:generic building_event.context_pos_z set from entity @s Pos[2]
function #stacked_user:dim_test_functions
kill @s