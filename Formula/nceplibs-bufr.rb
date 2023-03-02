class NceplibsBufr < Formula
  desc "Fortran library, programs, and command line utilites for working with the BUFR format"
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-bufr"
  url "https://github.com/NOAA-EMC/NCEPLIBS-bufr/archive/refs/tags/bufr_v11.7.1.tar.gz"
  sha256 "6533ce6eaa6b02c0cb5424cfbc086ab120ccebac3894980a4daafd4dfadd71f8"
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
