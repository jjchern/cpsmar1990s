rm(list = ls())
library(magrittr)
library(dplyr)
library(R.utils)
library(haven)
library(devtools)
library(stringr)
library(readstata13)
library(foreign)

# Download the zipfile and Stata do file from IPUMS website
# Put them in the data-raw folder

# 1990s --------------------------------------------------------------------
# The raw data file: cps_00019.dat.gz is downloaded from IPUMS
# Sample: 1990-1999
# Variables: All available variables from IPUMS

raw = "cps_00019.dat.gz"
raw.do = "cps_00019.do"

cd("data-raw")
gunzip(raw)
raw.do = readLines(raw.do)
#label_vec = cps_00013.do %>% str_detect("^label")
#cps_00013.do = cps_00013.do[-which(label_vec)]

# Edit the do-file, convert the raw data to dta file, and load into memory ---

dat_dir = paste0("cd ", file.path(PROJHOME), "/data-raw")
dat_dir

data_frame(do = raw.do) %>%
  mutate(emptyCell = ifelse(`do` == "", 1, 0)) %>%
  mutate(emptyCell = cumsum(emptyCell)) %>%
  mutate(do = ifelse(emptyCell == max(emptyCell) - 1, "compress", do)) %>%
  mutate(do = ifelse(emptyCell == max(emptyCell), "save cpsmar1990s, replace", do)) %>%
  mutate(emptyCell = cumsum(emptyCell)) %>%
  mutate(do = ifelse(emptyCell == 1, dat_dir, do)) %>%
  select(-emptyCell) -> raw.do

raw.do[['do']] %>%
  writeLines("cpsmar1990s.do")

system("/Applications/Stata/StataSE.app/Contents/MacOS//stata-se -b cpsmar1990s.do")
cpsmar1990s = read_dta("cpsmar1990s.dta")

# Create rda files in the data directory -----------------------------

cpsmar1990 = cpsmar1990s %>% filter(year == 1990)
use_data(cpsmar1990, overwrite = TRUE)

cpsmar1991 = cpsmar1990s %>% filter(year == 1991)
use_data(cpsmar1991, overwrite = TRUE)

cpsmar1992 = cpsmar1990s %>% filter(year == 1992)
use_data(cpsmar1992, overwrite = TRUE)

cpsmar1993 = cpsmar1990s %>% filter(year == 1993)
use_data(cpsmar1993, overwrite = TRUE)

cpsmar1994 = cpsmar1990s %>% filter(year == 1994)
use_data(cpsmar1994, overwrite = TRUE)

cpsmar1995 = cpsmar1990s %>% filter(year == 1995)
use_data(cpsmar1995, overwrite = TRUE)

cpsmar1996 = cpsmar1990s %>% filter(year == 1996)
use_data(cpsmar1996, overwrite = TRUE)

cpsmar1997 = cpsmar1990s %>% filter(year == 1997)
use_data(cpsmar1997, overwrite = TRUE)

cpsmar1998 = cpsmar1990s %>% filter(year == 1998)
use_data(cpsmar1998, overwrite = TRUE)

cpsmar1999 = cpsmar1990s %>% filter(year == 1999)
use_data(cpsmar1999, overwrite = TRUE)

# Delete generated files ---------------------------------------------

unlink("cpsmar1990s.log")
unlink("cpsmar1990s.do")
unlink("cpsmar1990s.dta")
unlink("cps_00019.dat")

# Clean environment ----------------------------------------
rm(list = ls())
