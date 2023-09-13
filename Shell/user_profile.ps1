oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/catppuccin_mocha.omp.json" | Invoke-Expression

function SetupPersonalGitRepo {
	git config user.name "LukynkaCZE"
	git config user.email "jiraklukas058@seznam.cz"
	Write-Host "Git user set to Personal" -ForegroundColor Green
}

function SetupCapolloGitRepo {
	git config user.name "LukynkaCZE"
	git config user.email "lukynka@capollomedia.com"
	Write-Host "Git user set to Capollo Media" -ForegroundColor Green
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

Set-Alias vim neovim
Set-Alias lg lazygit
Set-Alias kt KeyboardTools
Set-Alias vsc code
Set-Alias git_personal SetupPersonalGitRepo
Set-Alias git_capollo SetupCapolloGitRepo
Set-Alias coding GoToCodingFolder
Set-Alias shh ssh
Set-Alias dc cd
Set-Alias kt_update UpdateKeyboardTools
Set-Alias configs_update UpdateConfigs