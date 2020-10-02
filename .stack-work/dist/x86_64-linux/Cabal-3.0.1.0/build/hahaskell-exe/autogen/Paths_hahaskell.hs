{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_hahaskell (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/kristofferberg/Vippsprojects/hahaskell/.stack-work/install/x86_64-linux/65ad6444dfe5e3018332392f94f4984e5659ae2ca969796844b78974c25b29aa/8.8.4/bin"
libdir     = "/home/kristofferberg/Vippsprojects/hahaskell/.stack-work/install/x86_64-linux/65ad6444dfe5e3018332392f94f4984e5659ae2ca969796844b78974c25b29aa/8.8.4/lib/x86_64-linux-ghc-8.8.4/hahaskell-0.1.0.0-DgivjRI3YGjKSTC8x8yWpV-hahaskell-exe"
dynlibdir  = "/home/kristofferberg/Vippsprojects/hahaskell/.stack-work/install/x86_64-linux/65ad6444dfe5e3018332392f94f4984e5659ae2ca969796844b78974c25b29aa/8.8.4/lib/x86_64-linux-ghc-8.8.4"
datadir    = "/home/kristofferberg/Vippsprojects/hahaskell/.stack-work/install/x86_64-linux/65ad6444dfe5e3018332392f94f4984e5659ae2ca969796844b78974c25b29aa/8.8.4/share/x86_64-linux-ghc-8.8.4/hahaskell-0.1.0.0"
libexecdir = "/home/kristofferberg/Vippsprojects/hahaskell/.stack-work/install/x86_64-linux/65ad6444dfe5e3018332392f94f4984e5659ae2ca969796844b78974c25b29aa/8.8.4/libexec/x86_64-linux-ghc-8.8.4/hahaskell-0.1.0.0"
sysconfdir = "/home/kristofferberg/Vippsprojects/hahaskell/.stack-work/install/x86_64-linux/65ad6444dfe5e3018332392f94f4984e5659ae2ca969796844b78974c25b29aa/8.8.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "hahaskell_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "hahaskell_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "hahaskell_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "hahaskell_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hahaskell_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hahaskell_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
