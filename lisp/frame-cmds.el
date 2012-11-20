<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: frame-cmds.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=frame-cmds.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: frame-cmds.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=frame-cmds.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for frame-cmds.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=frame-cmds.el" /><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head><body class="http://www.emacswiki.org/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span>
<!-- Google CSE Search Box Begins  -->
<form class="tiny" action="http://www.google.com/cse" id="searchbox_004774160799092323420:6-ff2s0o6yi"><p>
<input type="hidden" name="cx" value="004774160799092323420:6-ff2s0o6yi" />
<input type="text" name="q" size="25" />
<input type="submit" name="sa" value="Search" />
</p></form>
<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=searchbox_004774160799092323420%3A6-ff2s0o6yi"></script>
<!-- Google CSE Search Box Ends -->
<br /><span class="specialdays">Guinea, Independence Day, China, National Day, Palau, National Day, Tuvalu, Independence Day, Cyprus, National Day, Nigeria, National Day</span><h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22frame-cmds.el%22">frame-cmds.el</a></h1></div><div class="wrapper"><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs-en/download/frame-cmds.el">Download</a></p><pre class="code"><span class="linecomment">;;; frame-cmds.el --- Frame and window commands (interactive functions).</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Filename: frame-cmds.el</span>
<span class="linecomment">;; Description: Frame and window commands (interactive functions).</span>
<span class="linecomment">;; Author: Drew Adams</span>
<span class="linecomment">;; Maintainer: Drew Adams</span>
<span class="linecomment">;; Copyright (C) 1996-2012, Drew Adams, all rights reserved.</span>
<span class="linecomment">;; Created: Tue Mar  5 16:30:45 1996</span>
<span class="linecomment">;; Version: 21.0</span>
<span class="linecomment">;; Last-Updated: Thu Aug 23 11:42:21 2012 (-0700)</span>
<span class="linecomment">;;           By: dradams</span>
<span class="linecomment">;;     Update #: 2670</span>
<span class="linecomment">;; URL: http://www.emacswiki.org/cgi-bin/wiki/frame-cmds.el</span>
<span class="linecomment">;; Doc URL: http://emacswiki.org/emacs/FrameModes</span>
<span class="linecomment">;; Doc URL: http://www.emacswiki.org/emacs/OneOnOneEmacs</span>
<span class="linecomment">;; Doc URL: http://emacswiki.org/emacs/Frame_Tiling_Commands</span>
<span class="linecomment">;; Keywords: internal, extensions, mouse, frames, windows, convenience</span>
<span class="linecomment">;; Compatibility: GNU Emacs: 20.x, 21.x, 22.x, 23.x</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Features that might be required by this library:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   `avoid', `frame-fns', `misc-fns', `strings', `thingatpt',</span>
<span class="linecomment">;;   `thingatpt+'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Commentary:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    Frame and window commands (interactive functions).</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Summary:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    Load this library from your init file (~/.emacs or _emacs).</span>
<span class="linecomment">;;    Add the suggested key bindings (below) to  your init file.</span>
<span class="linecomment">;;    Use `M-up|down|left|right' to move frames around.</span>
<span class="linecomment">;;    Use `C-M-up|down|left|right' to resize frames.</span>
<span class="linecomment">;;    Use `C-M-z' or `C-x C-z' to iconify/hide all frames.</span>
<span class="linecomment">;;    Use `C-M-z' in a lone frame to restore all frames.</span>
<span class="linecomment">;;    Use `C-mouse-1' in the minibuffer to restore all frames.</span>
<span class="linecomment">;;    Use `C-mouse-1' in Dired to mark/unmark a file.</span>
<span class="linecomment">;;    Use `C-mouse-3' on the mode line to remove window from frame.</span>
<span class="linecomment">;;    Use `tile-frames-horizontally', `-vertically' to tile frames.</span>
<span class="linecomment">;;    Use `C-x o' to select `other-window' or `other-frame'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Commands to incrementally resize frames are `enlarge-frame' and</span>
<span class="linecomment">;;  `enlarge-frame-horizontally'.  Sarir Khamsi</span>
<span class="linecomment">;;  [sarir.khamsi@raytheon.com] originally wrote `enlarge-frame',</span>
<span class="linecomment">;;  which he called `sk-grow-frame'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Note on saving changes made with the commands defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    Some of the commands defined here change frame properties.</span>
<span class="linecomment">;;    You can save any changes you have made, by using Customize.</span>
<span class="linecomment">;;    To visit a Customize buffer of all unsaved changes you have</span>
<span class="linecomment">;;    made, use command `customize-customized'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    Frame parameter changes, such as background color, can be saved</span>
<span class="linecomment">;;    for future use by all frames or all frames of a certain</span>
<span class="linecomment">;;    kind.  For that, you must change the frame parameters of the</span>
<span class="linecomment">;;    correponding frame-alist variable.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    There is no single variable for saving changes to parameters of</span>
<span class="linecomment">;;    the current frame.  Instead, there are several different</span>
<span class="linecomment">;;    frame-alist variables, which you can use to define different</span>
<span class="linecomment">;;    kinds of frames.  These include: `default-frame-alist',</span>
<span class="linecomment">;;    `initial-frame-alist', and `special-display-frame-alist'.  The</span>
<span class="linecomment">;;    complete list of such frame alist variables is available using</span>
<span class="linecomment">;;    function `frame-alist-var-names', defined here.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    Example: Suppose you change the background color of a frame and</span>
<span class="linecomment">;;    want to make that the default background color for new frames in</span>
<span class="linecomment">;;    the future.  You will need to update the value of variable</span>
<span class="linecomment">;;    `default-frame-alist' to use the `background-color' parameter</span>
<span class="linecomment">;;    setting of the changed frame.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    You can easily copy one or all parameter values from any given</span>
<span class="linecomment">;;    frame to any frame alist (such as `default-frame-alist'), by</span>
<span class="linecomment">;;    using the commands `set-frame-alist-parameter-from-frame' and</span>
<span class="linecomment">;;    `set-all-frame-alist-parameters-from-frame'.  Those commands are</span>
<span class="linecomment">;;    defined here.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  NOTE: If you also use library `fit-frame.el', and you are on MS</span>
<span class="linecomment">;;  Windows, then load that library before `frame-cmds.el'.  The</span>
<span class="linecomment">;;  commands `maximize-frame' and `restore-frame' defined here are</span>
<span class="linecomment">;;  more general and non-Windows-specific than the commands of the</span>
<span class="linecomment">;;  same name defined in `fit-frame.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  User options defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `available-screen-pixel-bounds', `enlarge-font-tries',</span>
<span class="linecomment">;;    `frame-config-register', `frame-parameters-to-exclude',</span>
<span class="linecomment">;;    `move-frame-wrap-within-display-flag'</span>
<span class="linecomment">;;    `rename-frame-when-iconify-flag', `show-hide-show-function',</span>
<span class="linecomment">;;    `window-mgr-title-bar-pixel-height'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Commands defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `delete-1-window-frames-on', `delete/iconify-window',</span>
<span class="linecomment">;;    `delete/iconify-windows-on', `delete-other-frames',</span>
<span class="linecomment">;;    `delete-windows-for', `enlarge-font', `enlarge-frame',</span>
<span class="linecomment">;;    `enlarge-frame-horizontally', `hide-everything', `hide-frame',</span>
<span class="linecomment">;;    `iconify-everything', `iconify/map-frame',</span>
<span class="linecomment">;;    `jump-to-frame-config-register', `maximize-frame',</span>
<span class="linecomment">;;    `maximize-frame-horizontally', `maximize-frame-vertically',</span>
<span class="linecomment">;;    `mouse-iconify/map-frame', `mouse-remove-window',</span>
<span class="linecomment">;;    `mouse-show-hide-mark-unmark', `move-frame-down',</span>
<span class="linecomment">;;    `move-frame-left', `move-frame-right', `move-frame-up',</span>
<span class="linecomment">;;    `other-window-or-frame', `remove-window', `remove-windows-on',</span>
<span class="linecomment">;;    `rename-frame', `rename-non-minibuffer-frame', `restore-frame',</span>
<span class="linecomment">;;    `restore-frame-horizontally', `restore-frame-vertically',</span>
<span class="linecomment">;;    `save-frame-config',</span>
<span class="linecomment">;;    `set-all-frame-alist-parameters-from-frame',</span>
<span class="linecomment">;;    `set-frame-alist-parameter-from-frame', `show-*Help*-buffer',</span>
<span class="linecomment">;;    `show-a-frame-on', `show-buffer-menu', `show-frame',</span>
<span class="linecomment">;;    `show-hide', `shrink-frame', `shrink-frame-horizontally',</span>
<span class="linecomment">;;    `tell-customize-var-has-changed', `tile-frames',</span>
<span class="linecomment">;;    `tile-frames-horizontally', `tile-frames-vertically',</span>
<span class="linecomment">;;    `toggle-max-frame', `toggle-max-frame-horizontally',</span>
<span class="linecomment">;;    `toggle-max-frame-vertically'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Non-interactive functions defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `assq-delete-all' (Emacs 20), `available-screen-pixel-bounds',</span>
<span class="linecomment">;;    `available-screen-pixel-height', `available-screen-pixel-width',</span>
<span class="linecomment">;;    `butlast' (Emacs 20), `effective-screen-pixel-bounds',</span>
<span class="linecomment">;;    `enlarged-font-name', `frame-alist-var-names',</span>
<span class="linecomment">;;    `frame-cmds-set-difference', `frame-iconified-p',</span>
<span class="linecomment">;;    `frame-parameter-names', `nbutlast' (Emacs 20),</span>
<span class="linecomment">;;    `new-frame-position', `read-args-for-tile-frames',</span>
<span class="linecomment">;;    `read-buffer-for-delete-windows', `smart-tool-bar-pixel-height'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following EMACS PRIMITIVES have been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `delete-window' - If only one window in frame, `delete-frame'.</span>
<span class="linecomment">;;  `delete-windows-on' -</span>
<span class="linecomment">;;     1) Reads buffer differently.  Only buffers showing windows are candidates.</span>
<span class="linecomment">;;     2) Calls `delete-window', so this also deletes frames where</span>
<span class="linecomment">;;        window showing the BUFFER is the only window.</span>
<span class="linecomment">;;        (That's true also for vanilla Emacs 23+, but not before.)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Suggested key bindings:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   (global-set-key [(meta up)] 'move-frame-up)</span>
<span class="linecomment">;;   (global-set-key [(meta down)] 'move-frame-down)</span>
<span class="linecomment">;;   (global-set-key [(meta left)] 'move-frame-left)</span>
<span class="linecomment">;;   (global-set-key [(meta right)] 'move-frame-right)</span>
<span class="linecomment">;;   (global-set-key [(control meta down)] 'enlarge-frame)</span>
<span class="linecomment">;;   (global-set-key [(control meta right)] 'enlarge-frame-horizontally)</span>
<span class="linecomment">;;   (global-set-key [(control meta up)] 'shrink-frame)</span>
<span class="linecomment">;;   (global-set-key [(control meta left)] 'shrink-frame-horizontally)</span>
<span class="linecomment">;;   (global-set-key [(control ?x) (control ?z)] 'iconify-everything)</span>
<span class="linecomment">;;   (global-set-key [vertical-line S-down-mouse-1] 'iconify-everything)</span>
<span class="linecomment">;;   (global-set-key [(control ?z)] 'iconify/map-frame)</span>
<span class="linecomment">;;   (global-set-key [mode-line mouse-3] 'mouse-iconify/map-frame)</span>
<span class="linecomment">;;   (global-set-key [mode-line C-mouse-3] 'mouse-remove-window)</span>
<span class="linecomment">;;   (global-set-key [(control meta ?z)] 'show-hide)</span>
<span class="linecomment">;;   (global-set-key [vertical-line C-down-mouse-1] 'show-hide)</span>
<span class="linecomment">;;   (global-set-key [C-down-mouse-1] 'mouse-show-hide-mark-unmark)</span>
<span class="linecomment">;;   (substitute-key-definition 'delete-window 'remove-window global-map)</span>
<span class="linecomment">;;   (define-key ctl-x-map "o" 'other-window-or-frame)</span>
<span class="linecomment">;;   (define-key ctl-x-4-map "1" 'delete-other-frames)</span>
<span class="linecomment">;;   (define-key ctl-x-5-map "h" 'show-*Help*-buffer)</span>
<span class="linecomment">;;   (substitute-key-definition 'delete-window 'delete-windows-for global-map)</span>
<span class="linecomment">;;   (define-key global-map "\C-xt." 'save-frame-config)</span>
<span class="linecomment">;;   (define-key ctl-x-map "o" 'other-window-or-frame)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   (defalias 'doremi-prefix (make-sparse-keymap))</span>
<span class="linecomment">;;   (defvar doremi-map (symbol-function 'doremi-prefix) "Keymap for Do Re Mi commands.")</span>
<span class="linecomment">;;   (define-key global-map "\C-xt" 'doremi-prefix)</span>
<span class="linecomment">;;   (define-key doremi-map "." 'save-frame-config)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Customize the menu.  Uncomment this to try it out.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   (defvar menu-bar-frames-menu (make-sparse-keymap "Frames"))</span>
<span class="linecomment">;;   (define-key global-map [menu-bar frames]</span>
<span class="linecomment">;;     (cons "Frames" menu-bar-frames-menu)))</span>
<span class="linecomment">;;   (define-key menu-bar-frames-menu [set-all-params-from-frame]</span>
<span class="linecomment">;;     '(menu-item "Set All Frame Parameters from Frame" set-all-frame-alist-parameters-from-frame</span>
<span class="linecomment">;;       :help "Set frame parameters of a frame to their current values in frame"))</span>
<span class="linecomment">;;   (define-key menu-bar-frames-menu [set-params-from-frame]</span>
<span class="linecomment">;;     '(menu-item "Set Frame Parameter from Frame..." set-frame-alist-parameter-from-frame</span>
<span class="linecomment">;;       :help "Set parameter of a frame alist to its current value in frame"))</span>
<span class="linecomment">;;   (define-key menu-bar-frames-menu [separator-frame-1] '("--"))</span>
<span class="linecomment">;;   (define-key menu-bar-frames-menu [tile-frames-vertically]</span>
<span class="linecomment">;;     '(menu-item "Tile Frames Vertically..." tile-frames-vertically</span>
<span class="linecomment">;;       :help "Tile all visible frames vertically"))</span>
<span class="linecomment">;;   (define-key menu-bar-frames-menu [tile-frames-horizontally]</span>
<span class="linecomment">;;     '(menu-item "Tile Frames Horizontally..." tile-frames-horizontally</span>
<span class="linecomment">;;       :help "Tile all visible frames horizontally"))</span>
<span class="linecomment">;;   (define-key menu-bar-frames-menu [separator-frame-2] '("--"))</span>
<span class="linecomment">;;   (define-key menu-bar-frames-menu [toggle-max-frame-vertically]</span>
<span class="linecomment">;;     '(menu-item "Toggle Max Frame Vertically" toggle-max-frame-vertically</span>
<span class="linecomment">;;       :help "Maximize or restore the selected frame vertically"</span>
<span class="linecomment">;;       :enable (frame-parameter nil 'restore-height)))</span>
<span class="linecomment">;;   (define-key menu-bar-frames-menu [toggle-max-frame-horizontally]</span>
<span class="linecomment">;;     '(menu-item "Toggle Max Frame Horizontally" toggle-max-frame-horizontally</span>
<span class="linecomment">;;       :help "Maximize or restore the selected frame horizontally"</span>
<span class="linecomment">;;       :enable (frame-parameter nil 'restore-width)))</span>
<span class="linecomment">;;   (define-key menu-bar-frames-menu [toggle-max-frame]</span>
<span class="linecomment">;;     '(menu-item "Toggle Max Frame" toggle-max-frame</span>
<span class="linecomment">;;       :help "Maximize or restore the selected frame (in both directions)"</span>
<span class="linecomment">;;       :enable (or (frame-parameter nil 'restore-width) (frame-parameter nil 'restore-height))))</span>
<span class="linecomment">;;   (define-key menu-bar-frames-menu [maximize-frame-vertically]</span>
<span class="linecomment">;;     '(menu-item "Maximize Frame Vertically" maximize-frame-vertically</span>
<span class="linecomment">;;       :help "Maximize the selected frame vertically"))</span>
<span class="linecomment">;;   (define-key menu-bar-frames-menu [maximize-frame-horizontally]</span>
<span class="linecomment">;;     '(menu-item "Maximize Frame Horizontally" maximize-frame-horizontally</span>
<span class="linecomment">;;       :help "Maximize the selected frame horizontally"))</span>
<span class="linecomment">;;   (define-key menu-bar-frames-menu [maximize-frame]</span>
<span class="linecomment">;;     '(menu-item "Maximize Frame" maximize-frame</span>
<span class="linecomment">;;       :help "Maximize the selected frame (in both directions)"))</span>
<span class="linecomment">;;   (define-key menu-bar-frames-menu [separator-frame-3] '("--"))</span>
<span class="linecomment">;;   (define-key menu-bar-frames-menu [iconify-everything]</span>
<span class="linecomment">;;     '(menu-item "Iconify All Frames" iconify-everything</span>
<span class="linecomment">;;       :help "Iconify all frames of session at once"))</span>
<span class="linecomment">;;   (define-key menu-bar-frames-menu [show-hide]</span>
<span class="linecomment">;;     '(menu-item "Hide Frames / Show Buffers" show-hide</span>
<span class="linecomment">;;       :help "Show, if only one frame visible; else hide.")))</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   (defvar menu-bar-doremi-menu (make-sparse-keymap "Do Re Mi"))</span>
<span class="linecomment">;;   (define-key global-map [menu-bar doremi]</span>
<span class="linecomment">;;     (cons "Do Re Mi" menu-bar-doremi-menu))</span>
<span class="linecomment">;;   (define-key menu-bar-doremi-menu [doremi-font+]</span>
<span class="linecomment">;;     '("Save Frame Configuration" . save-frame-config))</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  See also these files for other frame commands:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;     `autofit-frame.el' - Automatically fit each frame to its</span>
<span class="linecomment">;;                          selected window.  Uses `fit-frame.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;     `fit-frame.el'     - 1) Fit a frame to its selected window.</span>
<span class="linecomment">;;                          2) Incrementally resize a frame.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;     `doremi-frm.el'    - Incrementally adjust frame properties</span>
<span class="linecomment">;;                          using arrow keys and/or mouse wheel.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;     `thumb-frm.el'     - Shrink frames to a thumbnail size and</span>
<span class="linecomment">;;                          restore them again.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;     `zoom-frm.el'      - Zoom a frame, so that its font becomes</span>
<span class="linecomment">;;                          larger or smaller.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Change Log:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2012/02/29 dadams</span>
<span class="linecomment">;;     Added, for Emacs 20 only: nbutlast, butlast.  To avoid runtime load of cl.el.</span>
<span class="linecomment">;;     Added frame-cmds-set-difference, to avoid runtime load of cl.el.</span>
<span class="linecomment">;;     set-all-frame-alist-parameters-from-frame: Use frame-cmds-set-difference.</span>
<span class="linecomment">;; 2011/07/25 dadams</span>
<span class="linecomment">;;     save-frame-config: Use fboundp, not featurep.</span>
<span class="linecomment">;; 2011/01/04 dadams</span>
<span class="linecomment">;;     Removed autoload cookie from non-interactive function.</span>
<span class="linecomment">;; 2010/10/19 dadams</span>
<span class="linecomment">;;     enlarge-font: Only do frame-update-faces if Emacs 20 (obsolete in 21).</span>
<span class="linecomment">;; 2010/06/04 dadams</span>
<span class="linecomment">;;     Added: (toggle-max|restore)-frame(-horizontally|-vertically).  Thx to Uday Reddy for suggestion.</span>
<span class="linecomment">;;     Renamed max-frame to maximize-frame.</span>
<span class="linecomment">;;     maximize-frame: Save original location & position params for later restoration.</span>
<span class="linecomment">;; 2010/05/25 dadams</span>
<span class="linecomment">;;     Added: max-frame, maximize-frame-horizontally, maximize-frame-vertically.</span>
<span class="linecomment">;; 2009/10/02 dadams</span>
<span class="linecomment">;;     delete-windows-on: Return nil.  Make BUFFER optional: default is current buffer.</span>
<span class="linecomment">;; 2009/08/03 dadams</span>
<span class="linecomment">;;     delete-window: Wrap with save-current-buffer.  Thx to Larry Denenberg.</span>
<span class="linecomment">;; 2009/05/17 dadams</span>
<span class="linecomment">;;     Updated to reflect thumb-frm.el name changes.</span>
<span class="linecomment">;; 2009/01/30 dadams</span>
<span class="linecomment">;;     enlarge-font, enlarged-font-name, enlarge-font-tries:</span>
<span class="linecomment">;;       Removed temporary workaround - Emacs 23 bug #119 was finally fixed.</span>
<span class="linecomment">;; 2009/01/01 dadams</span>
<span class="linecomment">;;     Removed compile-time require of doremi-frm.el to avoid infinite recursion.</span>
<span class="linecomment">;; 2008/12/13 dadams</span>
<span class="linecomment">;;     enlarge-font: Redefined for Emacs 23 - just use :height face attribute.</span>
<span class="linecomment">;;     enlarge-font-tries, enlarged-font-name: Not used for Emacs 23.</span>
<span class="linecomment">;; 2008/10/31 dadams</span>
<span class="linecomment">;;     Updated frame-parameter-names for Emacs 23.</span>
<span class="linecomment">;; 2008/07/29 dadams</span>
<span class="linecomment">;;     Option available-screen-pixel-bounds: Use nil as default value.</span>
<span class="linecomment">;;     available-screen-pixel-bounds: Redefined as the code that defined the option's default value.</span>
<span class="linecomment">;;     Added: effective-screen-pixel-bounds - code taken from old available-screen-pixel-bounds,</span>
<span class="linecomment">;;            but also convert frame geom value to numeric.</span>
<span class="linecomment">;;     Everywhere:</span>
<span class="linecomment">;;       Use effective-screen-pixel-bounds in place of available-screen-pixel-bounds function.</span>
<span class="linecomment">;;       Use available-screen-pixel-bounds function instead of option.</span>
<span class="linecomment">;;     available-screen-pixel-(width|height): Added optional INCLUDE-MINI-P arg.</span>
<span class="linecomment">;;     new-frame-position: Call available-screen-pixel-(width|height) with arg.</span>
<span class="linecomment">;;     save-frame-config: push-current-frame-config -&gt; doremi-push-current-frame-config.</span>
<span class="linecomment">;;     Soft-require doremi-frm.el when byte-compile.</span>
<span class="linecomment">;; 2008/06/02 dadams</span>
<span class="linecomment">;;     Added: available-screen-pixel-bounds (option and function).</span>
<span class="linecomment">;;     tile-frames, available-screen-pixel-(width|height):</span>
<span class="linecomment">;;       Redefined to use available-screen-pixel-bounds.  Thx to Nathaniel Cunningham for input.</span>
<span class="linecomment">;; 2008/05/29 dadams</span>
<span class="linecomment">;;     Fixes for Mac by Nathaniel Cunningham and David Reitter:</span>
<span class="linecomment">;;       window-mgr-title-bar-pixel-height, tile-frames, smart-tool-bar-pixel-height (added).</span>
<span class="linecomment">;; 2007/12/27 dadams</span>
<span class="linecomment">;;      tile-frames: Restored border calculation, but using only external border.</span>
<span class="linecomment">;;      Renamed window-mgr-*-width to window-mgr-*-height and changed default value from 32 to 27.</span>
<span class="linecomment">;; 2007/12/20 dadams</span>
<span class="linecomment">;;      Added: frame-extra-pixels(width|height).  Use in tile-frames.  Thx to David Reitter.</span>
<span class="linecomment">;;      frame-horizontal-extra-pixels: Changed default value from 30 to 32.</span>
<span class="linecomment">;; 2007/10/11 dadams</span>
<span class="linecomment">;;      Added: assq-delete-all (for Emacs 20).</span>
<span class="linecomment">;; 2007/09/02 dadams</span>
<span class="linecomment">;;      Added: available-screen-pixel-(width|height).  Use in tile-frames, new-frame-position.</span>
<span class="linecomment">;; 2007/06/12 dadams</span>
<span class="linecomment">;;      tile-frames: Corrected use of fboundp for thumbnail-frame-p.</span>
<span class="linecomment">;; 2007/05/27 dadams</span>
<span class="linecomment">;;      enlarged-font-name:</span>
<span class="linecomment">;;        Do nothing if null assq of ascii.  Not sure what this means, but gets around Emacs 23 bug.</span>
<span class="linecomment">;; 2006/08/22 dadams</span>
<span class="linecomment">;;      Added: delete-windows-for, read-buffer-for-delete-windows.</span>
<span class="linecomment">;;      delete-windows-on: Use read-buffer-for-delete-windows.</span>
<span class="linecomment">;;      Removed old-delete-windows-on (not used).</span>
<span class="linecomment">;; 2006/05/30 dadams</span>
<span class="linecomment">;;      delete-windows-on: Return nil if buffer arg is nil. Thanks to Slawomir Nowaczyk.</span>
<span class="linecomment">;; 2006/01/07 dadams</span>
<span class="linecomment">;;      Added :link for sending bug report.</span>
<span class="linecomment">;; 2006/01/06 dadams</span>
<span class="linecomment">;;      Renamed group.  Added :link.</span>
<span class="linecomment">;; 2006/01/04 dadams</span>
<span class="linecomment">;;     Added: other-window-or-frame.</span>
<span class="linecomment">;; 2005/12/29 dadams</span>
<span class="linecomment">;;     mouse-show-hide-mark-unmark: dired-mouse-mark/unmark -&gt; diredp-mouse-mark/unmark.</span>
<span class="linecomment">;; 2005/12/13 dadams</span>
<span class="linecomment">;;     Added: delete-other-frames.</span>
<span class="linecomment">;; 2005/11/18 dadams</span>
<span class="linecomment">;;     enlarge-font: Try to increment or decrment further, testing for an existing font.</span>
<span class="linecomment">;;     Added: enlarge-font-tries, enlarged-font-name.</span>
<span class="linecomment">;; 2005/10/03 dadams</span>
<span class="linecomment">;;     Removed require of icomplete+.el (no longer redefines read-from-minibuffer).</span>
<span class="linecomment">;; 2005/07/03 dadams</span>
<span class="linecomment">;;     Renamed: args-for-tile-frames to read-args-for-tile-frames.</span>
<span class="linecomment">;; 2005/06/19 dadams</span>
<span class="linecomment">;;     tile-frames: Don't tile thumbnail frames.</span>
<span class="linecomment">;; 2005/05/29 dadams</span>
<span class="linecomment">;;     Moved here from frame+.el and fit-frame.el: enlarge-frame*, shrink-frame*.</span>
<span class="linecomment">;;     Added: move-frame-up|down|left|right, move-frame-wrap-within-display-flag,</span>
<span class="linecomment">;;            new-frame-position.</span>
<span class="linecomment">;; 2005/05/28 dadams</span>
<span class="linecomment">;;     show-a-frame-on: Use another-buffer as default for read-buffer, if available.</span>
<span class="linecomment">;; 2005/05/15 dadams</span>
<span class="linecomment">;;     Renamed: minibuffer-frame to 1on1-minibuffer-frame.</span>
<span class="linecomment">;; 2005/05/10 dadams</span>
<span class="linecomment">;;     remove-window: Removed definition; just defalias it to delete-window.</span>
<span class="linecomment">;;     delete-window: (one-window-p) -&gt; (one-window-p t).</span>
<span class="linecomment">;;     set-frame-alist-parameter-from-frame: No longer use destructive fns.</span>
<span class="linecomment">;; 2005/01/19 dadams</span>
<span class="linecomment">;;     set-all-frame-alist-parameters-from-frame:</span>
<span class="linecomment">;;            Added really-all-p and use frame-parameters-to-exclude.</span>
<span class="linecomment">;;     Added: frame-parameters-to-exclude, tell-customize-var-has-changed.</span>
<span class="linecomment">;; 2005/01/18 dadams</span>
<span class="linecomment">;;     Added: set-all-frame-alist-parameters-from-frame, set-frame-alist-parameter-from-frame,</span>
<span class="linecomment">;;            frame-alist-var-names, frame-parameter-names.</span>
<span class="linecomment">;;     Added Note on saving changes.</span>
<span class="linecomment">;; 2005/01/08 dadams</span>
<span class="linecomment">;;     Moved enlarge-font here from doremi-frm.el, where it was called doremi-grow-font.</span>
<span class="linecomment">;; 2005/01/04 dadams</span>
<span class="linecomment">;;     Added rename-frame-when-iconify-flag.</span>
<span class="linecomment">;;       Use it in iconify-everything, (mouse-)iconify/map-frame.</span>
<span class="linecomment">;;     Added (defgroup frame-cmds).</span>
<span class="linecomment">;; 2004/12/23 dadams</span>
<span class="linecomment">;;     frame-config-register, show-hide-show-function, window-mgr-title-bar-pixel-width:</span>
<span class="linecomment">;;         Changed defvar to defcustom.</span>
<span class="linecomment">;; 2004/12/21 dadams</span>
<span class="linecomment">;;     hide-everything, iconify-everything: bind thumbify-instead-of-iconify-flag to nil.</span>
<span class="linecomment">;; 2004/12/10 dadams</span>
<span class="linecomment">;;     tile-frames: Change 15 to (frame-char-height fr) for scroll-bar-width.</span>
<span class="linecomment">;;     tile-frames-*: Corrected doc strings for non-interactive case.</span>
<span class="linecomment">;; 2004/12/09 dadams</span>
<span class="linecomment">;;     Changed compile-time require of strings to a soft require.</span>
<span class="linecomment">;; 2004/10/11 dadams</span>
<span class="linecomment">;;     args-for-tile-frames: Fixed bug when non-existant frame in name history.</span>
<span class="linecomment">;;     tile-frames: show-frame at end (for case where use prefix arg)</span>
<span class="linecomment">;; 2004/09/11 dadams</span>
<span class="linecomment">;;     Moved to doremi-frm.el: frame-config-ring*, frame-config-wo-parameters,</span>
<span class="linecomment">;;                             push-frame-config.</span>
<span class="linecomment">;; 2004/09/07 dadams</span>
<span class="linecomment">;;     Added: jump-to-frame-config-register, push-frame-config, save-frame-config.</span>
<span class="linecomment">;; 2004/09/01 dadams</span>
<span class="linecomment">;;     Added: frame-config-register, show-hide-show-function,</span>
<span class="linecomment">;;            jump-to-frame-config-register.</span>
<span class="linecomment">;;     Rewrote to record frame config: iconify-everything, hide-everything.</span>
<span class="linecomment">;;     Rewrote to use show-hide-show-function: show-hide.</span>
<span class="linecomment">;; 2004/03/22 dadams</span>
<span class="linecomment">;;     Added: tile-frames, tile-frames-vertically, args-for-tile-frames.</span>
<span class="linecomment">;;     Rewrote tile-frames-horizontally to use tile-frames.</span>
<span class="linecomment">;; 2004/03/19 dadams</span>
<span class="linecomment">;;     Added tile-frames-horizontally.</span>
<span class="linecomment">;; 2000/11/27 dadams</span>
<span class="linecomment">;;     hide-frame: fixed bug: Added get-a-frame for frame name read.</span>
<span class="linecomment">;; 2000/09/27 dadams</span>
<span class="linecomment">;;     1. Added: frame-iconified-p.</span>
<span class="linecomment">;;     2. remove-window: only make-frame-invisible if not iconified (HACK).</span>
<span class="linecomment">;; 1999/10/05 dadams</span>
<span class="linecomment">;;     rename-frame: fixed bug if only 1 frame and old-name was a frame.</span>
<span class="linecomment">;; 1999/08/25 dadams</span>
<span class="linecomment">;;     Added: hide-everything, show-buffer-menu, show-hide.</span>
<span class="linecomment">;; 1999/03/17 dadams</span>
<span class="linecomment">;;     delete-1-window-frames-on: ensure a buffer object (not a name).</span>
<span class="linecomment">;; 1996/04/26 dadams</span>
<span class="linecomment">;;     delete/iconify-windows-on, show-a-frame-on: Do nothing if null buffer.</span>
<span class="linecomment">;; 1996/03/12 dadams</span>
<span class="linecomment">;;     delete/iconify-window: Unless one-window-p, do old-delete-window outside of</span>
<span class="linecomment">;;                            save-window-excursion.</span>
<span class="linecomment">;; 1996/03/08 dadams</span>
<span class="linecomment">;;     1. delete-windows-on: a. Fixed incorrect interactive spec (bad paren).</span>
<span class="linecomment">;;                           b. Second arg FRAME also provided interactively now.</span>
<span class="linecomment">;;     2. Added: delete/iconify-window, delete/iconify-windows-on.</span>
<span class="linecomment">;; 1996/02/27 dadams</span>
<span class="linecomment">;;     show-frame: Call make-frame-visible.</span>
<span class="linecomment">;; 1996/02/09 dadams</span>
<span class="linecomment">;;     Added show-*Help*-buffer.</span>
<span class="linecomment">;; 1996/01/30 dadams</span>
<span class="linecomment">;;     1. show-frame: Don't make-frame-visible.  Done by raise-frame anyway.</span>
<span class="linecomment">;;     2. Added show-a-frame-on.</span>
<span class="linecomment">;; 1996/01/09 dadams</span>
<span class="linecomment">;;     Added delete-windows-on and made it interactive.</span>
<span class="linecomment">;; 1996/01/08 dadams</span>
<span class="linecomment">;;     Added rename-non-minibuffer-frame.  Use in iconify-everything,</span>
<span class="linecomment">;;           iconify/map-frame, mouse-iconify/map-frame.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is free software; you can redistribute it and/or modify</span>
<span class="linecomment">;; it under the terms of the GNU General Public License as published by</span>
<span class="linecomment">;; the Free Software Foundation; either version 2, or (at your option)</span>
<span class="linecomment">;; any later version.</span>

<span class="linecomment">;; This program is distributed in the hope that it will be useful,</span>
<span class="linecomment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="linecomment">;; GNU General Public License for more details.</span>

<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with this program; see the file COPYING.  If not, write to</span>
<span class="linecomment">;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth</span>
<span class="linecomment">;; Floor, Boston, MA 02110-1301, USA.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Code:</span>

(eval-when-compile (require 'cl)) <span class="linecomment">;; case, incf (plus, for Emacs 20: dolist)</span>
(require 'frame-fns) <span class="linecomment">;; frame-geom-value-numeric, frames-on, get-frame-name, get-a-frame, read-frame</span>
(require 'strings nil t) <span class="linecomment">;; (no error if not found) read-buffer</span>
(require 'misc-fns nil t) <span class="linecomment">;; (no error if not found) another-buffer</span>

<span class="linecomment">;; Don't require even to byte-compile, because doremi-frm.el soft-requires frame-cmds.el</span>
<span class="linecomment">;; (eval-when-compile (require 'doremi-frm nil t)) ;; (no error if not found)</span>
<span class="linecomment">;;                                                 ;; doremi-push-current-frame-config</span>

<span class="linecomment">;; Not required here, because this library requires `frame-cmds.el': `thumb-frm.el'.</span>
<span class="linecomment">;; However, `frame-cmds.el' soft-uses `thumfr-thumbnail-frame-p', which is defined</span>
<span class="linecomment">;; in `thumb-frm.el'.</span>

<span class="linecomment">;; Quiet byte-compiler.</span>
(defvar mac-tool-bar-display-mode)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;</span>




<span class="linecomment">;;; USER OPTIONS (VARIABLES) ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

(defgroup Frame-Commands nil
  "<span class="quote">Miscellaneous frame and window commands.</span>"
  :group 'frames
  :link `(url-link :tag "<span class="quote">Send Bug Report</span>"
          ,(concat "<span class="quote">mailto:</span>" "<span class="quote">drew.adams</span>" "<span class="quote">@</span>" "<span class="quote">oracle</span>" "<span class="quote">.com?subject=\
frame-cmds.el bug: \
&body=Describe bug here, starting with `emacs -q'.  \
Don't forget to mention your Emacs and library versions.</span>"))
  :link '(url-link :tag "<span class="quote">Other Libraries by Drew</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/DrewsElispLibraries</span>")
  :link '(url-link :tag "<span class="quote">Download</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/frame-cmds.el</span>")
  :link '(url-link :tag "<span class="quote">Description - `delete-window'</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/FrameModes</span>")
  :link '(url-link :tag "<span class="quote">Description - Frame Renaming</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/FrameTitle</span>")
  :link '(url-link :tag "<span class="quote">Description - Frame Resizing</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/Shrink-Wrapping_Frames</span>")
  :link '(url-link :tag "<span class="quote">Description - Frame Customization</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/CustomizingAndSaving</span>")
  :link '(url-link :tag "<span class="quote">Description - Frame Tiling</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/Frame_Tiling_Commands</span>")
  :link '(url-link :tag "<span class="quote">Description - General</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/FrameModes</span>")
  :link '(emacs-commentary-link :tag "<span class="quote">Commentary</span>" "<span class="quote">frame-cmds</span>")
  )

