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
$packages = "mingw-w64-ucrt-x86_64-gcc mingw-w64-ucrt-x86_64-clang mingw-w64-ucrt-x86_64-curl mingw-w64-ucrt-x86_64-libarchive"
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
