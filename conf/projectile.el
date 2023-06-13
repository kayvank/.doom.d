;;; conf/projectile.el -*- lexical-binding: t; -*-
        (setq
         projectile-indexing-method "alien"
        projectile-globally-ignored-directories '(
        "backup"
        "dist"
        "dist-newstyle"
        "result"
        ".marconidb"
        ".db"
        ".direnv"
        ".direnv-disable"
        ".psci_modules"
        ".spago"
        ".purs-repl"
        "bower_components"
        "node_modules"
        ))

