class Docksal < Formula
  desc "Docker powered web development environments for macOS, Windows & Linux"
  homepage "https://docksal.io"
  url "https://github.com/docksal/docksal/archive/v1.19.0.tar.gz"
  sha256 "7881d5e9e47e126948944165d8c4a8775b166f94d0ea519e5982003d9a7f4a3a"
  license "MIT"

  livecheck do
    url "https://github.com/docksal/docksal/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
  end

  uses_from_macos "curl"

  on_linux do
    depends_on "curl"
  end

  def install
    bin.install "bin/fin"
  end

  def post_install
    home = ENV["HOME"]
    system "echo #{home}"
  end

  test do
    system "#{bin}/fin" "--version"
  end
end
