local M = {}

M.with_pad_seps = function(component)
  local hl = component.hl
  local pad_sep = { str = " ", hl = hl }

  if component.left_sep then
    if not (type(component.left_sep) == "table" and type(component.left_sep[0]) == "table") then
      component.left_sep = { component.left_sep }
    end

    table.insert(component.left_sep, pad_sep)
  else
    component.left_sep = pad_sep
  end

  if component.right_sep then
    if not (type(component.right_sep) == "table" and type(component.right_sep[0]) == "table") then
      component.right_sep = { component.right_sep }
    end

    table.insert(component.right_sep, 1, pad_sep)
  else
    component.right_sep = pad_sep
  end

  return component
end

return M
