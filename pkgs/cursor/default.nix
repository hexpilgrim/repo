# pkgs/cursor/default.nix
{ pkgs ? import <nixpkgs> {} }:

# Cursor is distributed as an AppImage (Type 2 wrapped here)
# This does not sandbox or unpack the app—just makes it executable
# AppImages rely on host libraries present in the runtime environment
pkgs.appimageTools.wrapType2 {
  pname = "cursor";
  version = "3.14.27";
  name = "cursor";

  # Fetch AppImage from official Cursor CDN
  src = pkgs.fetchurl {
    url = "https://downloads.cursor.com/production/047548b00c1a079373d74d00183f32510a4a41e1/linux/x64/Cursor-3.14.27-x86_64.AppImage";
    sha256 = "75e8a51d1b4812645b2396873747f75e363e9db2aa3e4f6eee73d897ea60b426";
  };

  # Metadata for package introspection and indexing
  meta = with pkgs.lib; {
    description = "Cursor AI-powered code editor";
    homepage = "https://www.cursor.so/";
    license = licenses.unfree;
    platforms = platforms.linux;
  };
}
