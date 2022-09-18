function _deno_install --on-event deno_install --on-event deno_update
    if command --query deno
        command deno upgrade
    else
        echo "Downloading deno binary..."
        curl -fsSL https://deno.land/install.sh | sh
    end

    set --query DENO_INSTALL
    or set --universal --export DENO_INSTALL $HOME/.deno
    fish_add_path --prepend $DENO_INSTALL/bin
end

function _deno_uninstall --on-event deno_uninstall
    if set --query DENO_INSTALL
        rm -rf $DENO_INSTALL
        set --universal --erase DENO_INSTALL
    end

    if set --local index (contains --index $DENO_INSTALL/bin $fish_user_paths)
        set --universal --erase fish_user_paths[$index]
    end
end
