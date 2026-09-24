class NceplibsBufr < Formula
  desc "Fortran library, programs, and command line utilites for working with the BUFR format"
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-bufr"
  url "https://github.com/NOAA-EMC/NCEPLIBS-bufr/archive/refs/tags/v12.2.0.tar.gz"
  sha256 "a0dad13b905f3e0311e2b50df47418660b47442dfc3843232712044b47f26a71"
  license :public_domain

  depends_on "cmake" => :build
  depends_on "gcc" => :build
  depends_on "pkg-config" => :build
  depends_on "python3"

  def install
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}", 
                    "-DMASTER_TABLE_DIR=#{prefix}/share/bufr",
                    "-DENABLE_PYTHON=ON", "."
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
