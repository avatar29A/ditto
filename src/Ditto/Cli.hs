module Ditto.Cli where
import Ditto.Syntax
import Ditto.Parse
import Ditto.Check
import Options.Applicative

----------------------------------------------------------------------

data Options = Options
  { optFilename :: String
  , optVerbosity :: Verbosity
  }
  deriving (Show, Read, Eq)  

----------------------------------------------------------------------

parseOptions :: Parser Options
parseOptions = Options
   <$> strOption
       ( long "check"
      <> short 'c'
      <> metavar "FILENAME"
      <> help "Type check FILENAME" )
   <*> flag Normal Verbose
       ( long "verbose"
      <> short 'v'
      <> help "Enable verbose mode" )

menu :: ParserInfo Options
menu = info (helper <*> parseOptions)
  ( fullDesc
  <> progDesc "Type check FILENAME"
  <> header "Ditto - your warm and fuzzy dependent type checker!"
  )

runCli :: IO ()
runCli = do
  opts <- execParser menu
  code <- readFile (optFilename opts)
  case parseP code of
    Left e -> putStrLn (show e)
    Right ds -> case runCheckProg (optVerbosity opts) ds of
      Left e -> putStrLn e
      Right () -> return ()

----------------------------------------------------------------------

