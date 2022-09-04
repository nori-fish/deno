function _deno_install --on-event deno_install --on-event deno_update
    if command --query deno
        command deno upgrade
    else
        echo "Downloading deno binary..."
        curl -fsSL https://deno.land/install.sh | sh
    end

    set --query DENO_INSTALL
    or set --universal --export DENO_INSTALL $HOME/.deno
    _nori_add_path $DENO_INSTALL/bin
end

function _deno_uninstall --on-event deno_uninstall
    if set --query DENO_INSTALL
        rm -rf $DENO_INSTALL
        set --universal --erase DENO_INSTALL
    end
    _nori_remove_path $DENO_INSTALL/bin
end
