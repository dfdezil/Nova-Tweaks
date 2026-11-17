$ErrorActionPreference = 'SilentlyContinue'

$ESC = [char]27
$reset = "$ESC[0m"
$gray = "$ESC[38;2;130;130;130m"
$cyan = "$ESC[96m"
$green = "$ESC[92m"
$purple = "$ESC[38;2;192;132;252m"
$white = "$ESC[97m"

$appExes = @(
    'discord.exe', 'discordcanary.exe', 'discordptb.exe',
    'spotify.exe',
    'chrome.exe', 'brave.exe', 'firefox.exe', 'msedge.exe', 'opera.exe', 'opera_gx.exe', 'vivaldi.exe', 'arc.exe',
    'code.exe', 'devenv.exe',
    'antigravity.exe', 'cursor.exe',
    'nvcontainer.exe', 'nvidia share.exe', 'nvidia web helper.exe', 'nvidia app.exe', 'nvidia geforce experience.exe', 'nvcplui.exe',
    'steam.exe', 'steamwebhelper.exe', 'epicgameslauncher.exe', 'riotclientservices.exe', 'riot client.exe',
    'telegram.exe', 'whatsapp.exe', 'slack.exe', 'zoom.exe', 'skype.exe',
    'obsidian.exe', 'notion.exe', 'githubdesktop.exe', 'gitkraken.exe',
    'notepad++.exe', 'vlc.exe', 'itunes.exe', '7zfm.exe', 'winrar.exe'
)

$gameExes = @(
    'gta5.exe', 'playgtav.exe', 'gtavlauncher.exe', 'gta5_be.exe',
    'valorant.exe', 'valorant-win64-shipping.exe',
    'fc27.exe', 'fc27_trial.exe', 'fc27_showcase.exe', 'fc26.exe', 'fc25.exe', 'fc24.exe', 'fifa23.exe', 'fifa22.exe', 'fifa21.exe',
    'robloxplayerbeta.exe', 'robloxplayerlauncher.exe', 'robloxstudiobeta.exe',
    'cs2.exe', 'csgo.exe',
    'fortniteclient-win64-shipping.exe', 'fortnitelauncher.exe',
    'cod.exe', 'modernwarfare.exe', 'blackopscoldwar.exe', 'bootstrapper.exe',
    'r5apex.exe', 'minecraft.exe', 'javaw.exe', 'overwatch.exe', 'rocketleague.exe',
    'cyberpunk2077.exe', 'eldenring.exe', 'rdr2.exe', 'tslgame.exe',
    'rainbowsix.exe', 'rainbowsix_vulkan.exe', 'destiny2.exe',
    'genshinimpact.exe', 'starrail.exe', 'zzz.exe', 'witcher3.exe', 'dota2.exe', 'rustclient.exe',
    'deadbydaylight-win64-shipping.exe', 'discovery.exe', 'bloodstrike.exe',
    'goose goose duck.exe', 'mimic party.exe', 'penguinhotel.exe',
    'androidemulatoren.exe', 'androidemulator.exe', 'androidemulatorex.exe', 'aow_exe.exe', 'appmarket.exe',
    'league of legends.exe', 'leagueclient.exe'
)

