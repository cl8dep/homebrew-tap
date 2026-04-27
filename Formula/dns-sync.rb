class DnsSync < Formula
  desc "DNS as code. Sync DNS zones across providers (Cloudflare, GCP Cloud DNS)"
  homepage "https://github.com/cl8dep/dns-sync"
  version "0.6.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.6.2/dns-sync-darwin-arm64"
      sha256 "c671832ae41073c2dc2d45e7757aa20b885de79fb9d3e0131cefd22856aba6a7"
    else
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.6.2/dns-sync-darwin-x64"
      sha256 "bea3ad92a8ae5398203f13558418813a17a206f24d3e2d3ac0a106f808566383"
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
