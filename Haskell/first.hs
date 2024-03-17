-- doubleme x = x + x
doubleme x y = x^2 + y^2 -- simple function
name = "Dick" -- simple string/variable
czy x = if x > 0 then x else -x -- if function

main :: IO () -- main function
-- main = print (doubleme 8 9) -- printing
main = print (czy (-3))