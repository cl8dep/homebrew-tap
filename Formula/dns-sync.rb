class DnsSync < Formula
  desc "DNS as code. Sync DNS zones across providers (Cloudflare, GCP Cloud DNS)"
  homepage "https://github.com/cl8dep/dns-sync"
  version "0.6.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.6.3/dns-sync-darwin-arm64"
      sha256 "694c56ff2dcd7a1d9059307514710bdf29bc9ce0d367c5124ca3cd49d5a6c347"
    else
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.6.3/dns-sync-darwin-x64"
      sha256 "59a3dc2abe0bf70c70bbbc28acfd1a8b812083434d3ea5307b58901b1319c2eb"
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
