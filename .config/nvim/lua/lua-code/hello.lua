local arr = { 1, 2, 3, 4, 5, 2, 3, 4, 5 }
local set = {}
for _, v in ipairs(arr) do
  set[v] = true
end
local new_arr = {}
for k in pairs(set) do
  table.insert(new_arr, k)
end
print(table.concat(new_arr, ", "))
