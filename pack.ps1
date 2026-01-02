# This script packages the Minecraft datapack into a zip file
# for local testing and development.

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

$packMeta = Join-Path $scriptDir "pack.mcmeta"
$dataDir  = Join-Path $scriptDir "data"
$zipPath  = Join-Path $scriptDir "zombie-leather.zip"

if (-not (Test-Path $packMeta)) {
    throw "pack.mcmeta not found in script directory."
}

if (-not (Test-Path $dataDir)) {
    throw "data folder not found in script directory."
}

if (Test-Path $zipPath) {
    Remove-Item $zipPath -Force
}

Compress-Archive `
    -Path $packMeta, $dataDir `
    -DestinationPath $zipPath `
    -CompressionLevel Optimal
