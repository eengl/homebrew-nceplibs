class NceplibsIp < Formula
  desc "NCEP General Interpolation Fortran Library"
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-ip"
  url "https://github.com/NOAA-EMC/NCEPLIBS-ip/archive/refs/tags/v4.4.0.tar.gz"
  sha256 "858d9201ce0bc4d16b83581ef94a4a0262f498ed1ea1b0535de2e575da7a8b8c"
  license :public_domain

  depends_on "cmake" => :build
  depends_on "gcc" => :build
  depends_on "pkg-config" => :build
  depends_on "nceplibs-sp"

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
