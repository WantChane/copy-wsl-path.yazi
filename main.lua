local get_hovered_file_path = ya.sync(function()
	return cx.active.current.hovered and tostring(cx.active.current.hovered.url) or nil
end)

local function run_conversion(cmd, ...)
	local args = table.pack(...)
	local command = Command(cmd)
	for i = 1, args.n do
		command:arg(args[i])
	end

	local output = command:output()
	return output and output.status.success and output.stdout:gsub("\n$", "") or nil
end

local converters = {
	win = function(path)
		return run_conversion("wslpath", "-w", path)
	end,
	wsl = function(path)
		local wsl_path = path:gsub("\\", "/")
		return run_conversion("wsl", "wslpath", "-u", wsl_path)
	end,
}

return {
	entry = function(_, job)
		local path = get_hovered_file_path()
		if not path then
			return
		end

		local converter = converters[job.args[1]]
		if not converter then
			return
		end

		local converted = converter(path)
		if converted then
			ya.clipboard(converted)
		end
	end,
}
