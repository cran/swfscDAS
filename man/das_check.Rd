% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/das_check.R
\name{das_check}
\alias{das_check}
\title{Check DAS file}
\usage{
das_check(
  file,
  skip = 0,
  file.out = NULL,
  sp.codes = NULL,
  print.cruise.nums = TRUE
)
}
\arguments{
\item{file}{filename(s) of one or more DAS files}

\item{skip}{integer: see \code{\link[readr]{read_fwf}}. Default is 0}

\item{file.out}{filename to which to write the error log;
default is \code{NULL}}

\item{sp.codes}{character; filename of .dat file from which to read
accepted species codes. If \code{NULL}, species codes will not be checked.
Default is \code{NULL}}

\item{print.cruise.nums}{logical; indicates if a table with all the
cruise numbers in the \code{x} should be printed using
\code{\link[base]{table}}. Default is \code{TRUE}}
}
\value{
A data frame with columns: the file name, line number, cruise number,
'ID' (columns 4-39 from the DAS file), and description of the issue

If \code{file.out} is not \code{NULL}, then the error log data frame is also
written to \code{file.out} using \code{\link[utils:write.table]{write.csv}}

A warning is printed if any events are r events; see \code{\link{das_process}} for details about r events
}
\description{
Check that DAS file has accepted formatting and values
}
\details{
Precursor to a more comprehensive DASCHECK program.
This function checks that the following is true:
\itemize{
  \item Event codes are one of the following: #, *, ?, 1, 2, 3, 4, 5, 6, 7, 8,
    A, B, C, E, F, k, K, N, P, Q, r, R, s, S, t, V, W, g, G, p, X, Y, Z
  \item Latitude values are between -90 and 90 (inclusive; NA values are ignored)
  \item Longitude values are between -180 and 180 (inclusive; NA values are ignored)
  \item The effort dot matches effort determined using B, R, and E events
  \item There are an equal number of R and E events, and they alternate occurrences
  \item A BR event series or R event does not occur while already on effort
  \item An E event does not occur while already off effort
  \item All Data# columns for non-C events are right-justified
  \item Only C events have data past the 99th column in the DAS file
  \item The following events have NA (blank) Data# columns: *
  \item All of  *, B, R, E, V, W, N, P, and Q events have NA Data# columns
    where specified (see format pdf for more details)
  \item Event/column pairs meet the following requirements:
}

\tabular{llll}{
  \emph{Item}              \tab \emph{Event}  \tab \emph{Column}  \tab \emph{Requirement}                                                        \cr
  Cruise number            \tab B             \tab Data1          \tab Can be converted to a numeric value                                       \cr
  Mode                     \tab B             \tab Data2          \tab Must be one of C, P, c, p, or NA (blank)                                  \cr
  Echo sounder             \tab B             \tab Data4          \tab Must be one of Y, N, y, n, or NA (blank)                                  \cr
  Effort type              \tab R             \tab Data1          \tab Must be one of F, N, S, or NA (blank)                                     \cr
  ESW sides                \tab R             \tab Data2          \tab Effective strip width; must be one of F, H, or NA (blank)                 \cr
  Course                   \tab N             \tab Data1          \tab Can be converted to a numeric value                                       \cr
  Speed                    \tab N             \tab Data2          \tab Can be converted to a numeric value                                       \cr
  Beaufort                 \tab V             \tab Data1          \tab Must be a whole number between 0 and 9                                    \cr
  Swell height             \tab V             \tab Data2          \tab Can be converted to a numeric value                                       \cr
  Wind speed               \tab V             \tab Data5          \tab Can be converted to a numeric value                                       \cr
  Rain or fog              \tab W             \tab Data1          \tab Must be between 0 and 5 and either a whole number or have decimal value .5\cr
  Horizontal sun           \tab W             \tab Data2          \tab Must be a whole number between 0 and 12                                   \cr
  Vertical sun             \tab W             \tab Data3          \tab Must be a whole number between 0 and 12                                   \cr
  Visibility               \tab W             \tab Data5          \tab Can be converted to a numeric value                                       \cr
  Sighting (mammal)        \tab S, K, M       \tab Data3-7        \tab Can be converted to a numeric value                                       \cr
  Sighting (mammal)        \tab G             \tab Data5-7        \tab Can be converted to a numeric value                                       \cr
  Sighting cue (mammal)    \tab S, K, M       \tab Data3          \tab Must be a whole number between 1 and 6                                    \cr
  Sighting method (mammal) \tab S, K, M, G    \tab Data4          \tab Must be a whole number between 1 and 7                                    \cr
  Bearing (mammal)         \tab S, K, M, G    \tab Data5          \tab Must be a whole number between 0 and 360                                  \cr
  Photos                   \tab A             \tab Data3          \tab Must be one of N, Y, n, y, or NA (blank)                                  \cr
  Birds                    \tab A             \tab Data4          \tab Must be one of N, Y, n, y, or NA (blank)                                  \cr
  Calibration school       \tab S, K, M       \tab Data10         \tab Must be one of N, Y, n, y, or NA (blank)                                  \cr
  Aerial photos taken      \tab S, K, M       \tab Data11         \tab Must be one of N, Y, n, y, or NA (blank)                                  \cr
  Biopsy taken             \tab S, K, M       \tab Data12         \tab Must be one of N, Y, n, y, or NA (blank)                                  \cr
  Species codes            \tab A             \tab Data5-8        \tab If a species codes file is provided, must be one of the provided codes    \cr
  Resight                  \tab s, k          \tab Data2-5        \tab Can be converted to a numeric value                                       \cr
  Turtle species           \tab t             \tab Data2          \tab If a species codes file is provided, must be one of the provided codes    \cr
  Turtle sighting          \tab t             \tab Data3-5, 7     \tab Can be converted to a numeric value                                       \cr
  Turtle JFR               \tab t             \tab Data6          \tab Must be one of F, J, N, R, or NA (blank)                                  \cr
  Fishing vessel           \tab F             \tab Data2-4        \tab Can be converted to a numeric value                                       \cr
  Sighting info            \tab 1-8           \tab Data2-8        \tab Can be converted to a numeric value                                       \cr
  Sighting info            \tab 1-8           \tab Data9          \tab The Data9 column must be NA (blank) for events 1-8
}

In the table above, 'between' means inclusive.

Long-term items, and checks that are not performed:
\itemize{
  \item Check that datetimes are sequential, meaning they
    1) are the same as or 2) come after the previous event
  \item Check that A events only come immediately after a G/S/K/M event,
    and all G/S/K/M events have an A after them.
    And that each has at least one group size estimate (1:8 event)
}
}
\examples{
y <- system.file("das_sample.das", package = "swfscDAS")
if (interactive()) das_check(y)

}
