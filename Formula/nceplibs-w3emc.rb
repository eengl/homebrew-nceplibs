class NceplibsW3emc < Formula
  desc "This library contains Fortran 90 decoder/encoder routines for GRIB Edition 1."
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-w3emc"
  url "https://github.com/NOAA-EMC/NCEPLIBS-w3emc/archive/refs/tags/v2.9.2.tar.gz"
  sha256 "eace811a1365f69b85fdf2bcd93a9d963ba72de5a7111e6fa7c0e6578b69bfbc"
  license :public_domain

  depends_on "cmake" => :build
  depends_on "gcc" => :build
  depends_on "nceplibs-bacio"
  
  def install
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "-DCMAKE_PREFIX_PATH=#{prefix}", "."
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
