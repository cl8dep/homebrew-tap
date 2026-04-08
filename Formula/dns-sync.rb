class DnsSync < Formula
  desc "DNS as code. Sync DNS zones across providers (Cloudflare, GCP Cloud DNS)"
  homepage "https://github.com/cl8dep/dns-sync"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.3.0/dns-sync-darwin-arm64"
      sha256 "bcb62f355c10851468798a42305277ee30c962eb4e5dbbd41e27bc2cbf12a962"
    else
      url "https://github.com/cl8dep/dns-sync/releases/download/v0.3.0/dns-sync-darwin-x64"
      sha256 "52c6c66eac5ebd3943ec2ea3868cc8f22c9744f3d4494471ee1558b688c450a0"
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