$knownDisplayNames = @{
    'fc27.exe' = 'EA SPORTS FC 27'
    'fc26.exe' = 'EA SPORTS FC 26'
    'fc25.exe' = 'EA SPORTS FC 25'
    'fc24.exe' = 'EA SPORTS FC 24'
    'fifa23.exe' = 'FIFA 23'
    'gta5.exe' = 'Grand Theft Auto V'
    'playgtav.exe' = 'Grand Theft Auto V'
    'valorant.exe' = 'VALORANT'
    'valorant-win64-shipping.exe' = 'VALORANT'
    'robloxplayerbeta.exe' = 'Roblox'
    'discovery.exe' = 'The Finals'
    'bloodstrike.exe' = 'BloodStrike'
    'goose goose duck.exe' = 'Goose Goose Duck'
    'mimic party.exe' = 'Mimic Party'
    'penguinhotel.exe' = 'Meccha Chameleon'
    'androidemulatoren.exe' = 'Gameloop Emulator'
    'androidemulator.exe' = 'Gameloop Emulator'
    'aow_exe.exe' = 'Gameloop Engine'
    'cs2.exe' = 'Counter-Strike 2'
    'csgo.exe' = 'Counter-Strike: Global Offensive'
    'fortniteclient-win64-shipping.exe' = 'Fortnite'
    'cod.exe' = 'Call of Duty / Warzone'
    'r5apex.exe' = 'Apex Legends'
    'minecraft.exe' = 'Minecraft'
    'javaw.exe' = 'Minecraft Java'
    'overwatch.exe' = 'Overwatch'
    'rocketleague.exe' = 'Rocket League'
    'cyberpunk2077.exe' = 'Cyberpunk 2077'
    'eldenring.exe' = 'Elden Ring'
    'rdr2.exe' = 'Red Dead Redemption 2'
    'tslgame.exe' = 'PUBG: Battlegrounds'
    'rainbowsix.exe' = 'Rainbow Six Siege'
    'destiny2.exe' = 'Destiny 2'
    'genshinimpact.exe' = 'Genshin Impact'
    'starrail.exe' = 'Honkai: Star Rail'
    'zzz.exe' = 'Zenless Zone Zero'
    'witcher3.exe' = 'The Witcher 3'
    'dota2.exe' = 'Dota 2'
    'rustclient.exe' = 'Rust'
    'deadbydaylight-win64-shipping.exe' = 'Dead by Daylight'
    'league of legends.exe' = 'League of Legends'
    'wallpaper64.exe' = 'Wallpaper Engine'

    'discord.exe' = 'Discord'
    'spotify.exe' = 'Spotify'
    'chrome.exe' = 'Google Chrome'
    'brave.exe' = 'Brave Browser'
    'firefox.exe' = 'Mozilla Firefox'
    'msedge.exe' = 'Microsoft Edge'
    'opera.exe' = 'Opera'
    'opera_gx.exe' = 'Opera GX'
    'code.exe' = 'Visual Studio Code'
    'devenv.exe' = 'Visual Studio'
    'antigravity.exe' = 'Antigravity IDE'
    'cursor.exe' = 'Cursor Editor'
    'nvidia app.exe' = 'NVIDIA App'
    'nvidia geforce experience.exe' = 'GeForce Experience'
    'nvcontainer.exe' = 'NVIDIA Container'
    'steam.exe' = 'Steam Client'
    'steamwebhelper.exe' = 'Steam Web Helper'
    'epicgameslauncher.exe' = 'Epic Games Launcher'
    'riotclientservices.exe' = 'Riot Client'
    'riot client.exe' = 'Riot Client'
    'telegram.exe' = 'Telegram'
    'whatsapp.exe' = 'WhatsApp'
    'slack.exe' = 'Slack'
    'zoom.exe' = 'Zoom'
    'skype.exe' = 'Skype'
    'obsidian.exe' = 'Obsidian'
    'notion.exe' = 'Notion'
    'githubdesktop.exe' = 'GitHub Desktop'
    'notepad++.exe' = 'Notepad++'
    'vlc.exe' = 'VLC Media Player'
    'itunes.exe' = 'iTunes'
    '7zfm.exe' = '7-Zip'
    'winrar.exe' = 'WinRAR'
}

$foundApps = @{}
$foundGames = @{}

$drives = Get-PSDrive -PSProvider FileSystem | Select-Object -ExpandProperty Root
$gameDirs = @()
foreach ($d in $drives) {
    foreach ($sub in @('SteamLibrary\steamapps\common', 'Program Files (x86)\Steam\steamapps\common', 'Program Files\Steam\steamapps\common', 'Games', 'Riot Games', 'XboxGames', 'Epic Games')) {
        $p = Join-Path $d $sub
        if (Test-Path $p) { $gameDirs += $p }
    }
}

$userAppDirs = @(
    'C:\Program Files',
    'C:\Program Files (x86)',
    "$env:LOCALAPPDATA\Programs",
    "$env:LOCALAPPDATA\Discord",
    "$env:APPDATA\Spotify",
    "$env:LOCALAPPDATA\Roblox"
)

foreach ($gd in $gameDirs) {
    Get-ChildItem -Path $gd -Filter '*.exe' -Recurse -Depth 3 -ErrorAction SilentlyContinue | ForEach-Object {
        $name = $_.Name.ToLower()
        if ($name -notmatch 'unins|crash|report|setup|helper|redist|dxsetup|installer|touchup|cleanup|diagnostics|resourcecompiler|winrtutil|webwallpaper|wallpaperui|apputil|languageselect|trial|showcase|ggdlauncher|python|beservice|rockstar|steamredownload|wallpaperinject|wallpaperservice|wallpaper32|edgewallpaper|androidemulatorex|appmarket') {
            $foundGames[$name] = $_.FullName
        }
    }
}

foreach ($ad in $userAppDirs) {
    if (Test-Path $ad) {
        Get-ChildItem -Path $ad -Filter '*.exe' -Recurse -Depth 3 -ErrorAction SilentlyContinue | ForEach-Object {
            $name = $_.Name.ToLower()
            if ($gameExes -contains $name) {
                $foundGames[$name] = $_.FullName
            } elseif ($appExes -contains $name) {
                $foundApps[$name] = $_.FullName
            }
        }
    }
}

