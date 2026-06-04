local tui_state = {
	buf = nil,
	win = nil
}

local default_opts = {
	width = 0.35,
	height = 0.35,
	position = "center",
	border = "single",
	target_file = "~/.config/nvim/lua/yae/godotdevtui/commands.md"
}

local G = {}

local function expand_path(path)
	if path:sub(1, 1) == "~" then
		return os.getenv("HOME") .. path:sub(2)
	end
	return path
end

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
	local width = math.max(math.floor(vim.o.columns * opts.width), 64)
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
	if tui_state.win and vim.api.nvim_win_is_valid(tui_state.win) then
		vim.api.set_current_win(tui_state.win)
		return
	end

	local expanded_path = expand_path(opts.target_file)

	if vim.fn.filereadable(expanded_path) == 0 then
		vim.notify("No se encontró el archivo " .. expanded_path, vim.log.levels.ERROR)
		return
	end

	tui_state.buf = vim.fn.bufnr(expanded_path, true)

	if tui_state.buf == -1 then
		tui_state.buf = vim.api.nvim_create_buf(false, false)
		vim.api.nvim_buf_set_name(tui_state.buf, expanded_path)
	end

	vim.bo[tui_state.buf].swapfile = false
	vim.bo[tui_state.buf].modifiable = false
	vim.bo[tui_state.buf].readonly = true

	tui_state.win = vim.api.nvim_open_win(tui_state.buf, true, set_config(opts))

	vim.wo[tui_state.win].number = false
	vim.wo[tui_state.win].relativenumber = false
	vim.wo[tui_state.win].wrap = true

	vim.api.nvim_buf_set_keymap(tui_state.buf, "n", "q", "", {
		noremap = true,
		silent = true,
		callback = function()
			vim.api.nvim_win_close(0, true)
			tui_state.win = nil
		end
	})

	vim.api.nvim_buf_set_keymap(tui_state.buf, "n", "r", ":! godot<CR>", { noremap = true, silent = true })
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
