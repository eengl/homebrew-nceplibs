class NceplibsG2 < Formula
  desc "Fortran library for encoding/decoding GRIB2 messages."
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-g2"
  url "https://github.com/NOAA-EMC/NCEPLIBS-g2/archive/refs/tags/v3.4.8.tar.gz"
  sha256 "071a6f799c4c4fdfd5d0478152a0cbb9d668d12d71c78d5bda71845fc5580a7f"
  license :public_domain

  depends_on "cmake" => :build
  depends_on "gcc" => :build
  depends_on "pkg-config" => :build
  depends_on "jasper"
  depends_on "libpng"
  depends_on "nceplibs-bacio"

  def install
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}", ".", "-DCMAKE_PREFIX_PATH=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
