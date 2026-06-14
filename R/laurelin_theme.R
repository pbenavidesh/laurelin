# laurelin_theme.R
# ggplot2 themes and colour scales for the laurelin book.
# Source this file once in the setup chunk of each chapter:
#
#   source(here::here("R/laurelin_theme.R"))
#   theme_set(theme_laurelin())
#
# For light/dark renderings, use scale_laurelin() / scale_laurelin_dark()
# in the render chunk (one call per rendering, in order: light first).

# ── Palette ──────────────────────────────────────────────────────────────────

#' Laurelin colour palette
#'
#' Eight colours used consistently across all chapters.
#' Six discrete data colours (green, blue, orange, red, purple, teal)
#' plus two reference colours for annotations and guide lines
#' (ref_line, ref_text) that adapt to light/dark mode.
#'
#' @param dark Logical. Return the dark-mode variant?
#' @return Named character vector of hex colours.
laurelin_pal <- function(dark = FALSE) {
  if (dark) {
    c(
      green    = "#52B788",   # lighter green  — readable on dark bg
      blue     = "#74A9D8",   # lighter blue
      orange   = "#F4A261",   # lighter orange
      red      = "#E76F51",   # lighter red
      purple   = "#C77DFF",   # violet
      teal     = "#48CAE4",   # teal
      ref_line = "#BBBBBB",   # reference lines (vlines, guidelines)
      ref_text = "#DDDDDD"    # annotation text, axis labels
    )
  } else {
    c(
      green    = "#2D6A4F",   # dark forest green
      blue     = "#4C72B0",   # steel blue
      orange   = "#DD8452",   # terracotta orange
      red      = "#C0392B",   # emphasis red
      purple   = "#7B2D8B",   # deep purple
      teal     = "#0077B6",   # ocean teal
      ref_line = "#999999",   # reference lines (vlines, guidelines)
      ref_text = "#666666"    # annotation text, axis labels
    )
  }
}

# ── Base themes ───────────────────────────────────────────────────────────────

#' Light ggplot2 theme for laurelin
#'
#' Clean minimal theme for light mode. Transparent background so the
#' plot inherits the page background when rendered as SVG.
#'
#' @param base_size Base font size (default 13).
#' @return A ggplot2 theme object.
theme_laurelin <- function(base_size = 13) {
  ggplot2::theme_minimal(base_size = base_size) +
    ggplot2::theme(
      # transparent backgrounds — works with renderings: [light, dark]
      plot.background  = ggplot2::element_rect(fill = "transparent",
                                               colour = NA),
      panel.background = ggplot2::element_rect(fill = "transparent",
                                               colour = NA),
      # grid
      panel.grid.major = ggplot2::element_line(colour = "#E5E5E5",
                                               linewidth = 0.4),
      panel.grid.minor = ggplot2::element_line(colour = "#F0F0F0",
                                               linewidth = 0.2),
      # text
      plot.title       = ggplot2::element_text(colour = "#1A1A1A",
                                               size   = base_size + 1,
                                               face   = "bold",
                                               margin = ggplot2::margin(b = 8)),
      plot.subtitle    = ggplot2::element_text(colour = "#444444",
                                               size   = base_size - 1),
      axis.title       = ggplot2::element_text(colour = "#333333",
                                               size   = base_size - 1),
      axis.text        = ggplot2::element_text(colour = "#555555",
                                               size   = base_size - 2),
      legend.text      = ggplot2::element_text(colour = "#333333",
                                               size   = base_size - 2),
      legend.title     = ggplot2::element_text(colour = "#333333",
                                               size   = base_size - 1),
      legend.background = ggplot2::element_rect(fill   = "transparent",
                                                colour = NA),
      legend.key        = ggplot2::element_rect(fill   = "transparent",
                                                colour = NA),
      # caption
      plot.caption     = ggplot2::element_text(colour = "#888888",
                                               size   = base_size - 3,
                                               hjust  = 1),
      # spacing
      plot.margin      = ggplot2::margin(8, 8, 8, 8)
    )
}

