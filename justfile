set shell := ["nu", "-c"]
hostname := `hostname | cut -d "." -f 1`
username := `whoami`

default: switch-darwin

clear:
  clear

# ------------------------------------------------------------------------------

[macos]
build-darwin target_host=hostname flags="": clear
  echo "Building Darwin config for host [{{target_host}}] with flags [{{flags}}]"
  nix --extra-experimental-features 'nix-command flakes' \
    build "./src/.#darwinConfigurations.{{target_host}}.system" {{flags}} \
    --show-trace \
    --out-link ./result/darwin

# ------------------------------------------------------------------------------

[macos]
switch-darwin target_host=hostname: (build-darwin target_host)
  echo "Switching to new Darwin system [{{target_host}}]"
  sudo ./result/darwin/sw/bin/darwin-rebuild switch \
    --flake "./src/.#{{target_host}}"

# ------------------------------------------------------------------------------

[macos]
build-home target_user=username flags="": clear
  echo "Building Home config for user [{{target_user}}] with flags [{{flags}}]"
  nix --extra-experimental-features 'nix-command flakes' \
    build "./src/.#homeConfigurations.{{target_user}}.activationPackage" {{flags}} \
    --show-trace \
    --out-link ./result/home

# ------------------------------------------------------------------------------

[macos]
switch-home target_user=username: (build-home target_user)
  echo "Activating Home configuration for user [{{target_user}}]"
  ./result/home/activate

# ------------------------------------------------------------------------------

update:
  nix flake update

gc:
  nix-collect-garbage -d
  nix-collect-garbage --delete-older-than 7d
  nix-store --gc
