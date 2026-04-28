class DnsSync < Formula
  desc "DNS as code. Sync DNS zones across providers (Cloudflare, GCP Cloud DNS)"
  homepage "https://github.com/cl8dep/dns-sync"
  version "0.6.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.6.5/dns-sync-darwin-arm64"
      sha256 "816afd2742c473009dbe54e8713dc9d9ae3b61ff50a213afdc5397702844183c"
    else
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.6.5/dns-sync-darwin-x64"
      sha256 "f8c9626624a09f2273d3d1e0e9177eeefd5be90761a1fc8f7789f30c8021d4b0"
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
