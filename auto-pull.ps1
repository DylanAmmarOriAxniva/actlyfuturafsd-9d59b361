# Auto-Pull Script for Real-Time Updates
# Jalankan script ini untuk auto-pull perubahan dari GitHub setiap interval waktu

$repoPath = "C:\Users\dylan\Downloads\ACTLY-Futura-FSD"
$interval = 60  # Pull setiap 60 detik, ubah sesuai kebutuhan

Write-Host "Starting auto-pull service for $repoPath"
Write-Host "Pulling every $interval seconds"
Write-Host "Press Ctrl+C to stop"

while ($true) {
    try {
        Set-Location $repoPath
        $output = git pull origin main 2>&1
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        Write-Host "[$timestamp] Pull attempt completed"
        
        if ($output -like "*Already up to date*") {
            Write-Host "  No changes"
        } else {
            Write-Host "  Changes pulled: $output"
        }
    }
    catch {
        Write-Host "Error during pull: $_"
    }
    
    Start-Sleep -Seconds $interval
}
