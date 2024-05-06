# Stacked
Stacked is a datapack library that allows you to schedule functions for future ticks without them forgetting context. (Spesifically the entity running the function and positional data)
This was made in an afternoon so forgive if its not the best thing ever to exist but it still works well and won't cause much lag under most circumstances.

# How to schedule a function
To add a function to the stack you have to call the `stacked:assemble` function with the following arguments set.

> save_entity : <0/1> (If the stack remembers what entity is execting the command. If the context entity no longer exists when the stack attempts to execute the function this will fail to execute. This uses a score based system via the stacked.entity_id score so refrain from interfeiring with it in any way.)

> function : <string> (This is the function the stack will attempt to execute with the context it remembers.)

> delay : <int> (The delay in ticks before the function is executed. Do not set this to any number less than 1. Doing so will not break the game but it will not work and will result in data being stored that will never be used or cleared.)

Note that all functions on the stack remember position and rotation by defualt.

> Example of using the datapack
````mcfunction stacked_user:example
function stacked:assemble {save_entity:1,function:"stacked:test",delay:32}
````
> In this example the datapack will run the function stacked:test in 32 ticks and will remember what entity used it

Note that for the process of saving dimensions custom dimensions are not supported by default. In order to add support for your custom dimensions just do the following.
> Create a function that tests if you are in the dimension.
````mcfunction
execute if dimension mydatapack:my_dimension run data modify storage stacked:generic building_event.dimension set value "mydatapack:my_dimension"
````
> Add said function to the `stacked_user/tags/functions/dim_test_functions.json` tag.
````json
{ "replace":  false , "values" : ["mydatapack:dimension_test"]}
````

>Also funny note: After 4,294,967,296 entities have existed at some point the pack's entity id system will technically loop in on itself. I could fix this at the cost of performence but given that this would take approxamitly 7 years of spawning around 20 mobs every second constantly im going to elect not to worry about it all that much as by then everyone will probobly have forgotten that this exists.
