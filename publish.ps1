#Requires -Version 5.1
$ErrorActionPreference = "Stop"
$repoUrl = "https://github.com/Akbaras14/Skill-hack-skripsi.git"
$checkout = Join-Path $env:TEMP ("Skill-hack-skripsi-publish-" + [guid]::NewGuid().ToString("N"))
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$skillRelative = ".agents/skills/hack-penulisan-akademik"
$docsRelative = "docs/hack-penulisan-akademik"

# Validates that the Git executable is available; fails explicitly otherwise.
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    throw "Git tidak tersedia. Instal Git dan masuk ke akun GitHub yang memiliki izin push."
}

# Clones to a temporary folder, avoiding accidental edits to an existing working tree.
git clone --depth 1 --branch main $repoUrl $checkout
if ($LASTEXITCODE -ne 0) { throw "Clone gagal. Periksa koneksi internet dan URL." }

$skillTarget = Join-Path $checkout $skillRelative
$docsTarget = Join-Path $checkout $docsRelative
if ((Test-Path $skillTarget) -or (Test-Path $docsTarget)) {
    throw "Target sudah ada pada repositori. Hentikan untuk menghindari overwrite; periksa versi yang ada."
}

# Copies the complete skill including references and assets.
$skillParent = Split-Path -Parent $skillTarget
$docsParent = Split-Path -Parent $docsTarget
New-Item -ItemType Directory -Path $skillParent -Force | Out-Null
New-Item -ItemType Directory -Path $docsParent -Force | Out-Null
Copy-Item (Join-Path $root $skillRelative) $skillTarget -Recurse
Copy-Item (Join-Path $root $docsRelative) $docsTarget -Recurse

# Adds a discoverable link without removing the repository's current README.
$readme = Join-Path $checkout "README.md"
$header = @"
> **Skill baru:** [Hack Penulisan Akademik (120 aturan)](docs/hack-penulisan-akademik/README.md)
> Instal: ``npx skills add Akbaras14/Skill-hack-skripsi --skill hack-penulisan-akademik``

"@
if ((Test-Path $readme) -and -not (Select-String -Path $readme -SimpleMatch "docs/hack-penulisan-akademik/README.md" -Quiet)) {
    $original = [System.IO.File]::ReadAllText($readme)
    [System.IO.File]::WriteAllText($readme, $header + $original, [System.Text.UTF8Encoding]::new($false))
}

# Commits and pushes only the skill, documentation, and discoverability link.
Push-Location $checkout
try {
    git add -- $skillRelative $docsRelative README.md
    if ($LASTEXITCODE -ne 0) { throw "git add gagal." }
    git commit -m "feat: publish academic writing agent skill (120 rules)"
    if ($LASTEXITCODE -ne 0) { throw "Commit gagal; pastikan git user.name dan user.email sudah diatur." }
    git push origin main
    if ($LASTEXITCODE -ne 0) { throw "Push ditolak. Periksa autentikasi, hak akses, atau branch protection." }
    Write-Host "Berhasil: https://github.com/Akbaras14/Skill-hack-skripsi/tree/main/.agents/skills/hack-penulisan-akademik"
}
finally { Pop-Location }
