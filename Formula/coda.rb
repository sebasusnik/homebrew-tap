class Coda < Formula
  desc "Spotify CLI controller — search, play and control your music from the terminal"
  homepage "https://github.com/sebasusnik/coda"
  version "0.1.5"
  license "MIT"

  resource "zsh-completion" do
    url "https://github.com/sebasusnik/coda/releases/download/v0.1.5/_coda"
    sha256 "67d5d327a9cf211d1fb05543895d1b75ea29406773a497040f9cbff24e62a178"
  end

  on_macos do
    on_arm do
      url "https://github.com/sebasusnik/coda/releases/download/v#{version}/coda-darwin-arm64"
      sha256 "1b11c4d539c067e0034541688aa3bd84e8b120d8d654ab1173a4826fbf58a5d0"
    end
    on_intel do
      url "https://github.com/sebasusnik/coda/releases/download/v#{version}/coda-darwin-amd64"
      sha256 "80cc97821356624d9d0a0b37ceef8cf9408502ca0fe5fe0973bd87cc75c1e8e7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sebasusnik/coda/releases/download/v#{version}/coda-linux-arm64"
      sha256 "317d5c80edcffb7b2dd1aa41abf4570a4c3a254fa4fae00fa0c2e96f9817538f"
    end
    on_intel do
      url "https://github.com/sebasusnik/coda/releases/download/v#{version}/coda-linux-amd64"
      sha256 "de005df88237b9952a3ee0720007698bd8f877ea31c35bd1639e5fe8242d79c6"
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
