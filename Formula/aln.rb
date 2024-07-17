class Aln < Formula
  desc "Amazing Lucky Numbers Library"
  homepage "https://github.com/webispy/aln"
  url "https://github.com/webispy/aln/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "e1ca51e3153b0b7824b36417c0acd5f4057028992ef1af0cde753408cd21a276"
  license "Apache-2.0"

  head "https://github.com/webispy/aln.git", branch: "master"

  bottle do
    root_url "https://github.com/webispy/homebrew-aln/releases/download/aln-0.1.1"
    sha256 cellar: :any, arm64_sonoma: "8409d4618bae43c9ccd97889d16daacee1f2ab3b767b35afbbdf2e353c988094"
    sha256 cellar: :any, ventura:      "16fbe744f0b1d481d7d65f758251e06ff763aaf8e3c09797e02ed657b0a9a767"
    sha256 cellar: :any, monterey:     "a161fc7d7a7a4b8b7eabb5a996393c590e4f5d5ca35440578b49f78897b0692e"
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
