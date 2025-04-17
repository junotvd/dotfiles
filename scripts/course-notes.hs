{-# LANGUAGE OverloadedStrings #-}

import Turtle hiding (sort)
import qualified Data.List as List
import qualified Control.Foldl as Fold
import System.Directory
import System.FilePath
import System.Environment (getEnv)
import System.Process (readProcess, callProcess)
import Data.List (sort, isSuffixOf)
import Data.Maybe (fromMaybe)
import qualified Data.Text as T

main :: IO ()
main = do
    home <- getEnv "HOME"
    let rofiTheme = home </> "dotfiles/rofi/black-white-selector.rasi"
        rofiArgs = ["-dmenu", "-i", "-theme", rofiTheme]

    semester <- runRofi rofiArgs "semester" ["2", "1"]
    case semester of
        Nothing -> exitSuccess
        Just sem -> do
            let baseDir = home </> "uni/bachelor-1/semester-" ++ sem
            exists <- doesDirectoryExist baseDir
            if not exists
                then callProcess "rofi" ["-e", "Semester path not found: " ++ baseDir]
                else do
                    courseDirs <- listDirs baseDir
                    let courses = List.sort courseDirs ++ ["planning"]

                    course <- runRofi rofiArgs "Course" courses
                    case course of
                        Nothing -> exitSuccess
                        Just "planning" -> do
                            let pdfFile = baseDir </> "planning.pdf"
                            fileExists <- doesFileExist pdfFile
                            if fileExists
                                then openPdf pdfFile
                                else callProcess "rofi" ["-e", "No planning.pdf found in " ++ baseDir]
                        Just selectedCourse -> do
                            let coursePath = baseDir </> selectedCourse
                            subdirs <- listDirs coursePath
                            subdir <- runRofi rofiArgs "Option" (List.sort subdirs)
                            case subdir of
                                Nothing -> exitSuccess
                                Just sub -> do
                                    let finalPath = coursePath </> sub
                                    pdfs <- listPdfs finalPath
                                    case pdfs of
                                        [] -> callProcess "rofi" ["-e", "No pdf files found in " ++ finalPath]
                                        [single] -> openPdf single
                                        multiple -> do
                                            choices <- mapM formatPdfChoice multiple
                                            choice <- runRofi rofiArgs "Choose pdf" choices
                                            case choice of
                                                Nothing -> exitSuccess
                                                Just display -> do
                                                    let cleanName = takeWhile (/= '(') display
                                                        finalFile = finalPath </> (trim cleanName ++ ".pdf")
                                                    openPdf finalFile

-- Helpers --

runRofi :: [String] -> String -> [String] -> IO (Maybe String)
runRofi args prompt options = do
    let fullArgs = args ++ ["-p", prompt]
    res <- readProcess "rofi" fullArgs (unlines options)
    return $ if null (trim res) then Nothing else Just (trim res)

listDirs :: FilePath -> IO [String]
listDirs path = do
    contents <- listDirectory path
    filterM (\name -> doesDirectoryExist (path </> name)) contents

listPdfs :: FilePath -> IO [FilePath]
listPdfs dir = do
    files <- listDirectory dir
    let pdfs = [dir </> f | f <- files, ".pdf" `isSuffixOf` f]
    return $ List.sort pdfs

formatPdfChoice :: FilePath -> IO String
formatPdfChoice path = do
    let name = takeBaseName path
    modTime <- getModificationTime path
    let formattedDate = formatTime defaultTimeLocale "%d-%m-%Y" modTime
    return $ name ++ " (" ++ formattedDate ++ ")"

openPdf :: FilePath -> IO ()
openPdf path = do
    viewer <- fromMaybe "xdg-open" <$> lookupEnv "PDF_VIEWER"
    callProcess viewer [path]

trim :: String -> String
trim = T.unpack . T.strip . T.pack
