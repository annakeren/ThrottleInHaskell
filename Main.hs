import Control.Monad
import Data.Char  
import Counter
import Stack
stack=[0]
main = forever $ do 
    currentTime <-  Counter.currentTime
    let ((),throttleStack) = push currentTime stack
    putStr "Give me some input: "
    l <- getLine
    newTime <- Counter.currentTime
    let (lastFromStack, _) = pop throttleStack
    let ellapsed = Counter.timeEllapsed lastFromStack newTime
    if (ellapsed == True)
        then putStrLn "time ellapsed"
        else putStrLn "time did not ellapse"
