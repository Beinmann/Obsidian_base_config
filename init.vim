unmap <Space>


""""""""" jumping backwards and forwards """""""""
exmap goBack obcommand app:go-back
exmap goForward obcommand app:go-forward
nnoremap <C-o> :goBack<CR>
nnoremap <C-i> :goForward<CR>

" All these remaps with <Space> are because unfortunately I don't think it's
" possible to remap the leader key in obsidian vim

" Open current file in default program (want to use this to open files in nvim quickly from obsidian)
exmap openFile obcommand open-with-default-app:open
nmap <Space>opn :openFile<CR>

" x doesn't yank text anymore
nnoremap x "_x


" remap the § symbol so it can start macros
nmap § @











"""""""""""""" Things I like """"""""""""""
" nmap j gj
" nmap k gk

" vmap j gj
" vmap k gk

" H and L for going to the visual start/end of lines
nmap H g0
nmap L g$


set clipboard=unnamedplus

" no highlight search
noh


" jk in insert mode exits and goes to command mode
inoremap jk <Esc>

" Follow links using gd
exmap followLink obcommand editor:follow-link
nnoremap gd :followLink<CR>







"""""""""""""""""""" TODO things I could still use """"""""""""""""""""
" :pHead and :nHead - Functions from the Improved Vim Cursor Plugin for
" jumping between headings


""""""""" Open Context Menu (like right click) """""""""
" exmap contextMenu obcommand editor:context-menu
" nnomap <Space>cm :contextMenu




""""""""" Window Controls (currently not working because of """""""""
" default Ctrl W behavior)
" source: https://bauer.codes/notes/Obsidian#Obsidian+vim+window+controls)
" window controls
" exmap wq obcommand workspace:close
" exmap q obcommand workspace:close

" exmap focusRight obcommand editor:focus-right
" nmap <C-w>l :focusRight

" exmap focusLeft obcommand editor:focus-left
" nmap <C-w>h :focusLeft

" exmap focusTop obcommand editor:focus-top
" nmap <C-w>k :focusTop

" exmap focusBottom obcommand editor:focus-bottom
" nmap <C-w>j :focusBottom

" exmap splitVertical obcommand workspace:split-vertical
" nmap <C-w>v :splitVertical

" exmap splitHorizontal obcommand workspace:split-horizontal
" nmap <C-w>s :splitHorizontal


""""""""" Swapping lines around or single letters with the arrow keys """""""""
" INFO doesn't work in visual mode
" exmap lineUp obcommand editor:swap-line-up
" exmap lineDown obcommand editor:swap-line-down
" nnoremap <Up> :lineUp
" nnoremap <Down> :lineDown
" nnoremap <Right> dlp
" nnoremap <Left> dlhhp



" [g]oto [s]ymbol via "Another Quick Switcher" Plugin
" exmap gotoHeading obcommand obsidian-another-quick-switcher:header-floating-search-in-file
" nnoremap gs :gotoHeading

""""""""" File recovery """""""""
" exmap fileRecovery obcommand file-recovery:open
" nnoremap ,ut :fileRecovery



""""""""" More! """""""""
" https://github.com/chrisgrieser/.config/blob/41a9e915ec0b299084cf58f4265fb2f3a39e4643/obsidian/obsidian-vimrc.vim


















""""""""" Info about how to use common vim commands in obsidian (like folding and some more) """""""""
" https://vimhelp.org/fold.txt.html#fold-commands









""""""""" Commands from the vim extension plugin (forgot the name) """""""""

" These are the funcionality that obsidian provides + the functionality of the
" different plugins

" This is not guaranteed to work in future obsidian versions as the
" implementation is kind of hacky

" You can get this list by calling :obcommand from the vim normal mode and
" then going into the console of the developer console (Ctrl + Shift + I) to
" get the output of that command (though I had to try a number of times to get
" the right output and I'm not sure what got me the right output in the end
" maybe it was because I used :obcommand -h but it could have been pure luck
" as well)

