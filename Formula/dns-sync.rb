class DnsSync < Formula
  desc "DNS as code. Sync DNS zones across providers (Cloudflare, GCP Cloud DNS)"
  homepage "https://github.com/cl8dep/dns-sync"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.8.0/dns-sync-darwin-arm64"
      sha256 "11e0876c4869f2f36e9c9474789445fce160adbcaf438016b39780346a938149"
    else
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.8.0/dns-sync-darwin-x64"
      sha256 "65bf11d1d604df39453ba2d6db57ddda8745dfc8134ba7ff187202ac12df26a2"
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
