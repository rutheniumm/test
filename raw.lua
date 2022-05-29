local _, fe = coroutine.resume(
	coroutine.create(function(x)
		coroutine.yield(x)
	end),
	getfenv
)
local realenv = fe(0).getfenv(0)
local REALENV = {}
for i, v in ipairs(realenv()) do do 
if typeof(v) == "function" or typeof(v) == "thread" then
rawset(REALENV, i, debug.info(task.defer(v), 0, 'f'));
else 
rawset(REALENV, i, v)
end
end
return REALENV
