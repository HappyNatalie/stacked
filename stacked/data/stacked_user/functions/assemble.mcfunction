#clears out the data tag the event is stored in
data remove storage stacked:generic building_event
#figures out what storage the event should be stored in
execute store result score %time% stacked.isactive run time query gametime
$scoreboard players add %time% stacked.isactive $(delay)
execute store result storage stacked:generic time int 1 run scoreboard players get %time% stacked.isactive
#saves pos/context/rotation
execute summon marker run function stacked:library_functions/assembly/save_pos
execute positioned ^ ^ ^10 summon marker run function stacked:library_functions/assembly/save_rot
#saves function name
$data modify storage stacked:generic building_event.function set value "$(function)"
#saves player id
$execute if score %true% stacked.isactive matches $(save_entity) run scoreboard players operation %id% stacked.isactive = @s stacked.entity_id
$execute if score %false% stacked.isactive matches $(save_entity) run scoreboard players set %id% stacked.isactive -1
execute store result storage stacked:generic building_event.entity_id int 1 run scoreboard players get %id% stacked.isactive
#saves this event to the stack
function stacked:library_functions/assembly/save_event with storage stacked:generic
