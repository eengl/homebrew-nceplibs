class NceplibsG2c < Formula
  desc "This library contains C decoder/encoder routines for GRIB edition 2."
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-g2c"
  url "https://github.com/NOAA-EMC/NCEPLIBS-g2c/archive/refs/tags/v1.8.0.tar.gz"
  sha256 "4ce9f5a7cb0950699fe08ebc5a463ab4d09ef550c050391a319308a2494f971f"
  license :public_domain
  
  depends_on "cmake" => :build
  depends_on "gcc" => :build
  depends_on "pkg-config" => :build
  depends_on "jasper"
  depends_on "libaec"
  depends_on "libpng"
  depends_on "zlib"

  def install
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}", ".", "-DUSE_AEC=ON", "-DUSE_PNG=ON", "-DUSE_Jasper=ON", "-DBUILD_SHARED_LIBS=OFF", "-DCMAKE_PREFIX_PATH=#{prefix}"
    system "make"
    system "make", "install"
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}", ".", "-DUSE_AEC=ON", "-DUSE_PNG=ON", "-DUSE_Jasper=ON", "-DBUILD_SHARED_LIBS=ON", "-DCMAKE_PREFIX_PATH=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
