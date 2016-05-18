# factorio-mod-template

Some quick notes for experienced programmers that I had to figure out the hard way. If you're not an experienced programmer, this might actually just confuse you more. It's hard to say.

[This post](https://forums.factorio.com/viewtopic.php?f=25&t=4858) and [this wiki article](https://wiki.factorio.com/index.php?title=Lua_objects) are by far the best resources for documentation on Factorio modding. If that doesn't work, you can try the [official docs](http://lua-api.factorio.com/), but they're pretty bad.

`print()` doesn't work. You need to get a player entity from the game (`game.local_player` is probably good) and call `.print()` on that. Also you have to manually `tostring()` everything before printing, but that's Lua's fault, not the devs'.

To run Lua code in the game, type tilde/grave (the \`/~ key) and use the /c command. For example, `<tilde>/c a = 1337`. Unfortunately, this doesn't work like a REPL. To get it to print something out for you, you need to use `<tilde>/c game.local_player.print(tostring(foo))`. And even then, it won't print out tables for you. Such is the joy of Lua.

If you have basically any kind of Factorio-related object, you can get a help string through `foo.help()`. You still need to print that string out, though.

So for the most part, mods really just call `data:add()` and nothing else. `data`, I think, is a gigantic table of every single thing in the game. Recipes, items, entities, etc. You can `:add()` to that table to create your own items and entities, but you don't get much control over them if you do that. You can make a turret that runs on water or a solar panel that uses power instead of producing it, but you can't do much more than that. You can't, for example, make a PID controller or a cake item that heals health. You can only slightly modify existing items and entities.

Factorio mods have a few 'magic lua files', as I call them. These get run by the game at various times. I still have yet to figure most of them out, but data.lua seems to be run at the very start of the game. As in, at the loading bar before the title menu. When it says 'loading mods', that's at least one of the things it's doing. data.lua is (mostly?) for lua files that just do `data:add()` stuff. In data.lua, you probably just want a whole bunch of `require` lines and nothing else. Factorio objects like `game` and `script` aren't defined yet when data.lua gets run. There's also `control.lua`, which you do **not** `require` in data.lua. If you do, you'll get an error because `game` (or whatever you first referenced) isn't defined.

Also I've seen a few mods where there are just random lua files hangin' out with no data.lua or control.lua to run them. So I guess those get run too, at some point. No idea. Maybe control.lua is run the same way, and it's just a convention thing to call it control.lua.
