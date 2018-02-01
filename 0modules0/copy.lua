function copy(orig)
    local orig_type = type(orig)
    local theCopy
    if orig_type == 'table' then
        theCopy = {}
        for orig_key, orig_value in pairs(orig) do
            local orig_value_type = type(orig_value)
            if orig_value_type == 'table' then
              local orig_value_copy = copy(orig_value)
              theCopy[orig_key] = orig_value_copy
            else
            theCopy[orig_key] = orig_value
            end
        end
    else -- number, string, boolean, etc
        theCopy = orig
    end
    return theCopy
end

return copy
