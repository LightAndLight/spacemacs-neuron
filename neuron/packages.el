;;; packages.el --- neuron layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author:  <Isaac Elliott>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `neuron-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `neuron/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `neuron/pre-init-PACKAGE' and/or
;;   `neuron/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst neuron-packages
  '(neuron-mode)
  "The list of Lisp packages required by the neuron layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun neuron/init-neuron-mode ()
  (use-package neuron-mode
    :mode (("\\.md" . neuron-mode))
    :init
    (progn
      (spacemacs/set-leader-keys-for-major-mode 'neuron-mode
        "n" 'neuron-new-zettel
        "r" 'neuron-refresh
        )

      (spacemacs/declare-prefix-for-mode 'neuron-mode "mt" "tags")
      (spacemacs/set-leader-keys-for-major-mode 'neuron-mode
        "tt" 'neuron-add-tag
        "ts" 'neuron-add-tags
        "tr" 'neuron-replace-tag
        )

      (spacemacs/declare-prefix-for-mode 'neuron-mode "me" "edit")
      (spacemacs/set-leader-keys-for-major-mode 'neuron-mode
        "ee" 'neuron-edit-zettel
        "eu" 'neuron-edit-uplink
        "ec" 'neuron-edit-zettelkasten-configuration
        "et" 'neuron-query-tags
        )

      (spacemacs/declare-prefix-for-mode 'neuron-mode "ml" "links")
      (spacemacs/set-leader-keys-for-major-mode 'neuron-mode
        "ll" 'neuron-insert-zettel-link
        "ln" 'neuron-insert-new-zettel
        "ls" 'neuron-insert-static-link
        "lr" 'neuron-edit-link-text-at-point
        )

      (spacemacs/declare-prefix-for-mode 'neuron-mode "ms" "site")
      (spacemacs/set-leader-keys-for-major-mode 'neuron-mode
        "ss" 'neuron-rib-serve
        "sg" 'neuron-rib-generate
        "sz" 'neuron-rib-open-z-index
        "so" 'neuron-rib-open-zettel
        "sk" 'neuron-rib-kill
        )
      )
    )
  )


;;; packages.el ends here
