# pkgs/cursor/default.nix
{ pkgs ? import <nixpkgs> {} }:

# Cursor is distributed as an AppImage (Type 2 wrapped here)
# This does not sandbox or unpack the app—just makes it executable
# AppImages rely on host libraries present in the runtime environment
pkgs.appimageTools.wrapType2 {
  pname = "cursor";
  version = "3.31.15";
  name = "cursor";

  # Fetch AppImage from official Cursor CDN
  src = pkgs.fetchurl {
    url = "https://downloads.cursor.com/production/3eb8c13390837371c7c2f2013dc57fdbc802c753/linux/x64/Cursor-3.31.15-x86_64.AppImage";
    sha256 = "64680af85adc069f890d517c225eca9805f806961b767e0f60130b3f76a3205d";
  };

  # Metadata for package introspection and indexing
  meta = with pkgs.lib; {
    description = "Cursor AI-powered code editor";
    homepage = "https://www.cursor.so/";
    license = licenses.unfree;
    platforms = platforms.linux;
  };
}
