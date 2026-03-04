class Coda < Formula
  desc "Spotify CLI controller — search, play and control your music from the terminal"
  homepage "https://github.com/sebasusnik/coda"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sebasusnik/coda/releases/download/v#{version}/coda-darwin-arm64"
      sha256 "0e757a551749938cfd5c6555a375b1a75d3a5ad62a70143e8072b2437bd41bcc"
    end
    on_intel do
      url "https://github.com/sebasusnik/coda/releases/download/v#{version}/coda-darwin-amd64"
      sha256 "3c415ac68f5474b4001c0af90469db6e5ac9cf8f1ad32b8dbdf3ff491e74db9a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sebasusnik/coda/releases/download/v#{version}/coda-linux-arm64"
      sha256 "676ccfa7ab02f2cdef672875eb7227bd40ffb7d69915332349eeeec74324b3c9"
    end
    on_intel do
      url "https://github.com/sebasusnik/coda/releases/download/v#{version}/coda-linux-amd64"
      sha256 "9a391390125d3f0e21156b7289733f68bfa9d0654e279c4a49eaf416fbc930b4"
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
