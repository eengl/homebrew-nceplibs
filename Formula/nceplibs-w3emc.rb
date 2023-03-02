class NceplibsW3emc < Formula
  desc "This library contains Fortran 90 decoder/encoder routines for GRIB Edition 1."
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-w3emc"
  url "https://github.com/NOAA-EMC/NCEPLIBS-w3emc/archive/refs/tags/v2.9.3.tar.gz"
  sha256 "9ca1b08dd13dfbad4a955257ae0cf38d2e300ccd8d983606212bc982370a29bc"
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
