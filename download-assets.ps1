# Downloads every image + video used on the EU9 AMP homepage into .\assets\
# Run this in PowerShell on a machine with normal internet access.
#
# Usage:
#   cd C:\xampp\htdocs\amp-eu9
#   powershell -ExecutionPolicy Bypass -File .\download-assets.ps1
#
# After running, assets\images\ and assets\video\ will contain all files.
# Then: git add assets; git commit -m "Add local copies of homepage media"; git push

New-Item -ItemType Directory -Force -Path "assets\images" | Out-Null
New-Item -ItemType Directory -Force -Path "assets\video" | Out-Null

$images = @(
  "https://eu9.asia/wp-content/uploads/2022/05/eu9-logo.svg",
  "https://eu9.asia/wp-content/uploads/2022/05/indonesia-1.webp",
  "https://eu9.asia/wp-content/uploads/2022/05/malaysia-1.webp",
  "https://eu9.asia/wp-content/uploads/2022/05/singapore.webp",
  "https://eu9.asia/wp-content/uploads/2022/05/vietnam-1.webp",
  "https://eu9.asia/wp-content/uploads/2022/05/cambodia-1.webp",
  "https://eu9.asia/wp-content/uploads/2022/07/300322-EUBet-We-are-Now-EU9-Banner_Twitter.webp",
  "https://eu9.asia/wp-content/uploads/2026/07/poker.svg",
  "https://eu9.asia/wp-content/uploads/2026/07/slot.svg",
  "https://eu9.asia/wp-content/uploads/2026/07/sportsbook.svg",
  "https://eu9.asia/wp-content/uploads/2026/07/icon-eu9-fishing.svg",
  "https://eu9.asia/wp-content/uploads/2022/11/game-slide-1.png",
  "https://eu9.asia/wp-content/uploads/2022/11/game-slide-2.png",
  "https://eu9.asia/wp-content/uploads/2022/11/game-slide-3.png",
  "https://eu9.asia/wp-content/uploads/2022/11/game-slide-4.png",
  "https://eu9.asia/wp-content/uploads/2024/05/sponsor-page-angelapuiyi-banner.webp",
  "https://eu9.asia/wp-content/uploads/2023/08/eu9_feature_01.webp",
  "https://eu9.asia/wp-content/uploads/2023/08/eu9_feature_02.webp",
  "https://eu9.asia/wp-content/uploads/2023/08/eu9_feature_03.webp",
  "https://eu9.asia/wp-content/uploads/2023/08/eu9_feature_04.webp",
  "https://eu9.asia/wp-content/uploads/2022/11/Group-7.jpg",
  "https://eu9.asia/wp-content/uploads/2023/08/eu9_apps_ios.jpg",
  "https://eu9.asia/wp-content/uploads/2026/07/evo.webp",
  "https://eu9.asia/wp-content/uploads/2026/07/endorphina.webp",
  "https://eu9.asia/wp-content/uploads/2026/07/dreamgame.png",
  "https://eu9.asia/wp-content/uploads/2026/07/cmd.webp",
  "https://eu9.asia/wp-content/uploads/2026/07/awc_spadegaming.webp",
  "https://eu9.asia/wp-content/uploads/2026/07/sexy_baccarat.png",
  "https://eu9.asia/wp-content/uploads/2026/07/simpleplay.webp",
  "https://eu9.asia/wp-content/uploads/2026/07/nextspin.webp",
  "https://eu9.asia/wp-content/uploads/2026/07/mega888.png",
  "https://eu9.asia/wp-content/uploads/2026/07/m8sport.webp",
  "https://eu9.asia/wp-content/uploads/2023/08/eu9_apps.webp",
  "https://eu9.asia/wp-content/uploads/2024/05/EU9_1st-telegram-casino_banner.webp",
  "https://eu9.asia/wp-content/uploads/2024/05/Speed_White.png",
  "https://eu9.asia/wp-content/uploads/2024/05/Security_White.png",
  "https://eu9.asia/wp-content/uploads/2024/05/Diversity_White.png",
  "https://eu9.asia/wp-content/uploads/2024/05/ExclusivePromotion_White.png",
  "https://eu9.asia/wp-content/uploads/2023/08/eu9-logo-black.webp",
  "https://eu9.asia/wp-content/uploads/2023/08/pragmatic_play_logo.webp",
  "https://eu9.asia/wp-content/uploads/2023/08/spadegaming_logo.webp",
  "https://eu9.asia/wp-content/uploads/2023/08/qtech_logo.webp",
  "https://eu9.asia/wp-content/uploads/2022/11/SimpleLogo-1.png",
  "https://eu9.asia/wp-content/uploads/2022/11/Frame-1.png",
  "https://eu9.asia/wp-content/uploads/2023/08/Pagcor_logo.png",
  "https://eu9.asia/wp-content/uploads/2023/08/RHB.webp",
  "https://eu9.asia/wp-content/uploads/2023/08/Maybank.webp",
  "https://eu9.asia/wp-content/uploads/2023/08/CIMB-2-1.webp",
  "https://eu9.asia/wp-content/uploads/2023/08/eu9_reponsible_18.webp",
  "https://eu9.asia/wp-content/uploads/2023/08/eu9_reponsible_aware.webp",
  "https://eu9.asia/wp-content/uploads/2023/08/eu9_reponsible_gamecare.webp",
  "https://eu9.asia/wp-content/uploads/2022/05/fav.png"
)

$videos = @(
  "https://eu9.asia/wp-content/uploads/2024/11/eu9-asia-intro-video.mp4"
)

Write-Host "Downloading $($images.Count) images..."
foreach ($url in $images) {
  $fname = Split-Path $url -Leaf
  Write-Host "  -> $fname"
  try {
    Invoke-WebRequest -Uri $url -OutFile "assets\images\$fname" -ErrorAction Stop
  } catch {
    Write-Host "     FAILED: $url" -ForegroundColor Red
  }
}

Write-Host "Downloading $($videos.Count) video(s)..."
foreach ($url in $videos) {
  $fname = Split-Path $url -Leaf
  Write-Host "  -> $fname"
  try {
    Invoke-WebRequest -Uri $url -OutFile "assets\video\$fname" -ErrorAction Stop
  } catch {
    Write-Host "     FAILED: $url" -ForegroundColor Red
  }
}

Write-Host "Done. Check assets\images and assets\video for any FAILED downloads above."
