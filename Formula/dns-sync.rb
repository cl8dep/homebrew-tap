class DnsSync < Formula
  desc "DNS as code. Sync DNS zones across providers (Cloudflare, GCP Cloud DNS)"
  homepage "https://github.com/cl8dep/dns-sync"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.7.0/dns-sync-darwin-arm64"
      sha256 "1ae482ff27ddcf450e1778a2f6134d5edd8250a021ecc90e5fa3eeef701f0b9d"
    else
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.7.0/dns-sync-darwin-x64"
      sha256 "6efad03982d695b9e2030f6c3c361c4706cfb1b39a00cf4df94d3218be052587"
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
