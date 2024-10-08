class Esh < Formula
  desc "Templating engine for evaluating shell commands embedded in arbitrary templates"
  homepage "https://github.com/jirutka/esh"
  url "https://github.com/jirutka/esh/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "4103b8901c7346f5dd608f2aa272d23c259434f825e6f39b2fb642157d6a2a7c"
  license "MIT"
  head "https://github.com/jirutka/esh", branch: "master"

  depends_on "asciidoctor"

  def install
    system "make", "install", "prefix=#{prefix}"
  end

  test do
    (testpath/"template").write <<~EOS
      <%= $(echo Hello esh!) %>
    EOS
    template = shell_output("#{bin}/esh template")
    assert_match "Hello esh!", template
  end
end
