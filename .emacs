(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(display-time-mode t)
 '(ede-project-directories (quote ("/home/max/Documents/projects/2012/tool_tracking/surgical_tool_tracking/source")))
 '(inhibit-startup-screen t)
 '(show-paren-mode t)
 '(transient-mark-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(global-font-lock-mode t)
(global-set-key "\C-xs" 'save-buffer)
(global-set-key "\C-xv" 'quoted-insert)
(global-set-key "\C-xg" 'goto-line)
(global-set-key "\C-xf" 'search-forward)
(global-set-key "\C-xc" 'compile)
(global-set-key "\C-xr" 'replace-string);
(global-set-key "\C-xa" 'repeat-complex-command);
(global-set-key "\C-xm" 'manual-entry);
(global-set-key "\C-xw" 'what-line);
(global-set-key "\C-x\C-u" 'shell);
(global-set-key "\C-x0" 'overwrite-mode);
(global-set-key "\C-x\C-r" 'toggle-read-only);
(global-set-key "\C-t" 'kill-word);
(global-set-key "\C-p" 'previous-line);
(global-set-key "\C-u" 'backward-word);
(global-set-key "\C-o" 'forward-word);
(global-set-key "\C-h" 'backward-delete-char-untabify);
(global-set-key "\C-x\C-m" 'not-modified);
(setq make-backup-files 'nil);
(setq default-major-mode 'text-mode)
(setq text-mode-hook 'turn-on-auto-fill)

(setq auto-mode-alist (cons '("\\.cxx$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.hpp$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.tex$" . latex-mode) auto-mode-alist))

;(require 'font-lock)
;(add-hook 'c-mode-hook 'turn-on-font-lock)
;(add-hook 'c++-mode-hook 'turn-on-font-lock)

(defun toggle-fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
)
;; insert spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
;;;(setq indent-line-function 'insert-tab)

;;set the auto-fill column
(auto-fill-mode -1)
(remove-hook 'text-mode-hook 'turn-on-auto-fill)

;;(setq-default fill-column 70)

;;to set background color to black
(set-background-color "black")

;;to manage the geometric size of initial window.
(setq initial-frame-alist '((width . 87) (height . 25)))

;;to display time
(display-time)

;;to set foreground color to white
(set-foreground-color "white")

(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
(add-to-list
 'auto-mode-alist
 '("\\.m$" . matlab-mode))
(setq matlab-indent-function t)
(setq matlab-shell-command "matlab")

;;;(add-to-list 'load-path "~/.emacs.d/")
;;;(require 'auto-complete-config)  
;;;(ac-config-default)
;;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict/")

;;set default split to horizontal
;;;(setq split-height-threshold nil)
;;;(setq split-width-threshold 80)

;; hide the dos eols
(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))


;;set cursor colours

(setq hcz-set-cursor-color-color "")
(setq hcz-set-cursor-color-buffer "")
(defun hcz-set-cursor-color-according-to-mode ()
  "change cursor color according to some minor modes."
  ;; set-cursor-color is somewhat costly, so we only call it when needed:
  (let ((color
	 (if buffer-read-only "black"
	   (if overwrite-mode "red"
	     "blue"))))
    (unless (and
	     (string= color hcz-set-cursor-color-color)
	     (string= (buffer-name) hcz-set-cursor-color-buffer))
      (set-cursor-color (setq hcz-set-cursor-color-color color))
      (setq hcz-set-cursor-color-buffer (buffer-name)))))
(add-hook 'post-command-hook 'hcz-set-cursor-color-according-to-mode)


;;load the cedet initialisation file
;;;(load-file "/usr/local/cedet-1.1/common/cedet.el")

;; switch on global-ede-mode
;;;(global-ede-mode t)

;;set the semantic customisation - one of these 5 MUST be chosen

;;(semantic-load-enable-minimum-features)
;; enables only minimum of necessary features 
;; keep syntactic information for current buffer up-to date, storing of syntactic information for later use (Semanticdb), and loading of syntactic information with Semanticdb and Ebrowse

;;;(semantic-load-enable-code-helpers) 
;;enables senator-minor-mode for navigation in buffer, semantic-mru-bookmark-mode for storing positions of visited tags, and semantic-idle-summary-mode, that shows information about tag under point when Emacs is idle

;;(semantic-load-enable-gaudy-code-helpers)
;;enables semantic-stickyfunc-name that displays name of current function in topmost line of buffer, semantic-decoration-mode to decorate tags, using different styles, and semantic-idle-completion-mode for automatic generation of possible names completions, if user stops his work for some time;

;;(semantic-load-enable-excessive-code-helpers)
;;enables which-func-mode, that shows name of current function in status line

;;(semantic-load-enable-semantic-debugging-helpers)
;;enables several modes, that are useful when you debugging Semantic - to show parsing errors, Semantic's state, etc.

;;;(global-srecode-minor-mode 1)

;; required to use additional features for names completion, semantic info for tags/classes
;;;(require 'semantic-ia)

;; system header files 
;; to add the standard c/c++ header files
;;;(require 'semantic-gcc)
;; add any additional libraries to this path
;; (semantic-add-system-include "~/path/to/library/" 'c++-mode)


;; PROJECTS

;; DEFAULT
;;(ede-cpp-root-project "Test"
;;              :name "Test Project"
;;              :file "~/work/project/CMakeLists.txt" ;; just a file for root dir anchor
;;              :include-path '("/" ;; list of dirs, relative to root dir to search 
;;                              "/Common"
;;                              "/Interfaces"
;;                              "/Libs"
;;                              )
;;              :system-include-path '("~/exp/include")
;;              :spp-table '(("isUnix" . "")
;;                           ("BOOST_TEST_DYN_LINK" . "")))


;;prompt for create dir when saving in new directory
(add-hook 'before-save-hook
          (lambda ()
            (when buffer-file-name
              (let ((dir (file-name-directory buffer-file-name)))
                (when (and (not (file-exists-p dir))
                           (y-or-n-p (format "Directory %s does not exist. Create it?" dir)))
                  (make-directory dir t))))))
