[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

# fuz-bin
> Fuzzy matching algorithm based on Sublime Text's string search

[![CI](https://github.com/jcs-elpa/fuz-bin/actions/workflows/test.yml/badge.svg)](https://github.com/jcs-elpa/fuz-bin/actions/workflows/test.yml)
[![Build](https://github.com/jcs-elpa/fuz-bin/actions/workflows/build.yml/badge.svg)](https://github.com/jcs-elpa/fuz-bin/actions/workflows/build.yml)

Same with [fuz.el](https://github.com/rustify-emacs/fuz.el) but with pre-built binaries.

## 🔨 Usage

Load by calling the following function,

```el
(fuz-bin-load-dyn)
```

Calculate the score with `PATTERN` and `SOURCE`:

```el
(fuz-bin-score "something" "some else thing")
```

## 🔗 References

* https://github.com/lotabout/fuzzy-matcher
* https://github.com/rustify-emacs/fuz.el

## Contribution

If you would like to contribute to this project, you may either
clone and make pull requests to this repository. Or you can
clone the project and establish your own branch of this tool.
Any methods are welcome!
