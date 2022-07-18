class NceplibsBufr < Formula
  desc "Fortran library, programs, and command line utilites for working with the BUFR format"
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-bufr"
  url "https://github.com/NOAA-EMC/NCEPLIBS-bufr/archive/refs/tags/bufr_v11.7.0.tar.gz"
  sha256 "6a76ae8e7682bbc790321bf80c2f9417775c5b01a5c4f10763df92e01b20b9ca"
  license :public_domain

  depends_on "cmake" => :build
  depends_on "gcc" => :build
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
