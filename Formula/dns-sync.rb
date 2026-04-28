class DnsSync < Formula
  desc "DNS as code. Sync DNS zones across providers (Cloudflare, GCP Cloud DNS)"
  homepage "https://github.com/cl8dep/dns-sync"
  version "0.6.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.6.6/dns-sync-darwin-arm64"
      sha256 "71c274327a48cf081f700ea2b2c98d41a309a189f04bd689bef31bcbbbc84df7"
    else
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.6.6/dns-sync-darwin-x64"
      sha256 "dd6dfc465791892d327731130a749fe57687981b6d7fd9a17cb536efe51d78b8"
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
