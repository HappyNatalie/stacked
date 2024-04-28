execute store result score %id% stacked.entity_id run data get storage stacked:current_stack stack[0].entity_id
execute if score %id% stacked.entity_id matches -1 run function stacked:library_functions/stack/run_without_entity with storage stacked:current_stack stack[0]
execute unless score %id% stacked.entity_id matches -1 run function stacked:library_functions/stack/run_with_entity with storage stacked:current_stack stack[0]
#removes the stack that just ran
data remove storage stacked:current_stack stack[0]
#loops if there is more data on the stack
execute if data storage stacked:current_stack stack[0] run function stacked:library_functions/stack/run_all
