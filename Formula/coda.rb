class Coda < Formula
  desc "Spotify CLI controller — search, play and control your music from the terminal"
  homepage "https://github.com/sebasusnik/coda"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sebasusnik/coda/releases/download/v#{version}/coda-darwin-arm64"
      sha256 "e20637e889c972dfc38bd16cf05593bf46066a013c0179afafd033a8034f6179"
    end
    on_intel do
      url "https://github.com/sebasusnik/coda/releases/download/v#{version}/coda-darwin-amd64"
      sha256 "97ae409ace475a3d56179b7b9509e6cce06b27e99acec47c02c5e3c52c6489fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sebasusnik/coda/releases/download/v#{version}/coda-linux-arm64"
      sha256 "c45ddc10b4d5ffaecec4f18807d0d749aec49f35bc69ce2c863a22681c7dcdf4"
    end
    on_intel do
      url "https://github.com/sebasusnik/coda/releases/download/v#{version}/coda-linux-amd64"
      sha256 "6ea83117b2ccbe57ca40f1b4ab9c50eb4e9f0135c119d62b19a81229eb685a0f"
    end
  end

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    os = OS.mac? ? "darwin" : "linux"
    bin.install "coda-#{os}-#{arch}" => "coda"
    (zsh_completion/"_coda").write Utils.safe_popen_read(bin/"coda", "completion", "zsh")
    (bash_completion/"coda").write Utils.safe_popen_read(bin/"coda", "completion", "bash")
    (fish_completion/"coda.fish").write Utils.safe_popen_read(bin/"coda", "completion", "fish")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coda --version 2>&1")
  end
end