#' Dark ggplot2 theme for laurelin
#'
#' Matching dark mode theme. Designed for use with the `darkly` Quarto theme.
#'
#' @param base_size Base font size (default 13).
#' @return A ggplot2 theme object.
theme_laurelin_dark <- function(base_size = 13) {
  ggplot2::theme_minimal(base_size = base_size) +
    ggplot2::theme(
      plot.background  = ggplot2::element_rect(fill = "#222222",
                                               colour = NA),
      panel.background = ggplot2::element_rect(fill = "#222222",
                                               colour = NA),
      panel.grid.major = ggplot2::element_line(colour = "#3A3A3A",
                                               linewidth = 0.4),
      panel.grid.minor = ggplot2::element_line(colour = "#2E2E2E",
                                               linewidth = 0.2),
      plot.title       = ggplot2::element_text(colour = "#F0F0F0",
                                               size   = base_size + 1,
                                               face   = "bold",
                                               margin = ggplot2::margin(b = 8)),
      plot.subtitle    = ggplot2::element_text(colour = "#CCCCCC",
                                               size   = base_size - 1),
      axis.title       = ggplot2::element_text(colour = "#DDDDDD",
                                               size   = base_size - 1),
      axis.text        = ggplot2::element_text(colour = "#AAAAAA",
                                               size   = base_size - 2),
      legend.text      = ggplot2::element_text(colour = "#DDDDDD",
                                               size   = base_size - 2),
      legend.title     = ggplot2::element_text(colour = "#DDDDDD",
                                               size   = base_size - 1),
      legend.background = ggplot2::element_rect(fill   = "transparent",
                                                colour = NA),
      legend.key        = ggplot2::element_rect(fill   = "transparent",
                                                colour = NA),
      plot.caption     = ggplot2::element_text(colour = "#777777",
                                               size   = base_size - 3,
                                               hjust  = 1),
      plot.margin      = ggplot2::margin(8, 8, 8, 8)
    )
}

# ── Colour scales ─────────────────────────────────────────────────────────────

#' Discrete colour scale for laurelin (light mode)
#' @param ... Arguments passed to \code{ggplot2::scale_colour_manual}.
scale_colour_laurelin <- function(...) {
  ggplot2::scale_colour_manual(values = unname(laurelin_pal(dark = FALSE)),
                               ...)
}

#' Discrete colour scale for laurelin (dark mode)
#' @param ... Arguments passed to \code{ggplot2::scale_colour_manual}.
scale_colour_laurelin_dark <- function(...) {
  ggplot2::scale_colour_manual(values = unname(laurelin_pal(dark = TRUE)),
                               ...)
}

#' Discrete fill scale for laurelin (light mode)
#' @param ... Arguments passed to \code{ggplot2::scale_fill_manual}.
scale_fill_laurelin <- function(...) {
  ggplot2::scale_fill_manual(values = unname(laurelin_pal(dark = FALSE)), ...)
}

#' Discrete fill scale for laurelin (dark mode)
#' @param ... Arguments passed to \code{ggplot2::scale_fill_manual}.
scale_fill_laurelin_dark <- function(...) {
  ggplot2::scale_fill_manual(values = unname(laurelin_pal(dark = TRUE)), ...)
}

# ── Convenience wrappers ──────────────────────────────────────────────────────

#' Apply light theme + colour scale in one call
#'
#' Use as the first expression in the light rendering of a render chunk:
#'
#'   p + scale_laurelin()
#'
#' @param ... Arguments passed to \code{scale_colour_laurelin}.
#' @return A list of ggplot2 theme and scale objects.
scale_laurelin <- function(...) {
  list(
    theme_laurelin(),
    scale_colour_laurelin(...),
    scale_fill_laurelin(...)
  )
}

#' Apply dark theme + colour scale in one call
#'
#' Use as the second expression in the dark rendering of a render chunk:
#'
#'   p + scale_laurelin_dark()
#'
#' @param ... Arguments passed to \code{scale_colour_laurelin_dark}.
#' @return A list of ggplot2 theme and scale objects.
scale_laurelin_dark <- function(...) {
  list(
    theme_laurelin_dark(),
    scale_colour_laurelin_dark(...),
    scale_fill_laurelin_dark(...)
  )
}

# ── Named colour accessors ────────────────────────────────────────────────────

#' Get a named colour from the laurelin palette
#'
#' Use for manual colour assignments (geom_vline, annotate, etc.):
#'
#'   geom_vline(xintercept = q_star, colour = lc("green"))
#'   annotate("text", colour = lc("red", dark = TRUE))
#'
#' @param name One of: "green", "blue", "orange", "red", "purple", "teal".
#' @param dark Logical. Return dark-mode variant?
#' @return A single hex colour string.
lc <- function(name, dark = FALSE) {
  pal <- laurelin_pal(dark = dark)
  if (!name %in% names(pal)) {
    stop("Unknown colour name. Use one of: ",
         paste(names(pal), collapse = ", "))
  }
  unname(pal[name])
}
