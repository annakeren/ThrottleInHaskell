import Control.Monad  
--import Control.Monad.State
import Data.Char  
import Counter
  
main = forever $ do  

    let times = [0]
    putStr "Give me some input: "  
    l <- getLine  
    currentTime <-  Counter.currentTime
--    let push1 = runState (push currentTime) []
    let stack = []
    let ((),newStack1)=push currentTime stack
    print currentTime
    let (a, newStack2)=pop newStack1
    print a
--    print push1
--    let lastRequestTime = runState pop

--    let ellapsed =  Counter.timeEllapsed currentTime currentTime
--    let ellapsed =  Counter.timeEllapsed lastRequestTime currentTime
--    let lastTime = currentTime
--    print ellapsed

type Stack = [Int]

pop :: Stack -> (Int,Stack)
pop (x:xs) = (x,xs)

push :: Int -> Stack -> ((),Stack)
push a xs = ((),a:xs)
