class Coda < Formula
  desc "Spotify CLI controller — search, play and control your music from the terminal"
  homepage "https://github.com/sebasusnik/coda"
  version "0.1.4"
  license "MIT"

  resource "zsh-completion" do
    url "https://github.com/sebasusnik/coda/releases/download/v#{version}/_coda"
    sha256 "67d5d327a9cf211d1fb05543895d1b75ea29406773a497040f9cbff24e62a178"
  end

  on_macos do
    on_arm do
      url "https://github.com/sebasusnik/coda/releases/download/v#{version}/coda-darwin-arm64"
      sha256 "e85f986eaf05d8c63fd4f172d74e2262192a6eb54f501bae729f4ad4581f2f08"
    end
    on_intel do
      url "https://github.com/sebasusnik/coda/releases/download/v#{version}/coda-darwin-amd64"
      sha256 "720241c9df3da6378ac122cd85932a097994a37e4819ecf8d1ae563352e2ddfb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sebasusnik/coda/releases/download/v#{version}/coda-linux-arm64"
      sha256 "1ac9a279ca5e76168e807cf56a6c34c78b7f7aed073c62686708c40b0fa0bfa6"
    end
    on_intel do
      url "https://github.com/sebasusnik/coda/releases/download/v#{version}/coda-linux-amd64"
      sha256 "52bc95cc5ca2e4919145373e5be8159194f591a08ffa9caa9e4acfb5865487e0"
    end
  end

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    os = OS.mac? ? "darwin" : "linux"
    bin.install "coda-#{os}-#{arch}" => "coda"
    resource("zsh-completion").stage { zsh_completion.install "_coda" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coda --version 2>&1")
  end
end
