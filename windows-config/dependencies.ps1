# ============================================================
# Setup script: MSYS2 + Rust + tree-sitter + nvim
# Ejecutar como administrador
# ============================================================

# ── MSYS2 ───────────────────────────────────────────────────
Write-Host "Instalando MSYS2..."
$msys2Installer = "$env:TEMP\msys2-installer.exe"
Invoke-WebRequest -Uri "https://github.com/msys2/msys2-installer/releases/download/nightly-x86_64/msys2-x86_64-latest.exe" -OutFile $msys2Installer
Start-Process -FilePath $msys2Installer -ArgumentList "install --root C:\msys64 --confirm-command" -Wait

# ── Paquetes pacman ──────────────────────────────────────────
Write-Host "Instalando paquetes MSYS2..."
$pacman = "C:\msys64\usr\bin\bash.exe"
$packages = "mingw-w64-ucrt-x86_64-gcc mingw-w64-ucrt-x86_64-clang mingw-w64-ucrt-x86_64-curl mingw-w64-ucrt-x86_64-libarchive mingw-w64-ucrt-x86_64-cmake mingw-w64-ucrt-x86_64-make"
Start-Process -FilePath $pacman -ArgumentList "-lc `"pacman -S --noconfirm $packages`"" -Wait

# ── PATH ─────────────────────────────────────────────────────
$ucrtBin = "C:\msys64\ucrt64\bin"
$currentPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($currentPath -notlike "*$ucrtBin*") {
    [Environment]::SetEnvironmentVariable("Path", "$currentPath;$ucrtBin", "User")
    Write-Host "PATH actualizado con MSYS2"
}
# Actualizar PATH en la sesion actual tambien
$env:Path += ";$ucrtBin"

# -- Instlar NodeJS y OpenJS
Write-Host "Instalando NodeJS..."
winget install OpenJS.NodeJS
# ── Rust ─────────────────────────────────────────────────────
Write-Host "Instalando Rust..."
$rustupInstaller = "$env:TEMP\rustup-init.exe"
Invoke-WebRequest -Uri "https://win.rustup.rs/x86_64" -OutFile $rustupInstaller
Start-Process -FilePath $rustupInstaller -ArgumentList "-y --default-toolchain stable-x86_64-pc-windows-gnu" -Wait
$env:Path += ";$env:USERPROFILE\.cargo\bin"

# ── tree-sitter-cli ──────────────────────────────────────────
Write-Host "Instalando tree-sitter-cli..."
$env:LIBCLANG_PATH = "C:/msys64/ucrt64/bin"
$env:BINDGEN_EXTRA_CLANG_ARGS = "-IC:/msys64/ucrt64/include -IC:/msys64/ucrt64/include/c++/15.1.0 -IC:/msys64/ucrt64/include/c++/15.1.0/x86_64-w64-mingw32"
cargo install tree-sitter-cli

Write-Host ""
Write-Host "Todo listo. Abre una terminal nueva y verifica con:"
Write-Host "  gcc --version"
Write-Host "  cargo --version"
Write-Host "  tree-sitter --version"

# -- install neovim ──────────────────────────────────────────
winget install Neovim.Neovim
# ── Git (requerido para file.exe) ────────────────────────────
Write-Host "Instalando Git for Windows..."
winget install Git.Git --accept-package-agreements --accept-source-agreements

# Configurar YAZI_FILE_ONE
$gitFile = "C:\Program Files\Git\usr\bin\file.exe"
[Environment]::SetEnvironmentVariable("YAZI_FILE_ONE", $gitFile, "User")
$env:YAZI_FILE_ONE = $gitFile

# ── Yazi ────────────────────────────────────────────────────
Write-Host "Instalando Yazi..."
winget install sxyazi.yazi --accept-package-agreements --accept-source-agreements

# ── Dependencias opcionales (MUY recomendadas) ───────────────
Write-Host "Instalando dependencias opcionales para Yazi..."
winget install `
    Gyan.FFmpeg `
    7zip.7zip `
    jqlang.jq `
    oschwartz10612.Poppler `
    sharkdp.fd `
    BurntSushi.ripgrep.MSVC `
    junegunn.fzf `
    ajeetdsouza.zoxide `
    ImageMagick.ImageMagick `
    --accept-package-agreements --accept-source-agreements

# ── resvg (manual) ───────────────────────────────────────────
Write-Host "Instalando resvg..."

$resvgVersion = "0.47.0"
$resvgZip = "$env:TEMP\resvg.zip"
$resvgDir = "$env:USERPROFILE\resvg"

$resvgUrl = "https://github.com/linebender/resvg/releases/download/v$resvgVersion/resvg-win64.zip"

Invoke-WebRequest -Uri $resvgUrl -OutFile $resvgZip
Expand-Archive -Path $resvgZip -DestinationPath $resvgDir -Force

# Normalizar estructura (a veces viene en subcarpeta)
$resvgExe = Get-ChildItem -Path $resvgDir -Recurse -Filter "resvg.exe" | Select-Object -First 1

if ($resvgExe) {
    $finalDir = Split-Path $resvgExe.FullName
} else {
    Write-Host "Error: resvg.exe no encontrado"
    exit 1
}

# Agregar al PATH
$currentPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($currentPath -notlike "*$finalDir*") {
    [Environment]::SetEnvironmentVariable("Path", "$currentPath;$finalDir", "User")
    Write-Host "PATH actualizado con resvg"
}
$env:Path += ";$finalDir"
