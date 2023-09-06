oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/catppuccin_mocha.omp.json" | Invoke-Expression

function SetupPersonalGitRepo {git config user.name "LukynkaCZE" && git config user.email "jiraklukas058@seznam.cz"}
function SetupCapolloGitRepo {git config user.name "LukynkaCZE" && git config user.email "lukynka@capollomedia.com"}

function GoToCodingFolder {E: && cd Coding}

Set-Alias vim neovim
Set-Alias lg lazygit
Set-Alias kt KeyboardTools
Set-Alias vsc code
Set-Alias git_personal SetupPersonalGitRepo
Set-Alias git_capollo SetupCapolloGitRepo
Set-Alias coding GoToCodingFolder
Set-Alias shh ssh
Set-Alias dc cd