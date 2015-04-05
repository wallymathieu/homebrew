class Nuget < Formula
  homepage "nuget.org"
  url "https://api.nuget.org/downloads/nuget.exe"
  sha256 "6e0455bbae41f117c22b080988c48240e58448d7b5583659afba2b7873f3df39"
  version "2.8.60318.667"

  depends_on "mono"

  def install
    (share/'tool').install 'nuget.exe'
    (bin/'nuget').write <<-EOS
#!/bin/sh
mono --runtime=v4.0 #{share}/tool/nuget.exe "$@"
EOS
  end
end
