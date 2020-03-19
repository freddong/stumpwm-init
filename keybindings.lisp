(in-package #:stumpwm-init)

(set-prefix-key (kbd "C-."))

;; root map
(define-key *root-map* (kbd "c") "terminal")
(define-key *root-map* (kbd "e") "emacs")
(define-key *root-map* (kbd "b") "firefox")

(define-key *root-map* (kbd "C-.") "other")
(define-key *root-map* (kbd ".") "send-raw-key C-.")

;; top map
;; 核心命令
(define-key *top-map* (kbd "C-quoteleft") "terminal")
(define-key *top-map* (kbd "s-1") "firefox")
(define-key *top-map* (kbd "s-2") "emacs")
(define-key *top-map* (kbd "s-p") "pycharm")
(define-key *top-map* (kbd "s-i") "idea")
(define-key *top-map* (kbd "s-s") "slack")
(define-key *top-map* (kbd "s-t") "texmacs")

(define-key *top-map* (kbd "M-F2") "exec ulauncher")

;; 其他命令
(define-key *top-map* (kbd "M-TAB") "other")
(define-key *top-map* (kbd "M-`") "next-in-frame")

;; Volume control
(define-key *top-map* (kbd "XF86AudioLowerVolume") "exec amixer set Master 5%-")
(define-key *top-map* (kbd "XF86AudioRaiseVolume") "exec amixer set Master 5%+")

;; Mute
(define-key *top-map* (kbd "XF86AudioMute") "exec amixer set Master toggle")

;; 其他
(defvar *movement*
  '(("C-j" . "Down")
    ("C-k" . "Up")
    ("C-b" . "S-SPC")
    ("C-f" . "SPC"))
  "Basic movement bindings.")
(defvar *search*
  '(("C-s" . "C-f")
    ("C-n" . "F3")
    ("C-n" . "S-F3"))
  "Emacs-like searching.")
;; (defvar *firefox*
;;   ;; navigation
;;   (append
;;    *movement*
;;    *search*
;;    '(("M-<" . "Home")                    ; to top/botom
;;      ("M->" . "End")
;;      ("C-y" . "C-v")                     ;paste
;;      ("C-g" . "ESC")
;;      ("M-x" . "C-j")                     ; search bar focus
;;      ;; find search
;;      ;; other useful ones:
;;      ;; C-pgup/c-pgdown cycle tabs
;;      ;; C-w kill tab
;;      ("C-w" . "C-w")))
;;   "Keybindings for firefox.")
;; (define-remapped-keys
;;     `(("Firefox" ,@*firefox*)))
;; (define-remapped-keys
;;     ;; A branding-free name for firefox
;;     `(("Nightly" ,@*firefox*)))
;; 
;; (define-remapped-keys
;;     `(("Tor" ,@*firefox*)))
;; 
;; (define-remapped-keys
;;     `(("okular"
;;        ,@(append *movement*
;;                  *search*
;;                  '(("C-j" . "Down")
;;                    ("C-k" . "Up")
;;                    ("C-b" . "S-SPC")
;;                    ("C-f" . "SPC")
;;                    ("C-s" . "C-f")
;;                    ("M-w" . "C-c")
;;                    ("C-y" . "C-v")
;;                    ("M->" . ("C" "End"))
;;                    ("M-<" . ("C" "Home")))))))
