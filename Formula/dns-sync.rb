class DnsSync < Formula
  desc "DNS as code. Sync DNS zones across providers (Cloudflare, GCP Cloud DNS)"
  homepage "https://github.com/cl8dep/dns-sync"
  version "0.6.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.6.4/dns-sync-darwin-arm64"
      sha256 "563591f08f6e2cdbf748f07ac7a8de0ce5d180fe1d2a84d24403438ad7f13546"
    else
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.6.4/dns-sync-darwin-x64"
      sha256 "22bff4a74dd03087876cc6c75acb2b3b6643b2f4efe748a2fdaab577abc6cbc0"
    end
  end

  def install
    binary = Hardware::CPU.arm? ? "dns-sync-darwin-arm64" : "dns-sync-darwin-x64"
    bin.install binary => "dns-sync"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dns-sync --version")
  end
end
