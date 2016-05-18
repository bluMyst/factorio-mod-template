-- Don't do this:
-- require "control"
-- If you require control from this file, it'll run before
-- variables like 'game' and 'script' are defined, and will
-- throw an error at you. Instead, just let it run on its own.
-- Apparently that's what happens. Factorio will run control.lua
-- in its own time, even if you don't require it in this file.

-- But for a lot of other files, you *do* have to require them in
-- 'data.moon'. I'm not totally sure which ones should be required
-- and which ones should be ignored. Maybe anything that uses
-- data:add should be required in 'data.moon'? That seems to
-- be the general theme from the examples I've seen so far.
