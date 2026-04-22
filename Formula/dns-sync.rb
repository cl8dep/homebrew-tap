class DnsSync < Formula
  desc "DNS as code. Sync DNS zones across providers (Cloudflare, GCP Cloud DNS)"
  homepage "https://github.com/cl8dep/dns-sync"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.6.0/dns-sync-darwin-arm64"
      sha256 "2addaf3ded4684c5a918d0e1d1742b4ad1d9599925f9bcd2bd3776a1fa92629d"
    else
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.6.0/dns-sync-darwin-x64"
      sha256 "e574c3b260f2998dbd0d65001adebcb3d21b529cf949fcaa71cf1f2910e5baf2"
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