(defcustom rename-frame-when-iconify-flag t
  "<span class="quote">*Non-nil means frames are renamed when iconified.
The new name is the name of the current buffer.</span>"
  :type 'boolean :group 'Frame-Commands)

(defcustom frame-config-register ?\C-l  <span class="linecomment">; Control-L is the name of the register.</span>
  "<span class="quote">*Character naming register for saving/restoring frame configuration.</span>"
  :type 'character :group 'Frame-Commands)

(defcustom show-hide-show-function 'jump-to-frame-config-register
  "<span class="quote">*Function to show stuff that is hidden or iconified by `show-hide'.
Candidates include `jump-to-frame-config-register' and `show-buffer-menu'.</span>"
  :type '(choice (const :tag "<span class="quote">Restore frame configuration</span>" jump-to-frame-config-register)
                 (function :tag "<span class="quote">Another function</span>"))
  :group 'Frame-Commands)

(defcustom window-mgr-title-bar-pixel-height (if (eq window-system 'mac) 22 27)
  "<span class="quote">*Height of frame title bar provided by the window manager, in pixels.
You might alternatively call this constant the title-bar \"width\" or
\"thickness\".  There is no way for Emacs to determine this, so you
must set it.</span>"
  :type 'integer :group 'Frame-Commands)

(defcustom enlarge-font-tries 100
  "<span class="quote">*Number of times to try to change font-size, when looking for a font.
The font-size portion of a font name is incremented or decremented at
most this many times, before giving up and raising an error.</span>"
  :type 'integer :group 'Frame-Commands)

(defcustom frame-parameters-to-exclude '((window-id) (buffer-list) (name) (title) (icon-name))
  "<span class="quote">*Parameters to exclude in `set-all-frame-alist-parameters-from-frame'.
An alist of the same form as that returned by `frame-parameters'.
The cdr of each alist element is ignored.
These frame parameters are not copied to the target alist.</span>"
  :type '(repeat (cons symbol sexp)) :group 'Frame-Commands)

(defcustom move-frame-wrap-within-display-flag t
  "<span class="quote">*Non-nil means wrap frame movements within the display.
Commands `move-frame-up', `move-frame-down', `move-frame-left', and
`move-frame-right' then move the frame back onto the display when it
moves off of it.
If nil, you can move the frame as far off the display as you like.</span>"
  :type 'boolean :group 'Frame-Commands)

(defcustom available-screen-pixel-bounds nil
  "<span class="quote">*Upper left and lower right of available screen space for tiling frames.
Integer list: (x0 y0 x1 y1), where (x0, y0) is the upper left position
and (x1, y1) is the lower right position.  Coordinates are in pixels,
measured from the screen absolute origin, (0, 0), at the upper left.

If this is nil, then the available space is calculated.  That should
give good results in most cases.</span>"
  :type '(list
          (integer :tag "<span class="quote">X0 (upper left) - pixels from screen left</span>")
          (integer :tag "<span class="quote">Y0 (upper left) - pixels from screen top</span>")
          (integer :tag "<span class="quote">X1 (lower right) - pixels from screen left</span>" )
          (integer :tag "<span class="quote">Y1 (lower right) - pixels from screen top</span>"))
  :group 'Frame-Commands)



<span class="linecomment">;;; FUNCTIONS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>


<span class="linecomment">;;;###autoload</span>
(defun save-frame-config ()
  "<span class="quote">Save current frame configuration.
You can restore it with \\[jump-to-frame-config-register].</span>"
  (interactive)
  (frame-configuration-to-register frame-config-register)
  (when (fboundp 'doremi-push-current-frame-config) <span class="linecomment">; In `doremi-frm.el'.</span>
    (doremi-push-current-frame-config))
  (message
   (substitute-command-keys
    (if (fboundp 'doremi-frame-configs) <span class="linecomment">; In `doremi-frm.el'.</span>
        (format "<span class="quote">Use `\\[jump-to-frame-config-register]' (`C-x r j %c') or \
`\\[doremi-frame-configs]' to restore frames as before (undo).</span>" frame-config-register)
      "<span class="quote">Use `\\[jump-to-frame-config-register]' to restore frames as before (undo).</span>"))))

<span class="linecomment">;;;###autoload</span>
(defun jump-to-frame-config-register ()
  "<span class="quote">Restore frame configuration saved in `frame-config-register'.</span>"
  (interactive)
  (jump-to-register frame-config-register))

<span class="linecomment">;;;###autoload</span>
(defun iconify-everything ()
  "<span class="quote">Iconify all frames of session at once.
Remembers frame configuration in register `C-l' (Control-L).
To restore this frame configuration, use `\\[jump-to-register] C-l'.</span>"
  (interactive)
  (frame-configuration-to-register frame-config-register)
  (let ((thumfr-thumbify-dont-iconify-flag  nil)) <span class="linecomment">; Defined in `thumb-frm.el'.</span>
    (dolist (frame  (visible-frame-list))
      (when rename-frame-when-iconify-flag (rename-non-minibuffer-frame frame))
      (iconify-frame frame))))

<span class="linecomment">;;;###autoload</span>
(defun hide-everything ()
  "<span class="quote">Hide all frames of session at once.
Iconify minibuffer frame; make all others invisible.
Remembers frame configuration in register `C-l' (Control-L).
To restore this frame configuration, use `\\[jump-to-register] C-l'.</span>"
  (interactive)
  (frame-configuration-to-register frame-config-register)
  (let ((minibuf-frame-name
         (and (boundp '1on1-minibuffer-frame)
              (cdr (assq 'name (frame-parameters 1on1-minibuffer-frame)))))
        (thumfr-thumbify-dont-iconify-flag  nil)) <span class="linecomment">; Defined in `thumb-frm.el'.</span>
    (dolist (frame  (frame-list))
      (if (eq minibuf-frame-name (cdr (assq 'name (frame-parameters frame))))
          (iconify-frame frame)         <span class="linecomment">; minibuffer frame</span>
        (make-frame-invisible frame t))))) <span class="linecomment">; other frames</span>

<span class="linecomment">;;;###autoload</span>
(defun show-hide ()
  "<span class="quote">1 frame visible: `show-hide-show-function'; else: `hide-everything'.
This acts as a toggle between showing all frames and showing only an
iconified minibuffer frame.</span>"
  (interactive)
  (if (&lt; (length (visible-frame-list)) 2)
      (funcall show-hide-show-function)
    (hide-everything)))

<span class="linecomment">;;;###autoload</span>
(defun show-buffer-menu ()
  "<span class="quote">Call `buffer-menu' after making all frames visible.
Useful after using `hide-everything' because of a Windows bug that
doesn't let you display frames that have been made visible after
being made invisible.</span>"
  (interactive)
  (let ((minibuf-frame-name
         (and (boundp '1on1-minibuffer-frame)
              (cdr (assq 'name (frame-parameters 1on1-minibuffer-frame))))))
    (dolist (frame (frame-list))
      (if (eq minibuf-frame-name
              (cdr (assq 'name (frame-parameters frame))))
          (make-frame-visible frame)    <span class="linecomment">; minibuffer frame</span>
        (iconify-frame frame)))         <span class="linecomment">; other frames</span>
    (buffer-menu)))

<span class="linecomment">;;;###autoload</span>
(defun mouse-show-hide-mark-unmark (event)
  "<span class="quote">In minibuffer: `show-hide'.  In dired: mark/unmark; else: buffer menu.</span>"
  (interactive "<span class="quote">e</span>")
  (if (window-minibuffer-p (posn-window (event-start event)))
      (show-hide)
    (or (and (memq major-mode '(dired-mode vc-dired-mode))
             (fboundp 'diredp-mouse-mark/unmark)
             (diredp-mouse-mark/unmark event)) <span class="linecomment">; Return nil if not on a file or dir.</span>
        (mouse-buffer-menu event))))

<span class="linecomment">;;;###autoload</span>
(defun iconify/map-frame (&optional iconify-all)
  "<span class="quote">Iconify selected frame if now mapped.  Map it if now iconified.
With non-nil prefix arg ICONIFY-ALL, iconify all visible frames.</span>"
  (interactive "<span class="quote">P</span>")
  (if iconify-all
      (iconify-everything)
    (when rename-frame-when-iconify-flag (rename-non-minibuffer-frame))
    (iconify-or-deiconify-frame)))

<span class="linecomment">;;;###autoload</span>
(defun mouse-iconify/map-frame (event)
  "<span class="quote">Iconify frame clicked on, if now mapped.  Map it if now iconified.</span>"
  (interactive "<span class="quote">e</span>")
  (select-window (posn-window (event-start event)))
  (when rename-frame-when-iconify-flag (rename-non-minibuffer-frame))
  (iconify-or-deiconify-frame))


(or (fboundp 'old-delete-window)
    (fset 'old-delete-window (symbol-function 'delete-window)))


<span class="linecomment">;; REPLACES ORIGINAL (built-in):</span>
<span class="linecomment">;; If WINDOW is the only one in its frame, `delete-frame'.</span>
<span class="linecomment">;;;###autoload</span>
(defun delete-window (&optional window)
  "<span class="quote">Remove WINDOW from the display.  Default is `selected-window'.
If WINDOW is the only one in its frame, then `delete-frame' too.</span>"
  (interactive)
  (save-current-buffer
    (setq window (or window (selected-window)))
    (select-window window)
    (if (one-window-p t) (delete-frame) (old-delete-window (selected-window)))))

<span class="linecomment">;;;###autoload</span>
(defun delete-windows-for (&optional buffer)
  "<span class="quote">`delete-window' or prompt for buffer and delete its windows.
With no prefix arg, delete the selected window.
With a prefix arg, prompt for a buffer and delete all windows, on any
  frame, that show that buffer.</span>"
  (interactive (list (and current-prefix-arg (read-buffer-for-delete-windows))))
  (if buffer (delete-windows-on buffer) (delete-window)))


<span class="linecomment">;; REPLACES ORIGINAL (built-in):</span>
<span class="linecomment">;; 1) Use `read-buffer' in interactive spec.</span>
<span class="linecomment">;; 2) Do not raise an error if BUFFER is a string that does not name a buffer.</span>
<span class="linecomment">;; 3) Call `delete-window', so if you use my `delete-window' then this also deletes</span>
<span class="linecomment">;;    frames where window showing the BUFFER is the only window.</span>
<span class="linecomment">;;;###autoload</span>
(defun delete-windows-on (&optional buffer frame)
  "<span class="quote">Delete windows showing BUFFER.
Optional arg BUFFER defaults to the current buffer.

Optional second arg FRAME controls which frames are considered.
  If nil or omitted, delete all windows showing BUFFER in any frame.
  If t, delete only windows showing BUFFER in the selected frame.
  If `visible', delete all windows showing BUFFER in any visible frame.
  If a frame, delete only windows showing BUFFER in that frame.

Interactively, FRAME depends on the prefix arg, as follows:
  Without a prefix arg (prefix = nil), FRAME is nil (all frames).
  With prefix arg &gt;= 0, FRAME is t (this frame only).
  With prefix arg &lt; 0,  FRAME is `visible' (all visible frames).</span>"
  (interactive
   (list (read-buffer-for-delete-windows)
         (and current-prefix-arg
              (or (natnump (prefix-numeric-value current-prefix-arg))
                  'visible))))
  (unless buffer (setq buffer  (current-buffer))) <span class="linecomment">; Like Emacs 23+ - unlike Emacs 21-22.</span>

  <span class="linecomment">;; `get-buffer-window' interprets FRAME oppositely for t and nil, so switch.</span>
  (setq frame (if (eq t frame) nil (if (eq nil frame) t frame)))
  (let (win)
    <span class="linecomment">;; Vanilla Emacs version raises an error if BUFFER is a string that does not name a buffer.</span>
    <span class="linecomment">;; We do not raise an error - we do nothing.</span>
    (and (get-buffer buffer)
         (while (setq win (get-buffer-window buffer frame))
           (delete-window win))
         nil)))                         <span class="linecomment">; Return nil always, like vanilla Emacs.</span>

(defun read-buffer-for-delete-windows ()
  "<span class="quote">Read buffer name for delete-windows commands.
Only displayed buffers are completion candidates.</span>"
  (completing-read "<span class="quote">Delete windows on buffer: </span>"
                   (let ((all-bufs   (buffer-list))
                         (cand-bufs  ()))
                     (dolist (buf  all-bufs)
                       (when (get-buffer-window buf t)
                         (push (list (buffer-name buf)) cand-bufs)))
                     cand-bufs)
                   nil t nil 'minibuffer-history (buffer-name (current-buffer)) t))

(defsubst frame-iconified-p (frame)
  "<span class="quote">Return non-nil if FRAME is `frame-live-p' and `frame-visible-p'.</span>"
  (and (frame-live-p frame) (eq (frame-visible-p frame) 'icon)))

<span class="linecomment">;; (defun remove-window (&optional window)</span>
<span class="linecomment">;;   "Remove WINDOW from the display.  Default is `selected-window'.</span>
<span class="linecomment">;; If WINDOW is the only one in its frame, then:</span>
<span class="linecomment">;;    If WINDOW is dedicated to its buffer, then make its frame invisible.</span>
<span class="linecomment">;;    Otherwise, delete its frame (as well as the window)."</span>
<span class="linecomment">;;   (interactive)</span>
<span class="linecomment">;;   (setq window (or window (selected-window)))</span>
<span class="linecomment">;;   (select-window window)</span>
<span class="linecomment">;;   (if (and (window-dedicated-p (selected-window))</span>
<span class="linecomment">;;            (one-window-p t))</span>
<span class="linecomment">;;       (let ((fr (selected-frame)))</span>
<span class="linecomment">;;         ;; HACK because of Emacs bug: `raise-frame' won't raise a frame</span>
<span class="linecomment">;;         ;; that was first iconified and then made invisible.</span>
<span class="linecomment">;;         ;; So, here we don't make an iconified frame invisible.</span>
<span class="linecomment">;;         (unless (frame-iconified-p fr)</span>
<span class="linecomment">;;           (make-frame-invisible fr)))</span>
<span class="linecomment">;;     (delete-window)))</span>

<span class="linecomment">;; REMOVED old definition, above, because of problems with invisible</span>
<span class="linecomment">;; *Completions* frame when use completion window with subsequent args</span>
<span class="linecomment">;; to a command.  Just use `delete-window' now, which deletes frame if</span>
<span class="linecomment">;; `one-window-p'.  Use a `defalias' because its easier than replacing</span>
<span class="linecomment">;; all my calls to `remove-window' with `delete-window'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defalias 'remove-window 'delete-window)

<span class="linecomment">;;;###autoload</span>
(defun remove-windows-on (buffer)
  "<span class="quote">Remove all windows showing BUFFER.  This calls `remove-window'
on each window showing BUFFER.</span>"
  (interactive
   (list (read-buffer "<span class="quote">Remove all windows showing buffer: </span>" (current-buffer) 'existing)))
  (setq buffer (get-buffer buffer))     <span class="linecomment">; Convert to buffer.</span>
  (when buffer                          <span class="linecomment">; Do nothing if null BUFFER.</span>
    (dolist (fr (frames-on buffer t))
      (remove-window (get-buffer-window buffer t)))))

<span class="linecomment">;;;###autoload</span>
(defun mouse-remove-window (event)
  "<span class="quote">Remove the window you click on.  (This calls `remove-window'.)
This command must be bound to a mouse click.</span>"
  (interactive "<span class="quote">e</span>")
  (mouse-minibuffer-check event)
  (remove-window (posn-window (event-start event))))

<span class="linecomment">;;;###autoload</span>
(defun delete/iconify-window (&optional window frame-p)
  "<span class="quote">Delete or iconify WINDOW (default: `selected-window').
If WINDOW is the only one in its frame (`one-window-p'), then optional
arg FRAME-P determines the behavior regarding the frame, as follows:
  If FRAME-P is nil, then the frame is deleted (with the window).
  If FRAME-P is t, then the frame is iconified.
  If FRAME-P is a symbol naming a function, the function is applied
             to WINDOW as its only arg.
             If the result is nil, then the frame is deleted.
             If the result is non-nil, then the frame is iconified.
  If FRAME-P is anything else, then behavior is as if FRAME-P were the
             symbol `window-dedicated-p': the frame is iconified if
             WINDOW is dedicated, otherwise the frame is deleted.

Interactively, FRAME-P depends on the prefix arg, as follows:
  Without a prefix arg (prefix = nil), FRAME-P is `window-dedicated-p'.
  With prefix arg &lt; 0, FRAME-P is t.  The frame is iconified.
  With prefix arg &gt;= 0, FRAME-P is nil.  The frame is deleted.</span>"
  (interactive
   (list nil (if current-prefix-arg
                 (not (natnump (prefix-numeric-value current-prefix-arg)))
               'window-dedicated-p)))
  (setq window (or window (selected-window)))
  (let ((one-win-p t))
    (save-window-excursion
      (select-window window)
      (if (one-window-p)
          (if frame-p
              (if (eq t frame-p)
                  (iconify-frame)
                (unless (and (symbolp frame-p) (fboundp frame-p))
                  (setq frame-p 'window-dedicated-p))
                (if (funcall frame-p window) (iconify-frame) (delete-frame)))
            (delete-frame))             <span class="linecomment">; Default.</span>
        (setq one-win-p nil)))
    <span class="linecomment">;; Do this outside `save-window-excursion'.</span>
    (unless one-win-p (old-delete-window window))))

<span class="linecomment">;;;###autoload</span>
(defun delete/iconify-windows-on (buffer &optional frame frame-p)
  "<span class="quote">For each window showing BUFFER: delete it or iconify its frame.
\(This calls `delete/iconify-window' on each window showing BUFFER.)

Optional second arg FRAME controls which frames are considered.
  If nil or omitted, treat all windows showing BUFFER in any frame.
  If t, treat only windows showing BUFFER in the selected frame.
  If `visible', treat all windows showing BUFFER in any visible frame.
  If a frame, treat only windows showing BUFFER in that frame.

Optional third arg FRAME-P controls what to do with one-window frames.
  If FRAME-P is nil, then one-window frames showing BUFFER are deleted.
  If FRAME-P is t, then one-window frames are iconified.
  If FRAME-P is a symbol naming a function, the function is applied
             to each window showing buffer in a frame by itself.
             If the result is nil, then the frame is deleted.
             If the result is non-nil, then the frame is iconified.
  If FRAME-P is anything else, then behavior is as if FRAME-P were the
             symbol `window-dedicated-p': One-window frames are
             iconified if window is dedicated, else they are deleted.

Interactively, FRAME is nil, and FRAME-P depends on the prefix arg:
  Without a prefix arg (prefix = nil), FRAME-P is `window-dedicated-p'.
  With prefix arg &lt; 0, FRAME-P is t.  The frame is iconified.
  With prefix arg &gt;= 0, FRAME-P is nil.  The frame is deleted.</span>"
  (interactive
   (list (read-buffer "<span class="quote">Delete windows on buffer: </span>" (current-buffer) 'existing)
         nil
         (if current-prefix-arg
             (not (natnump (prefix-numeric-value current-prefix-arg)))
           'window-dedicated-p)))
  (setq buffer (get-buffer buffer))     <span class="linecomment">; Convert to buffer.</span>
  (when buffer                          <span class="linecomment">; Do nothing if null BUFFER.</span>
    <span class="linecomment">;; `get-buffer-window' interprets FRAME oppositely for t and nil,</span>
    <span class="linecomment">;; so switch.</span>
    (setq frame (if (eq t frame) nil (if (eq nil frame) t frame)))
    (dolist (fr (frames-on buffer frame))
      (delete/iconify-window (get-buffer-window buffer frame) frame-p))))

<span class="linecomment">;;;###autoload</span>
(defun rename-frame (&optional old-name new-name all-named)
  "<span class="quote">Rename a frame named OLD-NAME to NEW-NAME.
Prefix arg ALL-NAMED non-nil means rename all frames named FRAME to NEWNAME.

OLD-NAME may be a frame, its name, or nil.  Default is `selected-frame'.

NEW-NAME is a string or nil.  Default NEW-NAME is current `buffer-name'.</span>"
  (interactive
   (list (read-frame (concat "<span class="quote">Rename </span>" (and current-prefix-arg "<span class="quote">all </span>")
                             "<span class="quote">frame</span>" (and current-prefix-arg "<span class="quote">s named</span>") "<span class="quote">: </span>")
                     nil t)             <span class="linecomment">; Default = selected.  Must exist.</span>
         (read-from-minibuffer "<span class="quote">Rename to (new name): </span>" (cons (buffer-name) 1))
         current-prefix-arg))
  (setq old-name (or old-name (get-frame-name))) <span class="linecomment">; Batch default: current.</span>
  (setq new-name (or new-name (buffer-name))) <span class="linecomment">; Batch default: buffer name.</span>
  <span class="linecomment">;; Convert to frame if string.</span>
  (let ((fr (get-a-frame old-name)))
    (if all-named
        (while fr
          (modify-frame-parameters fr (list (cons 'name new-name)))
          (setq fr (get-a-frame old-name))) <span class="linecomment">; Get another.</span>
      (when (string= (get-frame-name fr) (get-frame-name))
        (setq fr (selected-frame)))
      (modify-frame-parameters fr (list (cons 'name new-name))))))

<span class="linecomment">;;;###autoload</span>
(defun rename-non-minibuffer-frame (&optional old-name new-name all-named)
  "<span class="quote">Unless OLD-NAME names the minibuffer frame, use `rename-frame'
to rename a frame named OLD-NAME to NEW-NAME.

Prefix arg ALL-NAMED non-nil =&gt; Rename all frames named FRAME to NEWNAME.
OLD-NAME may be a frame, its name, or nil.  Default is `selected-frame'.
NEW-NAME is a string or nil.  Default NEW-NAME is current `buffer-name'.</span>"
  (interactive
   (list (read-frame (concat "<span class="quote">Rename </span>" (and current-prefix-arg "<span class="quote">all </span>")
                             "<span class="quote">frame</span>" (and current-prefix-arg "<span class="quote">s named</span>") "<span class="quote">: </span>")
                     nil t)             <span class="linecomment">; Default = selected.  Must exist.</span>
         (read-from-minibuffer "<span class="quote">Rename to (new name): </span>" (cons (buffer-name) 1))
         current-prefix-arg))
  (setq old-name (or old-name (get-frame-name))) <span class="linecomment">; Batch default: current.</span>
  (setq new-name (or new-name (buffer-name))) <span class="linecomment">; Batch default: buffer name.</span>
  (let ((fr (get-a-frame old-name)))    <span class="linecomment">; Convert to frame if string.</span>
    (if (and (boundp '1on1-minibuffer-frame)
             (eq (cdr (assq 'name (frame-parameters 1on1-minibuffer-frame)))
                 (cdr (assq 'name (frame-parameters fr)))))
        (and (interactive-p)
             (error "<span class="quote">Use `rename-frame' if you really want to rename minibuffer</span>"))
      (rename-frame))))

<span class="linecomment">;;;###autoload</span>
(defun show-frame (frame)
  "<span class="quote">Make FRAME visible and raise it, without selecting it.
FRAME may be a frame or its name.</span>"
  (interactive (list (read-frame "<span class="quote">Frame to make visible: </span>")))
  (setq frame (get-a-frame frame))
  (make-frame-visible frame)
  (raise-frame frame))

<span class="linecomment">;;;###autoload</span>
(defun hide-frame (frame &optional prefix)
  "<span class="quote">Make FRAME invisible.  Like `make-frame-invisible', but reads frame name.
Non-nil PREFIX makes it invisible even if all other frames are invisible.</span>"
  (interactive (list (read-frame "<span class="quote">Frame to make invisible: </span>")))
  (make-frame-invisible (get-a-frame frame) prefix))

<span class="linecomment">;;;###autoload</span>
(defun show-a-frame-on (buffer)
  "<span class="quote">Make visible and raise a frame showing BUFFER, if there is one.
Neither the frame nor the BUFFER are selected.
BUFFER may be a buffer or its name (a string).</span>"
  (interactive
   (list (read-buffer "<span class="quote">Show a frame showing buffer: </span>"
                      (if (fboundp 'another-buffer) <span class="linecomment">; Defined in `misc-fns.el'.</span>
                          (another-buffer nil t)
                        (other-buffer (current-buffer)))
                      'existing)))
  (when buffer                          <span class="linecomment">; Do nothing if null BUFFER.</span>
    (let ((fr (car (frames-on buffer)))) (when fr (show-frame fr)))))

<span class="linecomment">;;;###autoload</span>
(defun show-*Help*-buffer ()
  "<span class="quote">Raise a frame showing buffer *Help*, without selecting it.</span>"
  (interactive) (show-a-frame-on "<span class="quote">*Help*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun delete-1-window-frames-on (buffer)
  "<span class="quote">Delete all visible 1-window frames showing BUFFER.</span>"
  (interactive
   (list (read-buffer "<span class="quote">Delete all visible 1-window frames showing buffer: </span>"
                      (current-buffer) 'existing)))
  (setq buffer (get-buffer buffer))
  (save-excursion
    (when (buffer-live-p buffer)        <span class="linecomment">; Do nothing if dead buffer.</span>
      (dolist (fr (frames-on buffer))   <span class="linecomment">; Is it better to search through</span>
        (save-window-excursion          <span class="linecomment">; `frames-on' or `get-buffer-window-list'?</span>
          (select-frame fr)
          (when (one-window-p t fr) (delete-frame)))))))

<span class="linecomment">;;;###autoload</span>
(defun delete-other-frames (&optional frame)
  "<span class="quote">Delete all frames except FRAME (default: selected frame).
Interactively, use a prefix arg (`\\[universal-argument]') to be prompted for FRAME.</span>"
  (interactive (list (if current-prefix-arg
                         (get-a-frame (read-frame "<span class="quote">Frame to make invisible: </span>"))
                       (selected-frame))))
  (when frame
    (dolist (fr (frame-list))
      (unless (eq fr frame) (condition-case nil (delete-frame fr) (error nil))))))

<span class="linecomment">;;;###autoload</span>
(defun maximize-frame-horizontally (&optional frame)
  "<span class="quote">Maximize selected frame horizontally.</span>"
  (interactive (list (selected-frame)))
  (maximize-frame 'horizontal frame))

<span class="linecomment">;;;###autoload</span>
(defun maximize-frame-vertically (&optional frame)
  "<span class="quote">Maximize selected frame vertically.</span>"
  (interactive (list (selected-frame)))
  (maximize-frame 'vertical frame))

<span class="linecomment">;;;###autoload</span>
(defun maximize-frame (&optional direction frame)
  "<span class="quote">Maximize selected frame horizontally, vertically, or both.
With no prefix arg, maximize both directions.
With a non-negative prefix arg, maximize vertically.
With a negative prefix arg, maximize horizontally.

In Lisp code:
 DIRECTION is the direction: `horizontal', `vertical', or `both'.
 FRAME is the frame to maximize.</span>"
  (interactive (list (if current-prefix-arg
                         (if (natnump (prefix-numeric-value current-prefix-arg))
                             'vertical
                           'horizontal)
                       'both)))
  (unless frame (setq frame  (selected-frame)))
  (unless direction (setq direction 'both))
  (let (<span class="linecomment">;; Size of a frame that uses all of the available screen area,</span>
        <span class="linecomment">;; but leaving room for a minibuffer frame at bottom of display.</span>
        (fr-pixel-width   (available-screen-pixel-width))
        (fr-pixel-height  (available-screen-pixel-height))
        (fr-origin        (if (eq direction 'horizontal)
                              (car (effective-screen-pixel-bounds))
                            (cadr (effective-screen-pixel-bounds))))
        (orig-left        (frame-parameter frame 'left))
        (orig-top         (frame-parameter frame 'top))
        (orig-width       (frame-parameter frame 'width))
        (orig-height      (frame-parameter frame 'height)))
    (let* ((borders     (* 2 (cdr (assq 'border-width (frame-parameters frame)))))
           (new-left    (if (memq direction '(horizontal both)) fr-origin 0))
           (new-top     (if (memq direction '(horizontal both)) 0         fr-origin))
           <span class="linecomment">;; Subtract borders, scroll bars, & title bar, then convert pixel sizes to char sizes.</span>
           (new-width   (if (memq direction '(horizontal both))
                            (/ (- fr-pixel-width borders (frame-extra-pixels-width frame))
                               (frame-char-width frame))
                          orig-width))
           (new-height  (if (memq direction '(vertical both))
                            (- (/ (- fr-pixel-height borders
                                     (frame-extra-pixels-height frame)
                                     window-mgr-title-bar-pixel-height
                                     (smart-tool-bar-pixel-height))
                                  (frame-char-height frame))
                               <span class="linecomment">;; Subtract menu bar unless on Carbon Emacs (menu bar not in the frame).</span>
                               (if (eq window-system 'mac)
                                   0
                                 (cdr (assq 'menu-bar-lines (frame-parameters frame)))))
                          orig-height)))
      (modify-frame-parameters
       frame
       `((left   . ,new-left)
         (width  . ,new-width)
         (top    . ,new-top)
         (height . ,new-height)
         <span class="linecomment">;; If we actually changed a parameter, record the old one for restoration.</span>
         ,(and new-left   (/= orig-left new-left)     (cons 'restore-left   orig-left))
         ,(and new-top    (/= orig-top  new-top)      (cons 'restore-top    orig-top))
         ,(and new-width  (/= orig-width  new-width)  (cons 'restore-width  orig-width))
         ,(and new-height (/= orig-height new-height) (cons 'restore-height orig-height)))))
    (show-frame frame)
    (incf fr-origin (if (eq direction 'horizontal) fr-pixel-width fr-pixel-height))))

<span class="linecomment">;;;###autoload</span>
(defalias 'restore-frame-horizontally 'toggle-max-frame-horizontally)
<span class="linecomment">;;;###autoload</span>
(defun toggle-max-frame-horizontally (&optional frame)
  "<span class="quote">Toggle maximization of FRAME horizontally.
If used once, this restores the frame.  If repeated, it maximizes.
This affects the `left' and `width' frame parameters.

FRAME defaults to the selected frame.</span>"
  (interactive (list (selected-frame)))
  (restore-frame 'horizontal frame))

<span class="linecomment">;;;###autoload</span>
(defalias 'restore-frame-horizontally 'toggle-max-frame-horizontally)
<span class="linecomment">;;;###autoload</span>
(defun toggle-max-frame-vertically (&optional frame)
  "<span class="quote">Toggle maximization of FRAME vertically.
If used once, this restores the frame.  If repeated, it maximizes.
This affects the `top' and `height' frame parameters.

FRAME defaults to the selected frame.</span>"
  (interactive (list (selected-frame)))
  (restore-frame 'vertical frame))

<span class="linecomment">;;;###autoload</span>
(defalias 'restore-frame 'toggle-max-frame)
<span class="linecomment">;;;###autoload</span>
(defun toggle-max-frame (&optional direction frame)
  "<span class="quote">Toggle maximization of FRAME horizontally, vertically, or both.
Reverses or (if restored) repeats the effect of the Emacs maximize
commands.  Does not restore from maximization effected outside Emacs.

With no prefix arg, toggle both directions.
With a non-negative prefix arg, toggle only vertically.
With a negative prefix arg, toggle horizontally.

When toggling both, each is toggled from its last maximize or restore
state.  This means that using this after `maximize-horizontal',
`maximize-vertical', `toggle-max-horizontal', or `toggle-max-vertical'
does not necessarily just reverse the effect of that command.

In Lisp code:
 DIRECTION is the direction: `horizontal', `vertical', or `both'.
 FRAME is the frame to change.  It defaults to the selected frame.</span>"
  (interactive (list (if current-prefix-arg
                         (if (natnump (prefix-numeric-value current-prefix-arg))
                             'vertical
                           'horizontal)
                       'both)))
  (unless frame (setq frame  (selected-frame)))
  (unless direction (setq direction 'both))
  (let ((restore-left    (frame-parameter frame 'restore-left))
        (restore-top     (frame-parameter frame 'restore-top))
        (restore-width   (frame-parameter frame 'restore-width))
        (restore-height  (frame-parameter frame 'restore-height))
        (orig-left       (frame-parameter frame 'left))
        (orig-top        (frame-parameter frame 'top))
        (orig-width      (frame-parameter frame 'width))
        (orig-height     (frame-parameter frame 'height))
        (horiz           (memq direction '(horizontal both)))
        (vert            (memq direction '(vertical both))))
    (modify-frame-parameters
     frame `(,(and horiz restore-left   (cons 'left   restore-left))
             ,(and horiz restore-width  (cons 'width  restore-width))
             ,(and vert  restore-top    (cons 'top    restore-top))
             ,(and vert  restore-height (cons 'height restore-height))
             ,(and horiz restore-left   (cons 'restore-left   orig-left))
             ,(and horiz restore-width  (cons 'restore-width  orig-width))
             ,(and vert  restore-top    (cons 'restore-top    orig-top))
             ,(and vert  restore-height (cons 'restore-height orig-height)))))
  (show-frame frame))

<span class="linecomment">;;;###autoload</span>
(defun tile-frames-horizontally (&optional frames)
  "<span class="quote">Tile frames horizontally.
Interatively:
  With prefix arg, you are prompted for names of two frames to tile.
  With no prefix arg, all visible frames are tiled, except a
       standalone minibuffer frame, if any.
If called from a program, all frames in list FRAMES are tiled.</span>"
  (interactive (and current-prefix-arg (read-args-for-tile-frames)))
  (tile-frames 'horizontal frames))

<span class="linecomment">;;;###autoload</span>
(defun tile-frames-vertically (&optional frames)
  "<span class="quote">Tile frames vertically.
Interatively:
  With prefix arg, you are prompted for names of two frames to tile.
  With no prefix arg, all visible frames are tiled, except a
       standalone minibuffer frame, if any.
If called from a program, all frames in list FRAMES are tiled.</span>"
  (interactive (and current-prefix-arg (read-args-for-tile-frames)))
  (tile-frames 'vertical frames))

(defun tile-frames (direction frames)
  "<span class="quote">Tile visible frames horizontally or vertically, depending on DIRECTION.
Arg DIRECTION is `horizontal' or `vertical'.
Arg FRAMES is the list of frames to tile.  If nil, then tile all visible
frames (except a standalone minibuffer frame, if any).</span>"
  (let ((visible-frames
         (or frames
             (filtered-frame-list       <span class="linecomment">; Get visible frames, except minibuffer.</span>
              (function
               (lambda (fr)
                (and (eq t (frame-visible-p fr))
                     (or (not (fboundp 'thumfr-thumbnail-frame-p))
                         (not (thumfr-thumbnail-frame-p fr)))
                     (or (not (boundp '1on1-minibuffer-frame))
                         (not (eq (cdr (assq 'name (frame-parameters 1on1-minibuffer-frame)))
                                  (cdr (assq 'name (frame-parameters fr))))))))))))
        <span class="linecomment">;; Size of a frame that uses all of the available screen area,</span>
        <span class="linecomment">;; but leaving room for a minibuffer frame at bottom of display.</span>
        (fr-pixel-width (available-screen-pixel-width))
        (fr-pixel-height (available-screen-pixel-height))
        (fr-origin (if (eq direction 'horizontal)
                       (car (effective-screen-pixel-bounds))
                     (cadr (effective-screen-pixel-bounds)))))
    (case direction                     <span class="linecomment">; Size of frame in pixels.</span>
      (horizontal (setq fr-pixel-width  (/ fr-pixel-width  (length visible-frames))))
      (vertical   (setq fr-pixel-height (/ fr-pixel-height (length visible-frames))))
      (otherwise (error "<span class="quote">Function tile-frames: DIRECTION must be `horizontal' or `vertical'</span>")))
    (dolist (fr visible-frames)
      <span class="linecomment">;; $$$$$$ (let ((borders (* 2 (+ (cdr (assq 'border-width (frame-parameters fr)))</span>
      <span class="linecomment">;;                               (cdr (assq 'internal-border-width (frame-parameters fr)))))))</span>
      (let ((borders (* 2 (cdr (assq 'border-width (frame-parameters fr))))))
        (set-frame-size
         fr
         <span class="linecomment">;; Subtract borders, scroll bars, & title bar, then convert pixel sizes to char sizes.</span>
         (/ (- fr-pixel-width borders (frame-extra-pixels-width fr))
            (frame-char-width fr))
         (- (/ (- fr-pixel-height borders (frame-extra-pixels-height fr)
                  window-mgr-title-bar-pixel-height (smart-tool-bar-pixel-height))
               (frame-char-height fr))
            (if (eq window-system 'mac)
                0                       <span class="linecomment">; Menu bar for Carbon Emacs is not in the frame.</span>
              (cdr (assq 'menu-bar-lines (frame-parameters fr))))))) <span class="linecomment">; Subtract `menu-bar-lines'.</span>
      (set-frame-position fr
                          (if (eq direction 'horizontal) fr-origin 0)
                          (if (eq direction 'horizontal) 0 fr-origin))
      (show-frame fr)
      (incf fr-origin (if (eq direction 'horizontal) fr-pixel-width fr-pixel-height)))))

(defun frame-extra-pixels-width (frame)
  "<span class="quote">Pixel difference between FRAME total width and its text area width.</span>"
  (- (frame-pixel-width frame) (* (frame-char-width frame) (frame-width frame))))

(defun frame-extra-pixels-height (frame)
  "<span class="quote">Pixel difference between FRAME total height and its text area height.</span>"
  (- (frame-pixel-height frame) (* (frame-char-height frame) (frame-height frame))))

(defun smart-tool-bar-pixel-height (&optional frame)
  "<span class="quote">Pixel height of Mac smart tool bar.</span>"
  (if (and (boundp 'mac-tool-bar-display-mode) (&gt; (frame-parameter frame 'tool-bar-lines) 0))
      (if (eq mac-tool-bar-display-mode 'icons) 40 56)
    0))

(defun read-args-for-tile-frames ()
  "<span class="quote">Read arguments for `tile-frames'.</span>"
  (list
   (list
    <span class="linecomment">;; Note: `read-frame' puts selected-frame name at front of `frame-name-history'.</span>
    (get-a-frame (read-frame "<span class="quote">Tile two frames - First frame: </span>" nil t))
    <span class="linecomment">;; Get next visible frame.  For default (prompt) value:</span>
    <span class="linecomment">;;   If there is another visible frame in `frame-name-history', use next such.</span>
    <span class="linecomment">;;   Else if there is another visible frame in internal frame list, use next such.</span>
    <span class="linecomment">;;   Else use selected frame. (`frame-name-history' is defined in `frame.el'.)</span>
    (get-a-frame
     (read-frame
      "<span class="quote">Second frame: </span>"
      (let ((fr-names (cdr frame-name-history))
            (visible-p nil)
            (fr nil))
        (while (and (not fr) fr-names)  <span class="linecomment">; While no visible frame found and still fr-names to check.</span>
          (setq fr (car fr-names))      <span class="linecomment">; Name</span>
          (setq fr (get-a-frame fr))    <span class="linecomment">; Frame</span>
          (setq fr (and fr (eq t (frame-visible-p fr)) fr)) <span class="linecomment">; Visible frame</span>
          (setq fr-names (cdr fr-names)))

        <span class="linecomment">;; If no visible frames in history, besides selected-frame,</span>
        <span class="linecomment">;; then get next visible frame (not its name) from internal frame list.</span>
        (unless fr
          (setq fr (selected-frame))
          (while (and (not visible-p)
                      (setq fr (next-frame fr))
                      (not (equal fr (selected-frame)))) <span class="linecomment">; equal =&gt; no other found.</span>
            (setq visible-p (eq t (frame-visible-p fr)))))
        fr)
      t)))))

(defun available-screen-pixel-bounds ()
  "<span class="quote">Returns a value of the same form as `available-screen-pixel-bounds'.
This represents the currently available screen area.</span>"
  (or available-screen-pixel-bounds     <span class="linecomment">; Use the option value, if available.</span>
      (if (fboundp 'mac-display-available-pixel-bounds) <span class="linecomment">; Mac-OS-specific.</span>
          (mac-display-available-pixel-bounds)
        (list 0 0 (x-display-pixel-width) (x-display-pixel-height)))))

<span class="linecomment">; Emacs 20 doesn't have `butlast'.  Define it to avoid requiring `cl.el' at runtime.  From `subr.el'.</span>
(unless (fboundp 'butlast)
  (defun nbutlast (list &optional n)
    "<span class="quote">Modifies LIST to remove the last N elements.</span>"
    (let ((m  (length list)))
      (or n (setq n  1))
      (and (&lt; n m)  (progn (when (&gt; n 0) (setcdr (nthcdr (- (1- m) n) list) ()))
                           list))))

  (defun butlast (list &optional n)
    "<span class="quote">Return a copy of LIST with the last N elements removed.</span>"
    (if (and n (&lt;= n 0))  list  (nbutlast (copy-sequence list) n))))

(defun effective-screen-pixel-bounds ()
  "<span class="quote">Upper left and lower right of available screen space for tiling frames.
This is `available-screen-pixel-bounds', possibly adjusted to allow
for the standalone minibuffer frame provided by `oneonone.el'.</span>"
  (if (boundp '1on1-minibuffer-frame)
      (append (butlast (available-screen-pixel-bounds))
              (list (frame-geom-value-numeric 'top (cdr (assq 'top (frame-parameters
                                                                    1on1-minibuffer-frame))))))
    (available-screen-pixel-bounds)))

(defun available-screen-pixel-width (&optional include-mini-p)
  "<span class="quote">Width of the usable screen, in pixels.
Non-nil optional argument `include-mini-p' means include the space
occupied by a standalone minibuffer, if any.</span>"
  (let ((bounds (if include-mini-p
                    (available-screen-pixel-bounds)
                  (effective-screen-pixel-bounds))))
    (- (caddr bounds) (car bounds)))) <span class="linecomment">; X1 - X0</span>

(defun available-screen-pixel-height (&optional include-mini-p)
  "<span class="quote">Height of the usable screen, in pixels.
Non-nil optional argument `include-mini-p' means include the
space occupied by a standalone minibuffer, if any.</span>"
  (let ((bounds (if include-mini-p
                    (available-screen-pixel-bounds)
                  (effective-screen-pixel-bounds))))
    (- (cadddr bounds) (cadr bounds)))) <span class="linecomment">; Y1 - Y0</span>

<span class="linecomment">;; Inspired by `sk-grow-frame' from Sarir Khamsi [sarir.khamsi@raytheon.com]</span>
<span class="linecomment">;;;###autoload</span>
(defun enlarge-frame (&optional increment frame)
  "<span class="quote">Increase the height of FRAME (default: selected-frame) by INCREMENT.
INCREMENT is in lines (characters).
Interactively, it is given by the prefix argument.</span>"
  (interactive "<span class="quote">p</span>")
  (set-frame-height frame (+ (frame-height frame) increment)))

<span class="linecomment">;;;###autoload</span>
(defun enlarge-frame-horizontally (&optional increment frame)
  "<span class="quote">Increase the width of FRAME (default: selected-frame) by INCREMENT.
INCREMENT is in columns (characters).
Interactively, it is given by the prefix argument.</span>"
  (interactive "<span class="quote">p</span>")
  (set-frame-width frame (+ (frame-width frame) increment)))

<span class="linecomment">;;;###autoload</span>
(defun shrink-frame (&optional increment frame)
  "<span class="quote">Decrease the height of FRAME (default: selected-frame) by INCREMENT.
INCREMENT is in lines (characters).
Interactively, it is given by the prefix argument.</span>"
  (interactive "<span class="quote">p</span>")
  (set-frame-height frame (- (frame-height frame) increment)))

<span class="linecomment">;;;###autoload</span>
(defun shrink-frame-horizontally (&optional increment frame)
  "<span class="quote">Decrease the width of FRAME (default: selected-frame) by INCREMENT.
INCREMENT is in columns (characters).
Interactively, it is given by the prefix argument.</span>"
  (interactive "<span class="quote">p</span>")
  (set-frame-width frame (- (frame-width frame) increment)))

<span class="linecomment">;;;###autoload</span>
(defun move-frame-down (&optional increment frame)
  "<span class="quote">Move FRAME (default: selected-frame) down by INCREMENT.
INCREMENT is in units of ten pixels.
Interactively, it is given by the prefix argument.</span>"
  (interactive "<span class="quote">P</span>")
  (setq increment (if increment (prefix-numeric-value increment) 10)) <span class="linecomment">; 1 is too small</span>
  (modify-frame-parameters frame
                           (list (list 'top '+ (new-frame-position frame 'top increment)))))

<span class="linecomment">;;;###autoload</span>
(defun move-frame-up (&optional increment frame)
  "<span class="quote">Move FRAME (default: selected-frame) up by INCREMENT.
INCREMENT is in units of ten pixels.
Interactively, it is given by the prefix argument.</span>"
  (interactive "<span class="quote">P</span>")
  (setq increment (if increment (prefix-numeric-value increment) 10)) <span class="linecomment">; 1 is too small</span>
  (move-frame-down (- increment)))

<span class="linecomment">;;;###autoload</span>
(defun move-frame-right (&optional increment frame)
  "<span class="quote">Move FRAME (default: selected-frame) toward the right by INCREMENT.
INCREMENT is in units of ten pixels.
Interactively, it is given by the prefix argument.</span>"
  (interactive "<span class="quote">P</span>")
  (setq increment (if increment (prefix-numeric-value increment) 10)) <span class="linecomment">; 1 is too small</span>
  (modify-frame-parameters frame
                           (list (list 'left '+ (new-frame-position frame 'left increment)))))

<span class="linecomment">;;;###autoload</span>
(defun move-frame-left (&optional increment frame)
  "<span class="quote">Move FRAME (default: selected-frame) toward the left by INCREMENT.
INCREMENT is in units of ten pixels.
Interactively, it is given by the prefix argument.</span>"
  (interactive "<span class="quote">P</span>")
  (setq increment (if increment (prefix-numeric-value increment) 10)) <span class="linecomment">; 1 is too small</span>
  (move-frame-right (- increment)))

<span class="linecomment">;; Helper function.</span>
(defun new-frame-position (frame type incr)
  "<span class="quote">Return the new TYPE position of FRAME, incremented by INCR.
TYPE is `left' or `top'.
INCR is the increment to use when changing the position.</span>"
  (let ((new-pos
         (+ incr (cadr (frame-geom-value-cons type (cdr (assq type (frame-parameters frame)))))))
        (display-dimension
         (if (eq 'left type)
             (available-screen-pixel-width t)
           (available-screen-pixel-height t)))
        (frame-dimension
         (if (eq 'left type) (frame-pixel-width frame) (frame-pixel-height frame))))
    (if (not move-frame-wrap-within-display-flag)
        new-pos
      (when (&lt; new-pos (- frame-dimension)) (setq new-pos display-dimension))
      (when (&gt; new-pos display-dimension) (setq new-pos (- frame-dimension)))
      new-pos)))

<span class="linecomment">;;; This was a workaround hack for an Emacs 23 bug (#119, aka #1562).</span>
<span class="linecomment">;;; This works OK, but it is not as refined as the version I use, and it does not work for</span>
<span class="linecomment">;;; older Emacs versions.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; (when (&gt; emacs-major-version 22)</span>
<span class="linecomment">;;;   (defun enlarge-font (&optional increment frame)</span>
<span class="linecomment">;;;     "Increase size of font in FRAME by INCREMENT.</span>
<span class="linecomment">;;; Interactively, INCREMENT is given by the prefix argument.</span>
<span class="linecomment">;;; Optional FRAME parameter defaults to current frame."</span>
<span class="linecomment">;;;     (interactive "p")</span>
<span class="linecomment">;;;     (setq frame (or frame (selected-frame)))</span>
<span class="linecomment">;;;     (set-face-attribute</span>
<span class="linecomment">;;;      'default frame :height (+ (* 10 increment)</span>
<span class="linecomment">;;;                                (face-attribute 'default :height frame 'default)))))</span>


<span class="linecomment">;; This still doesn't work 100% well.  For instance, set frame font to</span>
<span class="linecomment">;; "-raster-Terminal-normal-r-normal-normal-12-90-96-96-c-50-ms-oemlatin", then decrease font size.</span>
<span class="linecomment">;; The next smaller existing font on my machine is</span>
<span class="linecomment">;; "-raster-Terminal-normal-r-normal-normal-11-*-96-96-c-*-ms-oemlatin".  Decrease size again.</span>
<span class="linecomment">;; Next smaller font is "-raster-Terminal-bold-r-normal-normal-5-37-96-96-c-60-ms-oemlatin".  Notice</span>
<span class="linecomment">;; the switch to bold from regular.  Cannot decrease any more.  Increase size.  Next larger font is</span>
<span class="linecomment">;; "-raster-Terminal-bold-r-normal-normal-8-*-96-96-c-*-ms-oemlatin".  Can no longer increase size.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defun enlarge-font (&optional increment frame)
  "<span class="quote">Increase size of font in FRAME by INCREMENT.
Interactively, INCREMENT is given by the prefix argument.
Optional FRAME parameter defaults to current frame.</span>"
  (interactive "<span class="quote">p</span>")
  (setq frame (or frame (selected-frame)))
  (let ((fontname (cdr (assq 'font (frame-parameters frame))))
        (count enlarge-font-tries))
    (setq fontname (enlarged-font-name fontname frame increment))
    (while (and (not (x-list-fonts fontname)) (wholenump (setq count (1- count))))
      (setq fontname (enlarged-font-name fontname frame increment)))
    (unless (x-list-fonts fontname) (error "<span class="quote">Cannot change font size</span>"))
    (modify-frame-parameters frame (list (cons 'font fontname)))
    <span class="linecomment">;; Update faces that want a bold or italic version of the default font.</span>
    (when (&lt; emacs-major-version 21) (frame-update-faces frame))))

(defun enlarged-font-name (fontname frame increment)
  "<span class="quote">FONTNAME, after enlarging font size of FRAME by INCREMENT.
FONTNAME is the font of FRAME.</span>"
  (when (query-fontset fontname)
    (let ((ascii (assq 'ascii (aref (fontset-info fontname frame) 2))))
      (when ascii (setq fontname (nth 2 ascii)))))
  (let ((xlfd-fields (x-decompose-font-name fontname)))
    (unless xlfd-fields (error "<span class="quote">Cannot decompose font name</span>"))
    (let ((new-size (+ (string-to-number (aref xlfd-fields xlfd-regexp-pixelsize-subnum))
                       increment)))
      (unless (&gt; new-size 0) (error "<span class="quote">New font size is too small: %s</span>" new-size))
      (aset xlfd-fields xlfd-regexp-pixelsize-subnum (number-to-string new-size)))
    <span class="linecomment">;; Set point size & width to "*", so frame width will adjust to new font size</span>
    (aset xlfd-fields xlfd-regexp-pointsize-subnum "<span class="quote">*</span>")
    (aset xlfd-fields xlfd-regexp-avgwidth-subnum "<span class="quote">*</span>")
    (x-compose-font-name xlfd-fields)))

<span class="linecomment">;;;###autoload</span>
(defun set-frame-alist-parameter-from-frame (alist parameter &optional frame)
  "<span class="quote">Set PARAMETER of frame alist ALIST to its current value in FRAME.
FRAME defaults to the selected frame.  ALIST is a variable (symbol)
whose value is an alist of frame parameters.</span>"
  (interactive
   (let ((symb (or (and (fboundp 'symbol-nearest-point)(symbol-nearest-point))
                   (and (symbolp (variable-at-point)))))
         (enable-recursive-minibuffers t))
     (list (intern (completing-read "<span class="quote">Frame alist to change (variable): </span>"
                                    (frame-alist-var-names) nil t nil nil 'default-frame-alist t))
           (intern (completing-read "<span class="quote">Parameter to set:</span>"
                                    (frame-parameter-names) nil t nil nil 'left t))
           (get-a-frame (read-frame "<span class="quote">Frame to copy parameter value from: </span>" nil t)))))
  (unless (boundp alist)
    (error "<span class="quote">Not a defined Emacs variable: `%s'</span>" alist))
  (set alist (assq-delete-all parameter (copy-alist (eval alist))))
  (set alist (cons (assq parameter (frame-parameters frame)) (eval alist)))
  (tell-customize-var-has-changed alist))

<span class="linecomment">;;; Standard Emacs 21+ function, defined here for Emacs 20.</span>
(unless (fboundp 'assq-delete-all)
  (defun assq-delete-all (key alist)
    "<span class="quote">Delete from ALIST all elements whose car is `eq' to KEY.
Return the modified alist.
Elements of ALIST that are not conses are ignored.</span>"
    (while (and (consp (car alist)) (eq (car (car alist)) key)) (setq alist (cdr alist)))
    (let ((tail alist) tail-cdr)
      (while (setq tail-cdr (cdr tail))
        (if (and (consp (car tail-cdr)) (eq (car (car tail-cdr)) key))
            (setcdr tail (cdr tail-cdr))
          (setq tail tail-cdr))))
    alist))

<span class="linecomment">;; Define this to avoid requiring `cl.el' at runtime.  Same as `icicle-set-difference'.</span>
(defun frame-cmds-set-difference (list1 list2 &optional key)
  "<span class="quote">Combine LIST1 and LIST2 using a set-difference operation.
Optional arg KEY is a function used to extract the part of each list
item to compare.

The result list contains all items that appear in LIST1 but not LIST2.
This is non-destructive; it makes a copy of the data if necessary, to
avoid corrupting the original LIST1 and LIST2.</span>"
  (if (or (null list1) (null list2)) list1
    (let ((keyed-list2  (and key  (mapcar key list2)))
          (result       ()))
      (while list1
        (unless (if key
                    (member (funcall key (car list1)) keyed-list2)
                  (member (car list1) list2))
          (setq result  (cons (car list1) result)))
        (setq list1  (cdr list1)))
      result)))

<span class="linecomment">;;;###autoload</span>
(defun set-all-frame-alist-parameters-from-frame (alist &optional frame really-all-p)
  "<span class="quote">Set frame parameters of ALIST to their current values in FRAME.
Unless optional argument REALLY-ALL-P (prefix arg) is non-nil, the
frame parameters in list `frame-parameters-to-exclude' are
excluded: they are not copied from FRAME to ALIST.
ALIST is a variable (symbol) whose value is an alist of frame parameters.
FRAME defaults to the selected frame.</span>"
  (interactive
   (let ((symb (or (and (fboundp 'symbol-nearest-point)(symbol-nearest-point))
                   (and (symbolp (variable-at-point)))))
         (enable-recursive-minibuffers t))
     (list (intern (completing-read "<span class="quote">Frame alist to change (variable): </span>"
                                    (frame-alist-var-names) nil t nil nil 'default-frame-alist t))
           (get-a-frame (read-frame "<span class="quote">Frame to copy parameter values from: </span>" nil t))
           current-prefix-arg)))
  (unless (boundp alist)
    (error "<span class="quote">Not a defined Emacs variable: `%s'</span>" alist))
  (set alist (frame-cmds-set-difference (frame-parameters frame)
                                        (and (not really-all-p) frame-parameters-to-exclude)
                                        #'car))
  (tell-customize-var-has-changed alist))

(defun frame-alist-var-names ()
  "<span class="quote">Return an alist of all variable names that end in \"frame-alist\".
The CAR of each list item is a string variable name.
The CDR is nil.</span>"
  (let ((vars nil))
    (mapatoms (lambda (sym) (and (boundp sym)
                                 (setq sym (symbol-name sym))
                                 (string-match "<span class="quote">frame-alist$</span>" sym)
                                 (push (list sym) vars))))
    vars))

(defun frame-parameter-names ()
  "<span class="quote">Return an alist of all available frame-parameter names.
The CAR of each list item is a string parameter name.
The CDR is nil.</span>"
  (let ((params '(("<span class="quote">display</span>") ("<span class="quote">title</span>") ("<span class="quote">name</span>") ("<span class="quote">left</span>") ("<span class="quote">top</span>") ("<span class="quote">icon-left</span>") ("<span class="quote">icon-top</span>")
                  ("<span class="quote">user-position</span>") ("<span class="quote">height</span>") ("<span class="quote">width</span>") ("<span class="quote">window-id</span>") ("<span class="quote">minibuffer</span>")
                  ("<span class="quote">buffer-predicate</span>") ("<span class="quote">buffer-list</span>") ("<span class="quote">font</span>") ("<span class="quote">auto-raise</span>") ("<span class="quote">auto-lower</span>")
                  ("<span class="quote">vertical-scroll-bars</span>") ("<span class="quote">horizontal-scroll-bars</span>") ("<span class="quote">scroll-bar-width</span>")
                  ("<span class="quote">icon-type</span>") ("<span class="quote">icon-name</span>") ("<span class="quote">foreground-color</span>") ("<span class="quote">background-color</span>")
                  ("<span class="quote">background-mode</span>") ("<span class="quote">mouse-color</span>") ("<span class="quote">cursor-color</span>") ("<span class="quote">border-color</span>")
                  ("<span class="quote">display-type</span>") ("<span class="quote">cursor-type</span>") ("<span class="quote">border-width</span>") ("<span class="quote">internal-border-width</span>")
                  ("<span class="quote">unsplittable</span>") ("<span class="quote">visibility</span>") ("<span class="quote">menu-bar-lines</span>"))))
    (when (&gt; emacs-major-version 20)
      (setq params (nconc params '("<span class="quote">fullscreen</span>" "<span class="quote">outer-window-id</span>" "<span class="quote">tty-color-mode</span>" "<span class="quote">left-fringe</span>"
                                   "<span class="quote">right-fringe</span>" "<span class="quote">tool-bar-lines</span>" "<span class="quote">screen-gamma</span>" "<span class="quote">line-spacing</span>"
                                   "<span class="quote">wait-for-wm</span>" "<span class="quote">scroll-bar-foreground</span>" "<span class="quote">scroll-bar-background</span>"))))
    (when (&gt; emacs-major-version 21) (setq params (nconc params '("<span class="quote">user-size</span>"))))
    (when (&gt; emacs-major-version 22)
      (setq params (nconc params '("<span class="quote">display-environment-variable</span>" "<span class="quote">term-environment-variable</span>"))))
    params))

<span class="linecomment">;;;###autoload</span>
(defun tell-customize-var-has-changed (variable)
  "<span class="quote">Tell Customize to recognize that VARIABLE has been set (changed).
VARIABLE is a symbol that names a user option.</span>"
  (interactive "<span class="quote">vVariable: </span>")
  (put variable 'customized-value (list (custom-quote (eval variable)))))

<span class="linecomment">;;;###autoload</span>
(defun other-window-or-frame (arg)
  "<span class="quote">`other-frame', if `one-window-p'; otherwise, `other-window'.</span>"
  (interactive "<span class="quote">p</span>")
  (if (one-window-p) (other-frame arg) (other-window arg)))

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;</span>

(provide 'frame-cmds)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; frame-cmds.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=frame-cmds.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="comment local" href="http://www.emacswiki.org/emacs/Comments_on_frame-cmds.el">Talk</a> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=frame-cmds.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=frame-cmds.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=frame-cmds.el">Administration</a></span><!-- test --><span class="time"><br /> Last edited 2012-08-23 18:43 UTC by <a class="author" title="from inet-hqmc03-o.oracle.com" href="http://www.emacswiki.org/emacs/DrewAdams">DrewAdams</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=frame-cmds.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
