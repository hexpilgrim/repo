# pkgs/cursor/default.nix
{ pkgs ? import <nixpkgs> {} }:

# Cursor is distributed as an AppImage (Type 2 wrapped here)
# This does not sandbox or unpack the app—just makes it executable
# AppImages rely on host libraries present in the runtime environment
pkgs.appimageTools.wrapType2 {
  pname = "cursor";
  version = "3.6.31";
  name = "cursor";

  # Fetch AppImage from official Cursor CDN
  src = pkgs.fetchurl {
    url = "https://downloads.cursor.com/production/81fcf2931d7687b4ff3f3017858d0c6dee7e2a68/linux/x64/Cursor-3.6.31-x86_64.AppImage";
    sha256 = "014738a18df48e250799e53d6e78ae6f429ca4bb6a2bef4757695f2ec5029642";
  };

  # Metadata for package introspection and indexing
  meta = with pkgs.lib; {
    description = "Cursor AI-powered code editor";
    homepage = "https://www.cursor.so/";
    license = licenses.unfree;
    platforms = platforms.linux;
  };
}
