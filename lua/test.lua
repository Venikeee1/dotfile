--TODO: hide API key
local key = "a5e81dd0-9cc6-4367-89a8-5d44c3fc7a60"
local chrId = "3978"
local currencyResult

local M = {}

vim.keymap.set("n", "<leader>o", function()
	local buf = vim.api.nvim_create_buf(false, true)
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "cursor",
		width = 80,
		height = 7,
		row = 7,
		col = 7,
		style = "minimal",
		border = "rounded",
	})
	local path = 'curl -s -H "X-CMC_PRO_API_KEY: '
		.. key
		.. '" -H "Accept: application/json" -d "id='
		.. chrId
		.. '" -G https://pro-api.coinmarketcap.com/v2/cryptocurrency/quotes/latest'

	if currencyResult == nil then
		local h = io.popen(path)
		if h == nil then
			return
		end

		local rawdata = h:read("all")
		h:close()
		currencyResult = vim.json.decode(rawdata)
	end

	local h = io.popen(path)

	if h == nil then
		return
	end

	local chrPrice = currencyResult.data[tostring(chrId)].quote.USD.price
	-- print(vim.inspect(data))
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "Chr price" })
	vim.api.nvim_buf_set_lines(buf, 1, -1, false, { tostring(chrPrice) })
	vim.api.nvim_buf_set_option(buf, "readonly", true)
	vim.api.nvim_buf_set_option(buf, "modifiable", false)

	vim.keymap.set("n", "q", function()
		vim.api.nvim_buf_delete(0, { force = true })
	end, { noremap = true, desc = "Print selected text" })
end, { noremap = true, desc = "Open float window" })

-- show debug messages
vim.keymap.set("n", "<leader>mm", function()
	-- run lua messages
	vim.cmd("messages")
end, { noremap = true, desc = "Print selected text" })

return M

-- -- Function to return visual selection (for use in other functions)
-- local function return_visual_selection()
-- 	return get_visual_selection()
-- end
--
-- -- Example mappings
-- -- Print the selected text
-- vim.keymap.set("v", "<leader>q", function()
-- 	print(copy_visual_selection())
-- end, { noremap = true, desc = "Print selected text" })
--
-- -- Copy selected text to clipboard
-- vim.keymap.set("v", "<leader>y", function()
-- 	copy_visual_selection()
-- end, { noremap = true, desc = "Copy selected text to clipboard" })
--

-- local h = io.popen("wget -qO- https://jsonplaceholder.typicode.com/todos/1")
-- if h ~= nil then
-- 	local rawdata = h:read("all")
-- 	h:close()
-- 	local t = vim.json.decode(rawdata)
-- 	print(vim.inspect(t))
-- 	print("Error")
-- end
--
-- local function get_next_match_position(pattern)
--   local pos = vim.fn.searchpos(pattern, "n") -- "n" flag: Next match without moving the cursor
--   if pos[1] == 0 and pos[2] == 0 then
--     return nil -- No match found
--   end
--   return { row = pos[1], col = pos[2] }
-- end
-- vim.keymap.set("n", "mm", function()
-- 	local post = get_next_match_position("post")
-- end, { noremap = true, desc = "Print selected text" })

-- open float window

-- local function dump(o)
-- 	if type(o) == "table" then
-- 		local s = "{ "
-- 		for k, v in pairs(o) do
-- 			if type(k) ~= "number" then
-- 				k = '"' .. k .. '"'
-- 			end
-- 			s = s .. "[" .. k .. "] = " .. dump(v) .. ","
-- 		end
-- 		return s .. "} "
-- 	else
-- 		return tostring(o)
-- 	end
-- end
--
-- local function get_visual_selection()
-- 	-- Get the start and end positions of the visual selection
-- 	local s_start = vim.fn.getpos("'<")
-- 	local s_end = vim.fn.getpos("'>")
--
-- 	-- Get the line numbers
-- 	local start_line = s_start[2]
-- 	local end_line = s_end[2]
--
-- 	-- Get the column positions (byte index)
-- 	local start_col = s_start[3]
-- 	local end_col = s_end[3]
--
-- 	-- Handle selection mode (charwise, linewise, blockwise)
-- 	local mode = vim.fn.visualmode()
--
-- 	-- Get the selected lines
-- 	local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
--
-- 	-- Handle the selection based on mode
-- 	if #lines == 0 then
-- 		return ""
-- 	elseif #lines == 1 then
-- 		-- Single line selection
-- 		lines[1] = string.sub(lines[1], start_col, end_col)
-- 	else
-- 		-- Multi-line selection
-- 		lines[1] = string.sub(lines[1], start_col)
-- 		lines[#lines] = string.sub(lines[#lines], 1, end_col)
-- 	end
--
-- 	-- Join the lines and return
-- 	return table.concat(lines, "\n")
-- end
--
-- -- Function to copy visual selection to clipboard
-- local function copy_visual_selection()
-- 	local text = get_visual_selection()
-- 	vim.fn.setreg("+", text)
-- 	vim.notify("Selected text copied to clipboard", vim.log.levels.INFO)
-- 	return text
-- end
