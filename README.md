[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

# sublime-fuzzy
> Fuzzy matching algorithm based on Sublime Text's string search

[![CI](https://github.com/jcs-elpa/sublime-fuzzy/actions/workflows/test.yml/badge.svg)](https://github.com/jcs-elpa/sublime-fuzzy/actions/workflows/test.yml)
[![Build](https://github.com/jcs-elpa/sublime-fuzzy/actions/workflows/build.yml/badge.svg)](https://github.com/jcs-elpa/sublime-fuzzy/actions/workflows/build.yml)

Build [sublime_fuzzy](https://github.com/Schlechtwetterfront/fuzzy-rs) in Rust
to Emacs loadable binaries.

This is the same with [flx](https://github.com/lewang/flx) created by [lewang](https://github.com/lewang/),
but this is powered by pre-built binaries using [Emacs Dynamic Modules](https://www.gnu.org/software/emacs/manual/html_node/elisp/Dynamic-Modules.html).
You might consider using this package if you want some performance gained!

## 🔨 Usage

Load by calling the following function,

```el
(sublime-fuzzy-load-dyn)
```

Calculate the score with `PATTERN` and `SOURCE`:

```el
(sublime-fuzzy-score "something" "some else thing")
```

## 🔗 References

* https://crates.io/crates/sublime_fuzzy/0.2.0

## Contribution

If you would like to contribute to this project, you may either
clone and make pull requests to this repository. Or you can
clone the project and establish your own branch of this tool.
Any methods are welcome!
