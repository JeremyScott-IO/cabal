import Test.Cabal.Prelude
import Control.Monad.IO.Class
import Data.Maybe
import System.Directory
-- Test for 'build-type: Configure' example from the setup manual.
main = cabalTest $ do
    hasAutoreconf <- liftIO $ fmap isJust $ findExecutable "autoreconf"
    skipUnless "no autoreconf" hasAutoreconf
    _ <- shell "autoreconf" ["-i"]
    cabal "v2-build" []
