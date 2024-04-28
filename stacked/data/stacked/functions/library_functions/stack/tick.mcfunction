#puts the stack into a universal data bank and clears it to avoid using more macros than needed
$data modify storage stacked:current_stack stack set from storage stacked:stack_tick_$(current_tick) stack
$data remove storage stacked:stack_tick_$(current_tick) stack
execute if data storage stacked:current_stack stack[0] run say test $(current_tick)
execute if data storage stacked:current_stack stack[0] run function stacked:library_functions/stack/run_all