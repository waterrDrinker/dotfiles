# ── system ─────────────────────────────
system=(
  git
  base-devel
  man-db
  man-pages
  xdg-utils
  gvfs
  darkman
  wl-clipboard
)

# ── shell / cli ────────────────────────
cli=(
  neovim
  htop
  tree
  fzf
  zsh
  fastfetch
  openbsd-netcat
)

# ── terminal ───────────────────────────
terminal=(
  kitty
)

# ── audio ──────────────────────────────
audio=(
  pipewire
  pipewire-alsa
  pipewire-pulse
  wireplumber
)

# ── fonts ──────────────────────────────
fonts=(
)

# ── apps ───────────────────────────────
apps=(
  firefox
  qbittorrent
  libreoffice
  mpv
  calibre
  loupe
  bitwarden
)

# ── file management ────────────────────
files=(
  nautilus
)

# ── dev ────────────────────────────────
dev=(
  nodejs
  postgresql
  ffmpeg
  iperf3
  perl-image-exiftool
  rust
)

# ── misc ───────────────────────────────
misc=(
  xdg-user-dirs
  xdg-desktop-portal
)

# ── merge all arrays ───────────────────
main_packages=(
  "${system[@]}"
  "${cli[@]}"
  "${terminal[@]}"
  "${audio[@]}"
  "${fonts[@]}"
  "${apps[@]}"
  "${files[@]}"
  "${dev[@]}"
  "${misc[@]}"
)
