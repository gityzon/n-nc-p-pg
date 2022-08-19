{ pkgs }: {
    deps = [
      pkgs.bashInteractive
      pkgs.unzip
      pkgs.sqlite
      pkgs.php74
      pkgs.php74Extensions.ffi
      pkgs.php74Extensions.zip
      pkgs.php74Extensions.dom
      pkgs.php74Extensions.xmlwriter
      pkgs.php74Extensions.mbstring
      pkgs.php74Extensions.ctype
      pkgs.php74Extensions.json
      pkgs.php74Extensions.gd
      pkgs.php74Extensions.iconv
      pkgs.php74Extensions.simplexml
      pkgs.php74Extensions.curl
      pkgs.php74Extensions.pdo
    ];
}