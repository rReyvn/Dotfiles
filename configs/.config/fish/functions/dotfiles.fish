function dotfiles --description 'Edit Dotfiles'
    cd $DOTFILES_DIR
    nvim +":lua require('telescope.builtin').find_files({ prompt_title = 'Configure Dotfiles', hidden = true })"
end
