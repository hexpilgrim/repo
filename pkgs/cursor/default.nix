# pkgs/cursor/default.nix
{ pkgs ? import <nixpkgs> {} }:

# Cursor is distributed as an AppImage (Type 2 wrapped here)
# This does not sandbox or unpack the app—just makes it executable
# AppImages rely on host libraries present in the runtime environment
pkgs.appimageTools.wrapType2 {
  pname = "cursor";
  version = "3.31.10";
  name = "cursor";

  # Fetch AppImage from official Cursor CDN
  src = pkgs.fetchurl {
    url = "https://downloads.cursor.com/production/efb1d5c5a2105aa8cc75281544af2cdcbd426024/linux/x64/Cursor-3.31.10-x86_64.AppImage";
    sha256 = "de820ea5be1aebb87557b471a5782b6b6ded38c7b7cfd0af3f326519ae7e7d31";
  };

  # Metadata for package introspection and indexing
  meta = with pkgs.lib; {
    description = "Cursor AI-powered code editor";
    homepage = "https://www.cursor.so/";
    license = licenses.unfree;
    platforms = platforms.linux;
  };
}
