-- how to run :load "<PathTo>/Stack.hs"
module Stack
(pop, push)where
type Stack = [Int]

pop :: Stack -> (Int,Stack)
pop [] = (0,[])
pop (x:xs) = (x,xs)

push :: Int -> Stack -> ((),Stack)
push a xs = ((),a:xs)
