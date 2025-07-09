local M = {}

local foldlevels = nil

M.markdown_foldexpr = function()
  local lnum = vim.v.lnum
  if foldlevels == nil then
    foldlevels = M.compute_fold_levels()
  end
  return foldlevels[lnum]
end

M.compute_fold_ranges = function()
  local header_ranges = {}
  local tree = vim.treesitter.get_parser():parse()[1]
  for level = 1, 6 do
    local ranges = {}
    local query = vim.treesitter.query.parse('markdown', string.format([[ (section (atx_heading (atx_h%s_marker)) ) @str ]], level))
    for _, node, _ in query:iter_captures(tree:root(), 0) do
      -- Print the node name and source text.
      -- vim.print { node:type(), vim.treesitter.get_node_text(node, vim.api.nvim_get_current_buf()) }
      local row_start, _, row_end, _ = node:range()
      table.insert(ranges, { row_start, row_end })
    end
    header_ranges[level] = ranges
  end
  local query = vim.treesitter.query.parse('markdown', [[ (minus_metadata) @str ]])
  for _, node, _ in query:iter_captures(tree:root(), 0) do
    local row_start, _, row_end, _ = node:range()
    table.insert(header_ranges[1], { row_start, row_end })
  end
  return header_ranges
end

M.compute_fold_levels = function()
  local header_ranges = M.compute_fold_ranges()
  -- print(vim.inspect(header_ranges))
  local line_count = vim.api.nvim_buf_line_count(0)
  foldlevels = {}
  for lnum = 1, line_count do
    foldlevels[lnum] = 0
  end
  for level, ranges in pairs(header_ranges) do
    for _, range in ipairs(ranges) do
      for lnum = range[1], range[2] do
        foldlevels[lnum] = level
      end
      foldlevels[range[1]] = level - 1
    end
  end
  for level, ranges in pairs(header_ranges) do
    for _, range in ipairs(ranges) do
      foldlevels[range[1]] = level - 1
    end
  end
  return foldlevels
end

M.inspect_fold_levels = function()
  local foldlevels = M.compute_fold_levels()
  for lnum, level in pairs(foldlevels) do
    local line_content = vim.api.nvim_buf_get_lines(0, lnum - 1, lnum, false)[1]
    print(lnum .. ' ' .. level .. ' ' .. (line_content or ''))
  end
end

return M
