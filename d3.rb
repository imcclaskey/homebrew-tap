class D3 < Formula
  desc "D3 - a tool for software development workflows"
  homepage "https://github.com/imcclaskey/d3"
  
  # Use the version from the constant in version.go
  # The version here should match the constant in internal/version/version.go
  version "0.2.0"
  
  # Alternatively, you would need to update this version manually when releasing
  # The best practice is to keep this in sync with the Go code
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/imcclaskey/d3/releases/download/v#{version}/d3-darwin-arm64"
      sha256 "d728d2f406639ca36274d76b801f17c7c6f7b7f785b75f9723cf4189d77c379f" # darwin-arm64
    else
      url "https://github.com/imcclaskey/d3/releases/download/v#{version}/d3-darwin-amd64"
      sha256 "0d626ba5b018d5c962bdcf41d1e2623d168fba313d5965278a00b34bc768bd23" # darwin-amd64
    end
  end
  
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/imcclaskey/d3/releases/download/v#{version}/d3-linux-arm64"
      sha256 "4a8f8d171b2b9a4e77ca09e54bdae3da30f559cac8f85a9ca0e6fa4075b3af14" # linux-arm64
    else
      url "https://github.com/imcclaskey/d3/releases/download/v#{version}/d3-linux-amd64"
      sha256 "9da8aafc7161457e10089b06fe2e04b190a6aa195dfd361844c94a93250c2e2d" # linux-amd64
    end
  end
  
  def install
    bin.install Dir["d3*"].first => "d3"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/d3 --version")
  end
end 