## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(dplyr)
library(readr)
library(swfscDAS)

## ----das----------------------------------------------------------------------
y <- system.file("extdata", "das_sample.das", package = "swfscDAS")
y.proc <- das_process(y)
y.sight <- das_sight(y.proc, return.format = "default")

## ----dat----------------------------------------------------------------------
ships.df <- data.frame(read_fwf(
  system.file("extdata", "Ship_sample.dat", package = "swfscDAS"), 
  col_positions = fwf_widths(c(6, NA), col_names = c("Cruise", "Ship")),
  col_types = cols(Cruise = col_double(), Ship = col_character()),
  trim_ws = TRUE
), stringsAsFactors = FALSE)

spcodes.file <- system.file("extdata", "SpCodes.dat", package = "swfscDAS")
spcodes.df <- das_spcodes_read(spcodes.file)

## ----join---------------------------------------------------------------------
# Ship 
y.proc.ship <- left_join(y.proc, ships.df, by = "Cruise")

# Species code
y.sight.spcodes <- left_join(y.sight, spcodes.df, by = "SpCode")

