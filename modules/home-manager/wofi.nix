{ lib, pkgs, ... }:
{
  programs.wofi = {
    enable = true;
    settings = {
      width="480";
      height="520";
      location="center";
      show="drun";
      prompt="  Search...";
      filter_rate=100;
      allow_markup=true;
      no_actions=true;
      halign="fill";
      orientation="vertical";
      content_halign="fill";
      insensitive=true;
      allow_images=true;
      image_size=28;
      columns=1;
      term="kitty";
      hide_scroll=true;
    };
    style = ''
window {
    background-color: rgba(0, 0, 0, 0.95);
    border: 1px solid rgba(0, 255, 183, 0.614);
    border-radius: 14px;
}

/* ── Search bar ─────────────────────────────────────────────── */
#input {
    background-color: transparent;
    border: none;
    border-radius: 10px;
    color: #f0dfc0;
    padding: 8px 14px;
    margin-bottom: 10px;
    font-size: 14px;
}

#input:focus {
    background-color: rgba(22, 22, 22, 0.6);
}


/* ── Scrollbar ──────────────────────────────────────────────── */
#scroll {
    border: none;
    margin: 0;
}

/* ── Inner box ──────────────────────────────────────────────── */
#inner-box {
    background: transparent;
}

/* ── Each entry ─────────────────────────────────────────────── */
#entry {
    background-color: transparent;
    padding: 7px 12px;
    margin: 2px 0;
    border: 1px solid transparent;
    color: #dadada;
}

#entry:hover {
    background-color: rgba(74, 127, 165, 0.18);
    color: #f0dfc0;
}

#entry:selected {
    background-color: rgba(74, 165, 147, 0.28);
    border: 1px solid rgba(0, 255, 183, 0.614);
    color: #f0dfc0;
}


/* ── App icon ───────────────────────────────────────────────── */
#entry image {
    margin-right: 10px;
    height: 10px;
    width: 10px;
}

/* ── App name text ──────────────────────────────────────────── */
#entry label {
    color: #c5d9c0;
    font-size: 13px;
}

#entry:selected label {
    color: #f0dfc0;
    font-weight: 500;
}

#entry:hover label {
    color: #f0dfc0;
}

/* ── No results text ────────────────────────────────────────── */
#text:selected {
    color: #e8c97a;
}

    '';
  };
}