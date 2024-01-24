class NceplibsW3emc < Formula
  desc "This library contains Fortran 90 decoder/encoder routines for GRIB Edition 1."
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-w3emc"
  url "https://github.com/NOAA-EMC/NCEPLIBS-w3emc/archive/refs/tags/v2.11.0.tar.gz"
  sha256 "53a03d03421c5da699b026ca220512ed494a531b83284693f66d2579d570c43b"
  license :public_domain

  depends_on "cmake" => :build
  depends_on "gcc" => :build
  depends_on "pkg-config" => :build
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
