class DnsSync < Formula
  desc "DNS as code. Sync DNS zones across providers (Cloudflare, GCP Cloud DNS)"
  homepage "https://github.com/cl8dep/dns-sync"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cl8dep/dns-sync/releases/download/v#{version}/dns-sync-darwin-arm64"
      sha256 "954e34a08a5b83046f5ea39ade7fc9185447f706072feb4059b15beeafb69dd1"
    else
      url "https://github.com/cl8dep/dns-sync/releases/download/v#{version}/dns-sync-darwin-x64"
      sha256 "9d64877a45d5099d8bb3bf88204eeed0187467dfa33fd3d26eebeeab0c9432d2"
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
