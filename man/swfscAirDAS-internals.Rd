% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/das_chop_condition.R, R/das_chop_equallength.R,
%   R/das_process.R, R/das_segdata.R, R/swfscDAS-internal.R
\name{swfscAirDAS-internals}
\alias{swfscAirDAS-internals}
\alias{.chop_condition_eff}
\alias{.chop_equallength_eff}
\alias{.process_num}
\alias{.process_chr}
\alias{.segdata_proc}
\alias{.segdata_aggr}
\alias{.dist_from_prev}
\title{Internal functions for swfscAirDAS}
\usage{
.chop_condition_eff(i, call.x, call.conditions, call.seg.min.km, call.func1)

.chop_equallength_eff(
  i,
  call.x,
  call.conditions,
  call.seg.km,
  call.r.pos,
  call.func1
)

.process_num(init.val, das.df, col.name, event.curr, event.na)

.process_chr(init.val, das.df, col.name, event.curr, event.na)

.segdata_proc(
  das.df,
  conditions,
  segdata.method,
  seg.lengths,
  section.id,
  df.out1
)

.segdata_aggr(data.list, curr.df, idx, dist.perc)

.dist_from_prev(
  z,
  z.distance.method = c("greatcircle", "lawofcosines", "haversine", "vincenty")
)
}
\arguments{
\item{i}{ignore}

\item{call.x}{ignore}

\item{call.conditions}{ignore}

\item{call.seg.min.km}{ignore}

\item{call.func1}{ignore}

\item{call.seg.km}{ignore}

\item{call.r.pos}{ignore}

\item{init.val}{ignore}

\item{das.df}{ignore}

\item{col.name}{ignore}

\item{event.curr}{ignore}

\item{event.na}{ignore}

\item{conditions}{ignore}

\item{segdata.method}{ignore}

\item{seg.lengths}{ignore}

\item{section.id}{ignore}

\item{df.out1}{ignore}

\item{data.list}{ignore}

\item{curr.df}{ignore}

\item{idx}{ignore}

\item{dist.perc}{ignore}

\item{z}{ignore}

\item{z.distance.method}{ignore}
}
\description{
These functions are exported only to be used internally by swfscAirDAS.
They implement functionality that is used when processing both
DAS and AirDAS data
}
