class DnsSync < Formula
  desc "DNS as code. Sync DNS zones across providers (Cloudflare, GCP Cloud DNS)"
  homepage "https://github.com/cl8dep/dns-sync"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.4.0/dns-sync-darwin-arm64"
      sha256 "6817f0d4b8494e55cd0dbe46716339977a97b2991202107dd59df01ac0ea8ad5"
    else
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.4.0/dns-sync-darwin-x64"
      sha256 "0cc4e3db5797170d2d171e58dc9733fe47928a853942eb33e36b6663eaadc334"
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
