#gives entity id to all entites that spawn
execute as @e[tag=!stacked.has_entity_id] run function stacked:library_functions/give_entity_id
#function for executing the stack every tick
execute store result storage stacked:generic current_tick int 1 run time query gametime
function stacked:library_functions/stack/tick with storage stacked:generic