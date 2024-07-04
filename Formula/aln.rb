class Aln < Formula
  desc "Amazing Lucky Numbers Library"
  homepage "https://github.com/webispy/aln"
  url "https://github.com/webispy/aln/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "97ccb1e361c4c27ffd3a08faefb6d177592d380b3d02d542f435568aaa681030"
  license "Apache-2.0"

  head "https://github.com/webispy/aln.git", branch: "master"

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
