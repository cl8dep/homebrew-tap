class DnsSync < Formula
  desc "DNS as code. Sync DNS zones across providers (Cloudflare, GCP Cloud DNS)"
  homepage "https://github.com/cl8dep/dns-sync"
  version "0.6.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.6.8/dns-sync-darwin-arm64"
      sha256 "cf554fc99fef549dd2abd68e0591180fa9ea08ad56e5d9b4dea4f2114a55d5eb"
    else
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.6.8/dns-sync-darwin-x64"
      sha256 "fd7dcb7243393bc7cddb3692b9ab36d9d3a556aaeedf221d02654b2c9fb1297f"
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
