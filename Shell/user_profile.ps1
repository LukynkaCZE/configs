oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/catppuccin_mocha.omp.json" | Invoke-Expression

function SetupPersonalGitRepo {
	git config user.name "LukynkaCZE"
	git config user.email "jiraklukas058@seznam.cz"
	Write-Host "Git user set to Personal" -ForegroundColor Green
}

function GoToCodingFolder {E: && cd Coding}

function UpdatePowershellConfig {
	copy E:\Coding\configs\Shell\user_profile.ps1 C:\Users\LukynkaCZE\.config\powershell\user_profile.ps1 
	Write-Host "Done! Powershell config updated!" -ForegroundColor Green 
}


function UpdateConfigs {
	UpdatePowershellConfig
	UpdateWMConfig
	UpdateJetbrainsKeymap
}

function UpdateJetbrainsKeymap {
	Copy-Item C:\Users\Lukynkacze\AppData\Roaming\JetBrains\IdeaIC2024.1\keymaps\LukynkaCZE.xml E:\Coding\configs\Jetbrains\LukynkaCZE.xml
	Write-Host "Done! Jetbrains keymap copied over!" -ForegroundColor Green 
}

function UpdateWMConfig {
	copy C:\Users\LukynkaCZE\.glaze-wm\config.yaml E:\Coding\configs\glazewm\config.yaml
	Write-Host "Done! GlazeWM config copied over!" -ForegroundColor Green 
}

function SetTask() {
	$url = "http://192.168.0.181:6969/task/set?task=" +$args
	$Silent = Invoke-WebRequest -Uri $url -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
	Write-Host "Done! Changed task to" $args -ForegroundColor Green 
}

function ClearTask() {
	$url = "http://192.168.0.181:6969/task/clear"
	$Silent = Invoke-WebRequest -Uri $url -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
	Write-Host "Done! Cleared task!" -ForegroundColor Green 
}


function runKotlin() {
	$ktFile = $Env:TEMP + "/qrkrun.kt"
	$jar = $Env:TEMP + "/qrkrun.jar"
	$code = $args.Replace("'", """") + "}"
	"fun main() { " +$code | Out-File -FilePath $ktFile
	kotlinc $ktFile -include-runtime -d $jar
	java -jar $jar
}

function StartTabletDrivers() {
	Start-Process powershell -verb runas -WindowStyle Hidden {E:\Coding\configs\Shell\tabletDrivers.ps1}
	Write-Host "Killed Wacom Tablet Drivers.." -ForegroundColor Red 
	Write-Host "Started Open Tablet Drivers.." -ForegroundColor Green 
}

function SSHToRPI() {
	ssh pi@192.168.0.181
}

function SetStreamOverlayToOtographic($bool) {
	$url = "http://192.168.0.181:6969/spotify/otographic?enabled=false"
	$Silent = Invoke-WebRequest -Uri $url -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
	Write-Host "Done! Set otographic enabled to $bool!" -ForegroundColor Green 
} 

function qtStart {
	C:\Users\LukynkaCZE\Documents\QuickTwitch\QuickTChat.exe
}

function qtStop {
	Start-Process powershell -verb runas -WindowStyle Hidden {E:\Coding\configs\Shell\twitch_chat.ps1}
}

function Dockyard {
	E:
	coding && cd Kotlin/Dockyard
}

function KeyboardToolsManager {
	if($args.Contains("start")) {
		Start-Process -FilePath "C:\Users\LukynkaCZE\Documents\KeyboardTools.exe" -WindowStyle Hidden
		Write-Host "Done! Started Keyboard Tools" -ForegroundColor Green
	} else {
		Stop-Process -Name "KeyboardTools" -Force
		Write-Host "Done! Killed Keyboard Tools" -ForegroundColor Red
	}
}

Set-Alias dockard Dockyard
Set-Alias tablet StartTabletDrivers
Set-Alias vim neovim
Set-Alias kscript runKotlin
Set-Alias lg lazygit
Set-Alias kt KeyboardToolsManager
Set-Alias vsc code
Set-Alias git_personal SetupPersonalGitRepo
Set-Alias coding GoToCodingFolder
Set-Alias shh ssh
Set-Alias dc cd
Set-Alias configs_update UpdateConfigs
Set-Alias to_wav toWav
Set-Alias to_mp3 toMp3
Set-Alias to_mp4 toMp4
Set-Alias to_png toPng
Set-Alias to_jpg toJpg
Set-Alias to_webp toWebp
Set-Alias set_task SetTask
Set-Alias clear_task ClearTask
Set-Alias rpi SSHToRPI
Set-Alias stream_otographic SetStreamOverlayToOtographic
Set-Alias qt_start qtStart
Set-Alias qt_stop qtStop
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
