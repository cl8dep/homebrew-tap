class DnsSync < Formula
  desc "DNS as code. Sync DNS zones across providers (Cloudflare, GCP Cloud DNS)"
  homepage "https://github.com/cl8dep/dns-sync"
  version "0.6.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.6.7/dns-sync-darwin-arm64"
      sha256 "f0f4b2b7fd170325d4f7f8cf29aaf2424b1cafeabf7cfc590b37935ae6964d77"
    else
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.6.7/dns-sync-darwin-x64"
      sha256 "f7d7989eba9348a10897edfffff95ba280ccffb6ca8cb86879eeb55f96b546dc"
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
