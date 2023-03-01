class NceplibsBacio < Formula
  desc "This library performs binary I/O for the NCEP models."
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-bacio"
  url "https://github.com/NOAA-EMC/NCEPLIBS-bacio/archive/refs/tags/v2.6.0.tar.gz"
  sha256 "03fef581e1bd3710fb8d2f2659a6c3e01a0437c1350ba53958d2ff1ffef47bcb"
  license :public_domain

  depends_on "cmake" => :build
  depends_on "gcc" => :build

  def install
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "."
    system "make"
    system "make", "install"
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}", ".", "-DBUILD_SHARED_LIBS=ON"
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
