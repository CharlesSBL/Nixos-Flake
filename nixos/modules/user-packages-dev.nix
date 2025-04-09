# PATH: "/etc/nixos/modules/user-packages-dev.nix"
{ pkgs, ... }:

{
  users.users.sach.packages = with pkgs;
    let
      # Version control
      vcsTools = [
        git # Distributed version control system
        gh # GitHub CLI tool
      ];

      # Editors and IDEs
      editors = [
        # vim # Terminal-based text editor
        # vscode # Modern code editor
        zed-editor # Fast, collaborative code editor
        # jetbrains.idea-community-bin # IntelliJ IDEA Community Edition
        # android-studio # Android development IDE
        ghostty # GPU-accelerated terminal emulator
        lf
      ];

    in
    vcsTools ++ editors;
}