$gpuKey = 'HKCU:\Software\Microsoft\DirectX\UserGpuPreferences'
if (-not (Test-Path $gpuKey)) { New-Item -Path $gpuKey -Force | Out-Null }
$existingGpu = Get-ItemProperty -Path $gpuKey -ErrorAction SilentlyContinue
if ($existingGpu) {
    $existingGpu.PSObject.Properties | Where-Object { $_.Name -match '\.exe$' } | ForEach-Object {
        $exeName = [System.IO.Path]::GetFileName($_.Name).ToLower()
        if ($appExes -contains $exeName) {
            $foundApps[$exeName] = $_.Name
        } elseif ($gameExes -contains $exeName) {
            if ($exeName -notmatch 'unins|crash|report|setup|helper|redist|dxsetup|installer|touchup|cleanup|diagnostics|resourcecompiler|winrtutil|webwallpaper|wallpaperui|apputil|languageselect|trial|showcase|ggdlauncher|python|beservice|rockstar|steamredownload|wallpaperinject|wallpaperservice|wallpaper32|edgewallpaper|androidemulatorex|appmarket') {
                $foundGames[$exeName] = $_.Name
            }
        }
    }
}

# 1. Apply Games: GpuPreference=2; (High Performance) & IFEO CpuPriorityClass=3 (High), IoPriority=3
foreach ($item in $foundGames.GetEnumerator()) {
    Set-ItemProperty -Path $gpuKey -Name $item.Value -Value 'GpuPreference=2;' -Type String -Force -ErrorAction SilentlyContinue
}
$allGameNames = ($foundGames.Keys + $gameExes) | Select-Object -Unique
foreach ($name in $allGameNames) {
    $ifeoPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\$name\PerfOptions"
    if (-not (Test-Path $ifeoPath)) { New-Item -Path $ifeoPath -Force -ErrorAction SilentlyContinue | Out-Null }
    Set-ItemProperty -Path $ifeoPath -Name 'CpuPriorityClass' -Value 3 -Type DWord -Force -ErrorAction SilentlyContinue
    Set-ItemProperty -Path $ifeoPath -Name 'IoPriority' -Value 3 -Type DWord -Force -ErrorAction SilentlyContinue
}

# 2. Apply Apps: GpuPreference=1; (Power Saving) & IFEO CpuPriorityClass=2 (Normal), IoPriority=2
foreach ($item in $foundApps.GetEnumerator()) {
    Set-ItemProperty -Path $gpuKey -Name $item.Value -Value 'GpuPreference=1;' -Type String -Force -ErrorAction SilentlyContinue
}
$allAppNames = ($foundApps.Keys + $appExes) | Select-Object -Unique
foreach ($name in $allAppNames) {
    $ifeoPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\$name\PerfOptions"
    if (-not (Test-Path $ifeoPath)) { New-Item -Path $ifeoPath -Force -ErrorAction SilentlyContinue | Out-Null }
    Set-ItemProperty -Path $ifeoPath -Name 'CpuPriorityClass' -Value 2 -Type DWord -Force -ErrorAction SilentlyContinue
    Set-ItemProperty -Path $ifeoPath -Name 'IoPriority' -Value 2 -Type DWord -Force -ErrorAction SilentlyContinue
}

# Print Detected Games & Apps cleanly to the user
Write-Host ""
Write-Host "  $purple╔══════════════════════════════════════════════════════════════════════════╗$reset"
Write-Host "  $purple║$green   Detected Games -> High Performance GPU & High Priority               $purple║$reset"
Write-Host "  $purple╚══════════════════════════════════════════════════════════════════════════╝$reset"
if ($foundGames.Count -eq 0) {
    Write-Host "    $gray• None detected in common library paths.$reset"
} else {
    $displayedGames = @{}
    foreach ($exe in $foundGames.Keys | Sort-Object) {
        $dName = if ($knownDisplayNames.ContainsKey($exe)) { $knownDisplayNames[$exe] } else { [System.IO.Path]::GetFileNameWithoutExtension($exe) }
        if (-not $displayedGames.ContainsKey($dName)) {
            $displayedGames[$dName] = $true
            Write-Host "    $gray• $white$dName $gray($exe)$reset"
        }
    }
}

Write-Host ""
Write-Host "  $purple╔══════════════════════════════════════════════════════════════════════════╗$reset"
Write-Host "  $purple║$cyan   Detected Apps  -> Power Saving GPU & Normal Priority                 $purple║$reset"
Write-Host "  $purple╚══════════════════════════════════════════════════════════════════════════╝$reset"
if ($foundApps.Count -eq 0) {
    Write-Host "    $gray• None detected in common library paths.$reset"
} else {
    $displayedApps = @{}
    foreach ($exe in $foundApps.Keys | Sort-Object) {
        $dName = if ($knownDisplayNames.ContainsKey($exe)) { $knownDisplayNames[$exe] } else { [System.IO.Path]::GetFileNameWithoutExtension($exe) }
        if (-not $displayedApps.ContainsKey($dName)) {
            $displayedApps[$dName] = $true
            Write-Host "    $gray• $white$dName $gray($exe)$reset"
        }
    }
}
Write-Host ""
