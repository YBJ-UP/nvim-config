local state = {
	buf = nil,
	win = nil,
	is_open = false
}

local api = vim.api

local spawnOnBot = {
	split = 'below',
	win = -1,
	height = 20
}

local default_opts = {
	close_on_leave = false,
	term_opts = {
		split = "below",
		win = -1,
		height = 20
	}
}

local G = {}

local function set_config()
	print("lol")
end

local function open_term(opts)
	-- se cierra si ya está abierta y es válida, para que sea como toggle
	if state.is_open and api.nvim_win_is_valid(state.win) then
		api.nvim_win_close(state.win, false)
	end

	if not state.buf or not api.nvim_buf_is_valid(state.buf) then
		state.buf = api.nvim_create_buf(false, true)
		vim.bo[state.buf].bufhidden = 'hide'
	end

	state.win = api.nvim_open_win(state.buf, true, opts.term_opts)

	local has_term = false
	local lines = api.nvim_buf_get_lines(state.buf, 0, -1, false)
	for _, line in ipairs(lines) do
		if line ~= "" then
			has_term = true
			break
		end
	end

	if not has_term then
		vim.fn.termopen(os.getenv("SHELL"))
	end

	state.is_open = true
	vim.cmd("startinsert")

	if opts.close_on_leave then
		api.nvim_create_autocmd("BufLeave", {
			buffer = state.buf,
			callback = function()
				if state.is_open and api.nvim_win_is_valid(state.win) then
					api.nvim_win_close(state.win, false)
					state.is_open = false
				end
			end,
			once = true
		})
	end
end

local function setup_user_commands(opts)
	opts = vim.tbl_deep_extend("force", default_opts, opts or {})

	api.nvim_create_user_command("Ola", function()
		open_term(opts)
	end, {})

	vim.keymap.set("t", "<Esc>", function()
		if state.is_open then
			api.nvim_win_close(state.win, false)
			state.is_open = false
		end
	end, { noremap = true, silent = true })
end

G.setup = function(opts)
	setup_user_commands(opts)
end

return G
