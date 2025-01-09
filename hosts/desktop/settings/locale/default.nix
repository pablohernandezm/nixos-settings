{ pkgs, ... }:
let
  lang_base = "en_US.UTF-8";
  lang_preferred = "es_CO.UTF-8";
in
{
  home.keyboard = {
    layout = "us";
    variant = "altgr-intl";
  };

  home.language = {
    base = "${lang_base}";
    name = "${lang_preferred}";
    address = "${lang_preferred}";
    measurement = "${lang_preferred}";
    monetary = "${lang_preferred}";
    numeric = "${lang_preferred}";
    paper = "${lang_preferred}";
    telephone = "${lang_preferred}";
    time = "${lang_preferred}";
  };
}