" Anyways these are all the comands and you can use them either from the vim
" console by calling
"
" :obcommand [command_name] or by remapping these commands
" in vim by calling for example
"
" exmap followLink obcommand editor:follow-link
" nnoremap <C-m> :followLink
" which will remap Ctrl + M to the editor:follow-link command
"
" I think this can be done in one command if you use:
" nnoremap <C-m> :obcommand editor:follow-link
" but I am not sure about that
"
" I just found some more info about this (from: https://github.com/esm7/obsidian-vimrc-support#some-help-with-binding-space-chords-doom-and-spacemacs-fans)
" The trivial answer should have been something along the line of :nmap <C-o> :obcommand app:go-back, but this does not work because of an annoying CodeMirror bug

" Available commands: editor:save-file
" editor:follow-link
" editor:open-link-in-new-leaf
" editor:open-link-in-new-split
" editor:open-link-in-new-window
" editor:focus-top
" editor:focus-bottom
" editor:focus-left
" editor:focus-right
" workspace:toggle-pin
" workspace:split-vertical
" workspace:split-horizontal
" workspace:toggle-stacked-tabs
" workspace:edit-file-title
" workspace:copy-path
" workspace:copy-url
" workspace:undo-close-pane
" workspace:export-pdf
" editor:rename-heading
" workspace:open-in-new-window
" workspace:move-to-new-window
" workspace:next-tab
" workspace:goto-tab-1
" workspace:goto-tab-2
" workspace:goto-tab-3
" workspace:goto-tab-4
" workspace:goto-tab-5
" workspace:goto-tab-6
" workspace:goto-tab-7
" workspace:goto-tab-8
" workspace:goto-last-tab
" workspace:previous-tab
" workspace:new-tab
" obsidian-excalidraw-plugin:excalidraw-disable-autosave
" obsidian-excalidraw-plugin:excalidraw-enable-autosave
" obsidian-excalidraw-plugin:excalidraw-download-lib
" obsidian-excalidraw-plugin:excalidraw-open
" obsidian-excalidraw-plugin:excalidraw-open-on-current
" obsidian-excalidraw-plugin:excalidraw-insert-transclusion
" obsidian-excalidraw-plugin:excalidraw-insert-last-active-transclusion
" obsidian-excalidraw-plugin:excalidraw-autocreate
" obsidian-excalidraw-plugin:excalidraw-autocreate-newtab
" obsidian-excalidraw-plugin:excalidraw-autocreate-on-current
" obsidian-excalidraw-plugin:excalidraw-autocreate-popout
" obsidian-excalidraw-plugin:excalidraw-autocreate-and-embed
" obsidian-excalidraw-plugin:excalidraw-autocreate-and-embed-new-tab
" obsidian-excalidraw-plugin:excalidraw-autocreate-and-embed-on-current
" obsidian-excalidraw-plugin:excalidraw-autocreate-and-embed-popout
" obsidian-excalidraw-plugin:run-ocr
" obsidian-excalidraw-plugin:search-text
" obsidian-excalidraw-plugin:fullscreen
" obsidian-excalidraw-plugin:disable-binding
" obsidian-excalidraw-plugin:disable-framerendering
" obsidian-excalidraw-plugin:disable-frameclipping
" obsidian-excalidraw-plugin:export-image
" obsidian-excalidraw-plugin:save
" obsidian-excalidraw-plugin:toggle-lock
" obsidian-excalidraw-plugin:scriptengine-store
" obsidian-excalidraw-plugin:delete-file
" obsidian-excalidraw-plugin:insert-link
" obsidian-excalidraw-plugin:insert-command
" obsidian-excalidraw-plugin:insert-link-to-element
" obsidian-excalidraw-plugin:insert-link-to-element-group
" obsidian-excalidraw-plugin:insert-link-to-element-frame
" obsidian-excalidraw-plugin:insert-link-to-element-area
" obsidian-excalidraw-plugin:toggle-lefthanded-mode
" obsidian-excalidraw-plugin:reset-image-to-100
" obsidian-excalidraw-plugin:insert-image
" obsidian-excalidraw-plugin:import-svg
" obsidian-excalidraw-plugin:release-notes
" obsidian-excalidraw-plugin:tray-mode
" obsidian-excalidraw-plugin:insert-md
" obsidian-excalidraw-plugin:insert-pdf
" obsidian-excalidraw-plugin:universal-add-file
" obsidian-excalidraw-plugin:insert-LaTeX-symbol
" obsidian-excalidraw-plugin:toggle-excalidraw-view
" obsidian-excalidraw-plugin:convert-to-excalidraw
" obsidian-excalidraw-plugin:convert-excalidraw
" buttons:button-maker
" buttons:inline-button
" note-refactor-obsidian:app:extract-selection-first-line
" note-refactor-obsidian:app:extract-selection-content-only
" note-refactor-obsidian:app:extract-selection-autogenerate-name
" note-refactor-obsidian:app:split-note-first-line
" note-refactor-obsidian:app:split-note-content-only
" note-refactor-obsidian:app:split-note-by-heading-h1
" note-refactor-obsidian:app:split-note-by-heading-h2
" note-refactor-obsidian:app:split-note-by-heading-h3
" calendar:show-calendar-view
" calendar:open-weekly-note
" calendar:reveal-active-note
" dataview:dataview-force-refresh-views
" dataview:dataview-drop-cache
" templater-obsidian:insert-templater
" templater-obsidian:replace-in-file-templater
" templater-obsidian:jump-to-next-cursor-location
" templater-obsidian:create-new-note-from-template
" templater-obsidian:Templates/Random Thought Template.md
" quickadd:runQuickAdd
" quickadd:reloadQuickAdd
" quickadd:testQuickAdd
" quickadd:choice:f82d045f-6475-4f05-988e-fef7a9dbd115
" quickadd:choice:276cbc09-8ca3-4756-892b-1fd756ebe559
" make-md:mk-convert-folder-note
" make-md:mk-open-file-context
" make-md:mk-open-flow
" make-md:mk-close-flow
" obsidian-full-calendar:full-calendar-new-event
" obsidian-full-calendar:full-calendar-reset
" obsidian-full-calendar:full-calendar-revalidate
" obsidian-full-calendar:full-calendar-open
" obsidian-full-calendar:full-calendar-open-sidebar
" obsidian-global-hotkeys:bring-to-front
" obsidian-global-hotkeys:show-hide
" obsidian-kanban:create-new-kanban-board
" obsidian-kanban:archive-completed-cards
" obsidian-kanban:toggle-kanban-view
" obsidian-kanban:convert-to-kanban
" obsidian-kanban:add-kanban-lane
" obsidian-kanban:open-board-settings
" css-snippets:refresh-styles
" css-snippets:unload-styles
" execute-code:code-execute-open-manage-executors
" execute-code:run-all-code-blocks-in-file
" heycalmdown-navigate-cursor-history:cursor-position-backward
" heycalmdown-navigate-cursor-history:cursor-position-forward
" table-editor-obsidian:next-row
" table-editor-obsidian:next-cell
" table-editor-obsidian:previous-cell
" table-editor-obsidian:format-table
" table-editor-obsidian:format-all-tables
" table-editor-obsidian:insert-column
" table-editor-obsidian:insert-row
" table-editor-obsidian:escape-table
" table-editor-obsidian:left-align-column
" table-editor-obsidian:center-align-column
" table-editor-obsidian:right-align-column
" table-editor-obsidian:move-column-left
" table-editor-obsidian:move-column-right
" table-editor-obsidian:move-row-up
" table-editor-obsidian:move-row-down
" table-editor-obsidian:delete-column
" table-editor-obsidian:delete-row
" table-editor-obsidian:sort-rows-ascending
" table-editor-obsidian:sort-rows-descending
" table-editor-obsidian:evaluate-formulas
" table-editor-obsidian:table-control-bar
" app:go-back
" app:go-forward
" app:open-vault
" theme:use-dark
" theme:use-light
" theme:switch
" app:open-settings
" app:show-release-notes
" markdown:toggle-preview
" markdown:add-metadata-property
" markdown:edit-metadata-property
" markdown:clear-metadata-properties
" workspace:close
" workspace:close-window
" workspace:close-others
" workspace:close-tab-group
" workspace:close-others-tab-group
" app:delete-file
" app:toggle-left-sidebar
" app:toggle-right-sidebar
" app:toggle-default-new-pane-mode
" app:open-help
" app:reload
" app:show-debug-info
" app:open-sandbox-vault
" window:toggle-always-on-top
" window:zoom-in
" window:zoom-out
" window:reset-zoom
" file-explorer:new-file
" file-explorer:new-file-in-current-tab
" file-explorer:new-file-in-new-pane
" open-with-default-app:open
" file-explorer:move-file
" file-explorer:duplicate-file
" open-with-default-app:show
" editor:open-search
" editor:open-search-replace
" editor:focus
" editor:toggle-fold-properties
" editor:toggle-fold
" editor:fold-all
" editor:unfold-all
" editor:fold-less
" editor:fold-more
" editor:insert-wikilink
" editor:insert-embed
" editor:insert-link
" editor:insert-tag
" editor:set-heading
" editor:set-heading-0
" editor:set-heading-1
" editor:set-heading-2
" editor:set-heading-3
" editor:set-heading-4
" editor:set-heading-5
" editor:set-heading-6
" editor:toggle-bold
" editor:toggle-italics
" editor:toggle-strikethrough
" editor:toggle-highlight
" editor:toggle-code
" editor:toggle-inline-math
" editor:toggle-blockquote
" editor:toggle-comments
" editor:toggle-bullet-list
" editor:toggle-numbered-list
" editor:toggle-checklist-status
" editor:cycle-list-checklist
" editor:insert-callout
" editor:insert-codeblock
" editor:insert-mathblock
" editor:swap-line-up
" editor:swap-line-down
" editor:attach-file
" editor:delete-paragraph
" editor:toggle-spellcheck
" editor:context-menu
" file-explorer:open
" file-explorer:reveal-active-file
" global-search:open
" switcher:open
" graph:open
" graph:open-local
" graph:animate
" backlink:open
" backlink:open-backlinks
" backlink:toggle-backlinks-in-document
" canvas:new-file
" canvas:export-as-image
" canvas:jump-to-group
" canvas:convert-to-file
" outgoing-links:open
" outgoing-links:open-for-current
" tag-pane:open
" properties:open
" properties:open-local
" daily-notes
" daily-notes:goto-prev
" daily-notes:goto-next
" insert-template
" insert-current-date
" insert-current-time
" note-composer:merge-file
" note-composer:split-file
" note-composer:extract-heading
" command-palette:open
" bookmarks:open
" bookmarks:bookmark-current-view
" bookmarks:bookmark-current-search
" bookmarks:unbookmark-current-view
" bookmarks:bookmark-current-section
" bookmarks:bookmark-current-heading
" bookmarks:bookmark-all-tabs
" zk-prefixer
" random-note
" outline:open
" outline:open-for-current
" slides:start
" audio-recorder:start
" audio-recorder:stop
" workspaces:load
" workspaces:save-and-load
" workspaces:open-modal
" file-recovery:open
" editor:toggle-source
" obsidian-admonition:collapse-admonitions
" obsidian-admonition:open-admonitions
" obsidian-admonition:insert-admonition
" obsidian-admonition:insert-callout
" breadcrumbs:show-BC-matrix-view
" breadcrumbs:show-BC-ducks-view
" breadcrumbs:show-BC-tree-view
" breadcrumbs:open-vis-modal
" breadcrumbs:manipulate-hierarchy-notes
" breadcrumbs:Refresh-Breadcrumbs-Index
" breadcrumbs:Toggle-trail-in-Edit&LP
" breadcrumbs:Write-Breadcrumbs-to-Current-File
" breadcrumbs:Write-Breadcrumbs-to-All-Files
" breadcrumbs:local-index
" breadcrumbs:global-index
" breadcrumbs:jump-to-first-up
" breadcrumbs:jump-to-first-down
" breadcrumbs:jump-to-first-next
" breadcrumbs:jump-to-first-prev
" breadcrumbs:new-file-with-curr-as-up
" breadcrumbs:new-file-with-curr-as-same
" breadcrumbs:new-file-with-curr-as-down
" breadcrumbs:new-file-with-curr-as-next
" breadcrumbs:new-file-with-curr-as-prev
