class Aln < Formula
  desc "Amazing Lucky Numbers Library"
  homepage "https://github.com/webispy/aln"
  url "https://github.com/webispy/aln/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "e1ca51e3153b0b7824b36417c0acd5f4057028992ef1af0cde753408cd21a276"
  license "Apache-2.0"

  head "https://github.com/webispy/aln.git", branch: "master"

  bottle do
    root_url "https://github.com/webispy/homebrew-aln/releases/download/aln-0.1.0"
    sha256 cellar: :any, arm64_sonoma: "a7f35e8d97f0181b7e689193ce724a74ebb808b7a82c1981571a212ad51b9c51"
    sha256 cellar: :any, ventura:      "820cb671adf921665481cbedfba52e6a2bf0fc7abf96e34ceecec45556fafea6"
    sha256 cellar: :any, monterey:     "c16fd2d7a9caa6ccc3fac7d5f980613467602a8067f6c8a05f8b36ced37fb7bc"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "glib"

  def install
    args = %W[
      -DCMAKE_INSTALL_RPATH=#{rpath}
    ]

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "#{bin}/aln"
  end
end
