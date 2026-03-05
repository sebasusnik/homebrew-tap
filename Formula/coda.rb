class Coda < Formula
  desc "Spotify CLI controller — search, play and control your music from the terminal"
  homepage "https://github.com/sebasusnik/coda"
  version "0.1.6"
  license "MIT"

  resource "zsh-completion" do
    url "https://github.com/sebasusnik/coda/releases/download/v0.1.6/_coda"
    sha256 "67d5d327a9cf211d1fb05543895d1b75ea29406773a497040f9cbff24e62a178"
  end

  on_macos do
    on_arm do
      url "https://github.com/sebasusnik/coda/releases/download/v#{version}/coda-darwin-arm64"
      sha256 "001f9373a74ffc66cba966574a116ad9d23f4e614d68d346f6575b63cd8119d5"
    end
    on_intel do
      url "https://github.com/sebasusnik/coda/releases/download/v#{version}/coda-darwin-amd64"
      sha256 "2abcd163a7bbf0fbea1dd71f49acb73956637556d9cf7345ba88938b82538217"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sebasusnik/coda/releases/download/v#{version}/coda-linux-arm64"
      sha256 "8a551c0623f942ff263eea0b865b12f9fecab78345c865170b4bb9b835bb6a4f"
    end
    on_intel do
      url "https://github.com/sebasusnik/coda/releases/download/v#{version}/coda-linux-amd64"
      sha256 "fc79034e94d082aaf0adac3cea72247a6a62aacfa3db0bb87218036418ad0119"
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
