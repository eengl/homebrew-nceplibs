class NceplibsIp < Formula
  desc "NCEP General Interpolation Fortran Library"
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-ip"
  url "https://github.com/NOAA-EMC/NCEPLIBS-ip/archive/refs/tags/v5.0.0.tar.gz"
  sha256 "54b2987bd4f94adc1f7595d2a384e646019c22d163bcd30840a916a6abd7df71"
  license :public_domain

  depends_on "cmake" => :build
  depends_on "gcc" => :build
  depends_on "pkg-config" => :build

  def install
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "-DCMAKE_PREFIX_PATH=#{prefix}", "-DBUILD_TESTING=OFF", "-DOPENMP=ON", "."
    system "make"
    system "make", "install"
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "-DCMAKE_PREFIX_PATH=#{prefix}", "-DBUILD_TESTING=OFF", "-DOPENMP=ON", "-DBUILD_SHARED_LIBS=ON", "."
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
