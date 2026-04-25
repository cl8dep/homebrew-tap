class DnsSync < Formula
  desc "DNS as code. Sync DNS zones across providers (Cloudflare, GCP Cloud DNS)"
  homepage "https://github.com/cl8dep/dns-sync"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.6.1/dns-sync-darwin-arm64"
      sha256 "2338ccbffe23130ef5c6cf5b78019c66ba66e9461884493771aa89395fd408a7"
    else
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.6.1/dns-sync-darwin-x64"
      sha256 "7210468bd07e4fe8c6201867f5fc7a84cbfa11ac318425ff97508478dd9c5017"
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
