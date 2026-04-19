class DnsSync < Formula
  desc "DNS as code. Sync DNS zones across providers (Cloudflare, GCP Cloud DNS)"
  homepage "https://github.com/cl8dep/dns-sync"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.4.1/dns-sync-darwin-arm64"
      sha256 "cb7a7cc2460aab4e9dfe0af27ca22bba35252e9ee617f8854c46b77d5c68a2f8"
    else
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.4.1/dns-sync-darwin-x64"
      sha256 "eef00fd45bc912b4f07557ecf13b2695986ac2bd47b1153a34dc30cde6eb5c3d"
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
