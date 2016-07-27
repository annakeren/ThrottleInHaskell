import Control.Monad
import Control.Monad.State
import Data.Char
import qualified Data.Map as M
import Counter

main = forever $ do

    let times = [0]
    putStr "Give me some input: "
    l <- getLine
    currentTime <-  Counter.currentTime

--    let push1 = push currentTime 0
--    print currentTime
--    print push1
    --let popped = runState (pop)

    print $ xrun test
    let ellapsed =  Counter.timeEllapsed currentTime currentTime
    let lastTime = currentTime
    print ellapsed

type Stack = [Int]


type MyMap a = M.Map Int a
type MyState a b = State (MyMap a) b
type MyRef = Int

xrun :: MyState a b -> b
xrun x = evalState x (M.empty)

mget :: MyState a (MyMap a)
mget = get

mput :: MyMap a -> MyState a ()
mput = put

mmodify :: (MyMap a -> MyMap a) -> MyState a ()
mmodify x = modify x

xnew :: s -> MyState s MyRef
xnew val = do
    s <- mget
    let newRef = if M.null s then 0 else fst (M.findMax s) + 1
    mput $ M.insert newRef val s
    return newRef

xset :: MyRef -> a -> MyState a ()
xset ref val = modify $ M.insert ref val

xget :: MyRef -> MyState a a
xget ref = fmap (\s -> case M.lookup ref s of Just v -> v) get


test :: MyState Int Int
test = do
  x1 <- xnew 2
  xset x1 3
  x2 <- xget x1
  y1 <- xnew 10
  xset y1 20
  y2 <- xget y1
  return (x2 + y2)

--pop :: State Stack Int
--pop = do
-- x:xs <- get
-- put xs
-- return x
--
--push :: Int -> State Stack ()
--push a = do
-- xs <- get
-- put (a:xs)
-- return ()
--
--popInt :: State Stack Int
--popInt = do
--    a <- pop
--    return a
