[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![JCS-ELPA](https://raw.githubusercontent.com/jcs-emacs/badges/master/elpa/v/flx-bin.svg)](https://jcs-emacs.github.io/jcs-elpa/#/flx-bin)

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
(fuz-bin-score-skim "something" "some else thing")
(fuz-bin-score-clangd "something" "some else thing")
```

## 🔗 References

* https://github.com/lotabout/fuzzy-matcher
* https://github.com/rustify-emacs/fuz.el

## Contribute

[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)
[![Elisp styleguide](https://img.shields.io/badge/elisp-style%20guide-purple)](https://github.com/bbatsov/emacs-lisp-style-guide)
[![Donate on paypal](https://img.shields.io/badge/paypal-donate-1?logo=paypal&color=blue)](https://www.paypal.me/jcs090218)

If you would like to contribute to this project, you may either
clone and make pull requests to this repository. Or you can
clone the project and establish your own branch of this tool.
Any methods are welcome!
