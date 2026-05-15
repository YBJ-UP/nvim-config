local tui_state = {
	buf = nil,
	win = nil
}

local default_opts = {
	width = 0.8,
	height = 0.8,
	position = "center",
	border = "single"
}

local G = {}

local function calculate_pos(pos)
	local posx, posy = 0.5, 0.5

	if pos == "center" then
		posx, posy = 0.5, 0.5
	elseif pos == "topleft" then
		posx, posy = 0, 0
	end

	return posx, posy
end

local function set_config(opts)
	local width = math.min(math.floor(vim.o.columns * opts.width), 64)
	local height = math.floor(vim.o.lines * opts.height)

	local posx, posy = calculate_pos(opts.position)

	local col = math.floor((vim.o.columns - width) * posx)
	local row = math.floor((vim.o.lines - height) * posy)

	return {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		border = opts.border
	}
end

local function open_floating_window(opts)
	if not tui_state.buf or not vim.api.nvim_buf_is_valid(tui_state.buf) then
		tui_state.buf = vim.api.nvim_create_buf(false, true)
	end

	print("test")
	tui_state.win = vim.api.nvim_open_win(tui_state.buf, true, set_config(opts))
end

local function setup_user_commands(opts)
	opts = vim.tbl_deep_extend("force", default_opts, opts or {})

	vim.api.nvim_create_user_command("Gdt", function()
		open_floating_window(opts)
	end, {})
end

G.setup = function(opts)
	setup_user_commands(opts)
end


return G

