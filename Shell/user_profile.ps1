oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/catppuccin_mocha.omp.json" | Invoke-Expression

function SetupPersonalGitRepo {
	git config user.name "LukynkaCZE"
	git config user.email "jiraklukas058@seznam.cz"
	Write-Host "Git user set to Personal" -ForegroundColor Green
}

function GoToCodingFolder {E: && cd Coding}

function UpdateKeyboardTools {
	if (Get-Process -Name KeyboardTools -ErrorAction SilentlyContinue) {
		KeyboardTools stop
	}
	Start-Sleep -Seconds 0.3
	copy E:\Coding\C#\KeyboardTools\KeyboardTools\bin\Release\net7.0-windows\win-x64\publish\KeyboardTools.exe C:\Users\LukynkaCZE\Documents\KeyboardTools\KeyboardTools.exe
	Start-Sleep -Seconds 0.3
	KeyboardTools start
	Write-Host "Done! Keyboard Tools Updated" -ForegroundColor Green
}

function UpdatePowershellConfig {
	copy E:\Coding\configs\Shell\user_profile.ps1 C:\Users\LukynkaCZE\.config\powershell\user_profile.ps1 
	Write-Host "Done! Powershell config updated!" -ForegroundColor Green 
}

function GetLatestKeyboardToolsConfig {
	copy C:\Users\LukynkaCZE\Documents\KeyboardTools\config.json E:\Coding\configs\KeyboardTools\config.json
	Write-Host "Done! Copied over latest Keyboard Tools config file" -ForegroundColor Green 
}

function UpdateConfigs {
	UpdatePowershellConfig
	GetLatestKeyboardToolsConfig
}

function toWav($file) {
	$wavfile = $file.split(".")[1]
	$wavfile = ".$wavfile.wav"
	ffmpeg -i $file $wavfile
}
function toMp3($file) {
	$wavfile = $file.split(".")[1]
	$wavfile = ".$wavfile.mp3"
	ffmpeg -i $file $wavfile
}
function toMp4($file) {
	$wavfile = $file.split(".")[1]
	$wavfile = ".$wavfile.mp4"
	ffmpeg -i $file $wavfile
}
function toPng($file) {
	$wavfile = $file.split(".")[1]
	$wavfile = ".$wavfile.png"
	ffmpeg -i $file $wavfile
}
function toJpg($file) {
	$wavfile = $file.split(".")[1]
	$wavfile = ".$wavfile.jpg"
	ffmpeg -i $file $wavfile
}
function toWebp($file) {
	$wavfile = $file.split(".")[1]
	$wavfile = ".$wavfile.webp"
	ffmpeg -i $file $wavfile
}

Set-Alias vim neovim
Set-Alias lg lazygit
Set-Alias kt KeyboardTools
Set-Alias vsc code
Set-Alias git_personal SetupPersonalGitRepo
Set-Alias coding GoToCodingFolder
Set-Alias shh ssh
Set-Alias dc cd
Set-Alias kt_update UpdateKeyboardTools
Set-Alias configs_update UpdateConfigs
Set-Alias to_wav toWav
Set-Alias to_mp3 toMp3
Set-Alias to_mp4 toMp4
Set-Alias to_png toPng
Set-Alias to_jpg toJpg
Set-Alias to_webp toWebp