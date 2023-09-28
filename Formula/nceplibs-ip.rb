class NceplibsIp < Formula
  desc "NCEP General Interpolation Fortran Library"
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-ip"
  url "https://github.com/NOAA-EMC/NCEPLIBS-ip/archive/refs/tags/v4.3.0.tar.gz"
  sha256 "799308a868dea889d2527d96a0405af7b376869581410fe4cff681205e9212b4"
  license :public_domain

  depends_on "cmake" => :build
  depends_on "gcc" => :build
  depends_on "pkg-config" => :build
  depends_on "nceplibs-sp"

  def install
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "-DCMAKE_PREFIX_PATH=#{prefix}", "-DOPENMP=ON", "."
    system "make"
    system "make", "install"
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "-DCMAKE_PREFIX_PATH=#{prefix}", "-DOPENMP=ON", "-DBUILD_SHARED_LIBS=ON", "."
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
