"""
laurelin_plot.py
Python plotting helpers for the laurelin book.

Import once in the setup chunk of each chapter:

    import sys
    sys.path.insert(0, here("python"))   # or equivalent path
    from laurelin_plot import lc, apply_light, apply_dark

Then use in render chunks:

    # light rendering
    fig, ax = build_plot(dark=False)
    apply_light(fig, ax)
    plt.show(); plt.close()

    # dark rendering
    fig, ax = build_plot(dark=True)
    apply_dark(fig, ax)
    plt.show(); plt.close()
"""

import matplotlib.pyplot as plt
import matplotlib.ticker as ticker

# ── Palette ───────────────────────────────────────────────────────────────────

_PALETTE = {
    "light": {
        "green":    "#2D6A4F",
        "blue":     "#4C72B0",
        "orange":   "#DD8452",
        "red":      "#C0392B",
        "purple":   "#7B2D8B",
        "teal":     "#0077B6",
        "ref_line": "#999999",
        "ref_text": "#666666",
    },
    "dark": {
        "green":    "#52B788",
        "blue":     "#74A9D8",
        "orange":   "#F4A261",
        "red":      "#E76F51",
        "purple":   "#C77DFF",
        "teal":     "#48CAE4",
        "ref_line": "#BBBBBB",
        "ref_text": "#DDDDDD",
    },
}

_VALID_NAMES = list(_PALETTE["light"].keys())


def lc(name: str, dark: bool = False) -> str:
    """Return a laurelin palette colour by name.

    Parameters
    ----------
    name : str
        One of: green, blue, orange, red, purple, teal, ref_line, ref_text.
    dark : bool
        If True, return the dark-mode variant.

    Returns
    -------
    str
        Hex colour string.

    Examples
    --------
    >>> lc("green")
    '#2D6A4F'
    >>> lc("green", dark=True)
    '#52B788'
    """
    mode = "dark" if dark else "light"
    if name not in _PALETTE[mode]:
        raise ValueError(
            f"Unknown colour '{name}'. "
            f"Valid names: {', '.join(_VALID_NAMES)}"
        )
    return _PALETTE[mode][name]


def palette(dark: bool = False) -> dict:
    """Return the full laurelin palette as a dict.

    Parameters
    ----------
    dark : bool
        If True, return the dark-mode palette.

    Returns
    -------
    dict
        Mapping of colour name → hex string.
    """
    return dict(_PALETTE["dark" if dark else "light"])


# ── Theme application ─────────────────────────────────────────────────────────

def apply_light(fig, ax) -> None:
    """Apply laurelin light-mode styling to a matplotlib figure and axes.

    Call immediately before plt.show() in the light rendering block.
    Sets white background, dark text, and subtle grid.

    Parameters
    ----------
    fig : matplotlib.figure.Figure
    ax  : matplotlib.axes.Axes (or list of Axes for multi-panel figures)
    """
    axes = ax if isinstance(ax, (list, tuple)) else [ax]

    fig.patch.set_facecolor("#ffffff")

    for a in axes:
        a.set_facecolor("#ffffff")
        a.tick_params(colors="#555555")
        a.xaxis.label.set_color("#333333")
        a.yaxis.label.set_color("#333333")
        a.title.set_color("#1A1A1A")
        for spine in a.spines.values():
            spine.set_edgecolor("#CCCCCC")
        a.yaxis.grid(True, color="#E5E5E5", linewidth=0.4)
        a.xaxis.grid(True, color="#E5E5E5", linewidth=0.4)
        # Ensure tick labels use dark text after any rcParams reset
        for label in a.get_xticklabels() + a.get_yticklabels():
            label.set_color("#555555")


def apply_dark(fig, ax) -> None:
    """Apply laurelin dark-mode styling to a matplotlib figure and axes.

    Call immediately before plt.show() in the dark rendering block.
    Sets dark background (#222222), white text, and subdued grid (#444444).

    Parameters
    ----------
    fig : matplotlib.figure.Figure
    ax  : matplotlib.axes.Axes (or list of Axes for multi-panel figures)
    """
    axes = ax if isinstance(ax, (list, tuple)) else [ax]

    fig.patch.set_facecolor("#222222")
    plt.rcParams.update({"text.color": "white"})

    for a in axes:
        a.set_facecolor("#222222")
        a.tick_params(colors="white")
        a.xaxis.label.set_color("white")
        a.yaxis.label.set_color("white")
        a.title.set_color("white")
        for spine in a.spines.values():
            spine.set_edgecolor("#555555")
        a.yaxis.grid(True, color="#444444", linewidth=0.5)
        a.xaxis.grid(True, color="#444444", linewidth=0.5)
        for label in a.get_xticklabels() + a.get_yticklabels():
            label.set_color("white")
        # Legend
        legend = a.get_legend()
        if legend is not None:
            legend.get_frame().set_facecolor("#222222")
            legend.get_frame().set_edgecolor("#555555")
            for text in legend.get_texts():
                text.set_color("white")


# ── Convenience: reset style ──────────────────────────────────────────────────

def reset_style() -> None:
    """Reset matplotlib rcParams to seaborn-v0_8-whitegrid defaults.

    Call at the top of each render chunk to prevent dark-mode rcParams
    from leaking into subsequent light renders.
    """
    plt.style.use("seaborn-v0_8-whitegrid")
