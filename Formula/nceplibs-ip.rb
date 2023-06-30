class NceplibsIp < Formula
  desc "NCEP General Interpolation Fortran Library"
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-ip"
  url "https://github.com/NOAA-EMC/NCEPLIBS-ip/archive/refs/tags/v4.1.0.tar.gz"
  sha256 "b83ca037d9a5ad3eb0fb1acfe665c38b51e01f6bd73ce9fb8bb2a14f5f63cdbe"
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
    system "mkdir", "#{HOMEBREW_PREFIX}/include_4"
    system "ln", "-s", "#{prefix}/include_4/*", "#{HOMEBREW_PREFIX}/include_4/."
    system "mkdir", "#{HOMEBREW_PREFIX}/include_8"
    system "ln", "-s", "#{prefix}/include_8/*", "#{HOMEBREW_PREFIX}/include_8/."
  end

  test do
    system "false"
  end
end
