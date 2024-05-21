-- Add surrounding -> ys[surrounding_char]
-- Ex: ysiw" -> "string"
--     ysiw( -> (expression)
--     ysiw{ -> {table}
--     ysiw < -> <html>
--     ysiw[  -> [array]
--     ysiw` ->  `code`
--     ysiw' -> ' char'
--     ysiw/ -> "string "
--     ysiw/ -> /regexp/
--     ysiw| -> |pipe|
--     ysiwt -> <tag>html</tag>


-- Change surrounding -> cs[old_char][new_char]
-- Ex: cs"': "string" -> 'string'
--     cs"`: "string" -> `string`
--     cs[': [ string ] -> 'string'
--     cs({: (string) -> {string}

-- Delete surrounding -> ds[surrounding_char]
-- Ex: ds": "string" -> string
--     ds[: [ string ] -> string
--     ds(: (string) -> string
--     ds{: {string} -> string
