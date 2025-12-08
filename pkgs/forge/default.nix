{ pkgs ? import <nixpkgs> {} }:

let 
  pname = "crafted-launcher-legacy";
  version = "2.2.2";

  src = pkgs.fetchurl {
    url = "https://github.com/BelgianDev/Crafted-Launcher-Legacy/releases/download/v${version}/Crafted.Launcher.Legacy-setup-${version}.AppImage";
    hash = "sha256-cT9AzaNDehEg4k6chLRGHT9Ki26Cgr+2Xk2T7TioiJ4="; 
  };

  runtimeLibs = with pkgs; [
    (lib.getLib stdenv.cc.cc)

    # Natives
    glfw3-minecraft
    openal

    ## openal
    alsa-lib
    libjack2
    libpulseaudio
    pipewire

    ## glfw
    libGL
    xorg.libX11
    xorg.libXcursor
    xorg.libXext
    xorg.libXrandr
    xorg.libXxf86vm

    # Exceptions
    udev # oshi
    vulkan-loader # VulkanMod's lwjgl
  ];

  appimageContents = pkgs.appimageTools.extractType2 { inherit pname src version; };
in
pkgs.appimageTools.wrapType2 rec {
  inherit pname version src;

  extraPkgs = _: runtimeLibs;

  nativeBuildInputs = with pkgs; [ makeWrapper ];
  extraInstallCommands = ''
    install -m 444 -D ${appimageContents}/crafted-launcher.desktop $out/share/applications/${pname}.desktop
    install -m 444 -D ${appimageContents}/crafted-launcher.png $out/share/icons/hicolor/512x512/apps/crafted-launcher.png

    substituteInPlace $out/share/applications/${pname}.desktop \
    	--replace 'Exec=AppRun --no-sandbox %U' 'Exec=${pname} %U'

    wrapProgram $out/bin/${pname} \
      --set LD_LIBRARY_PATH "${pkgs.lib.makeLibraryPath runtimeLibs}" 
  '';

  meta = with pkgs.lib; {
    description = "Crafted Launcher Legacy — a Minecraft launcher";
    homepage = "https://github.com/BelgianDev/crafted-launcher-legacy";
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = [ 
      {
        name = "RaftDev";
        email = "theraft08@gmail.com";
        github = "BelgianDev";
      }
    ];
  };
}