class DnsSync < Formula
  desc "DNS as code. Sync DNS zones across providers (Cloudflare, GCP Cloud DNS)"
  homepage "https://github.com/cl8dep/dns-sync"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.6.1/dns-sync-darwin-arm64"
      sha256 "7cba64c7cda6f5ae569157b3c6833af82773d3c6c0dda1025cbe1a97797285c2"
    else
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.6.1/dns-sync-darwin-x64"
      sha256 "d1205a7aa7637dbd43339c864e5cc3a9e954bf52b9d5ba46c63da62a6b3570ef"
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
