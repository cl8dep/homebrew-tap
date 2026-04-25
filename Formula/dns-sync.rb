class DnsSync < Formula
  desc "DNS as code. Sync DNS zones across providers (Cloudflare, GCP Cloud DNS)"
  homepage "https://github.com/cl8dep/dns-sync"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.6.1/dns-sync-darwin-arm64"
      sha256 "8010b2324e55115101e35c32da750d56fb530d0d7a073254c52632d716cce6c5"
    else
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.6.1/dns-sync-darwin-x64"
      sha256 "6e8feacd91fafd0cb9b6eb2e9274149fe80f1eeec82b3c0af0ec417db4a519de"
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
