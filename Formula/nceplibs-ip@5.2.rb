class NceplibsIp < Formula
  desc "NCEP General Interpolation Fortran Library"
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-ip"
  url "https://github.com/NOAA-EMC/NCEPLIBS-ip/archive/refs/tags/v5.2.0.tar.gz"
  sha256 "2f7b44abcf24e448855f57d107db55d3d58cbc271164ba083491d0c07a7ea3d0"
  license :public_domain

  depends_on "cmake" => :build
  depends_on "gcc" => :build
  depends_on "pkg-config" => :build
  depends_on "openblas"

  def install
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "-DCMAKE_PREFIX_PATH=#{prefix}", "-DBUILD_TESTING=OFF", "-DOPENMP=ON", "-DBLA_VENDOR=OpenBLAS", "."
    system "make"
    system "make", "install"
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "-DCMAKE_PREFIX_PATH=#{prefix}", "-DBUILD_TESTING=OFF", "-DOPENMP=ON", "-DBLA_VENDOR=OpenBLAS", "-DBUILD_SHARED_LIBS=ON", "."
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
