class Coda < Formula
  desc "Spotify CLI controller — search, play and control your music from the terminal"
  homepage "https://github.com/sebasusnik/coda"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sebasusnik/coda/releases/download/v#{version}/coda-darwin-arm64"
      sha256 "1ff88d5fab651c1e4d74ede94ac2f5c3818ddceaa63807aae96fd7a32aced097"
    end
    on_intel do
      url "https://github.com/sebasusnik/coda/releases/download/v#{version}/coda-darwin-amd64"
      sha256 "d3990dd4578f804981011d18da8ff0937e95e7a2a927aeb3ae1ba714f3ee7285"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sebasusnik/coda/releases/download/v#{version}/coda-linux-arm64"
      sha256 "9187f8bb1eb89ab48ad04e037e4b8058efee97080851f710855b96c9e387a451"
    end
    on_intel do
      url "https://github.com/sebasusnik/coda/releases/download/v#{version}/coda-linux-amd64"
      sha256 "5bba46555b025f65e24883ba742d11fe8dc3cbf4872705fcd3686fb9bab8d068"
    end
  end

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    os = OS.mac? ? "darwin" : "linux"
    bin.install "coda-\#{os}-\#{arch}" => "coda"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/coda --version 2>&1")
  end
end
