-- how to run :load "<PathTo>/Counter.hs"
module Counter
(timeEllapsed, currentTime)where
import Data.Time
import Data.Time.Clock.POSIX
timeEllapsed::Int->Int->Bool
timeEllapsed lastRequestTime currentRequestTime
 | currentRequestTime - lastRequestTime > 15 = True
 | otherwise = False

currentTime::IO Int
currentTime=round `fmap` getPOSIXTime


