class Coda < Formula
  desc "Spotify CLI controller — search, play and control your music from the terminal"
  homepage "https://github.com/sebasusnik/coda"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sebasusnik/coda/releases/download/v#{version}/coda-darwin-arm64"
      sha256 "2812c175b79a83718db26c5cdaf75034b6de340b0e30c02eeb81571f1332dc22"
    end
    on_intel do
      url "https://github.com/sebasusnik/coda/releases/download/v#{version}/coda-darwin-amd64"
      sha256 "0b622b285be9af3fb424845afecc5ebdbfae35c0f121e196440a49c8925219fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sebasusnik/coda/releases/download/v#{version}/coda-linux-arm64"
      sha256 "b33d6ff2260e4f4c1ee54279ae21e5b7995f6ef5bd3d84b2b69f6de595697714"
    end
    on_intel do
      url "https://github.com/sebasusnik/coda/releases/download/v#{version}/coda-linux-amd64"
      sha256 "d1a78197a718d42955b25a09ebaf690524544ae50e0a5c827fe25dd069a447ed"
    end
  end

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    os = OS.mac? ? "darwin" : "linux"
    bin.install "coda-#{os}-#{arch}" => "coda"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coda --version 2>&1")
  end
end
