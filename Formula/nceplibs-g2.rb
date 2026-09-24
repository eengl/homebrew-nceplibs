class NceplibsG2 < Formula
  desc "Fortran library for encoding/decoding GRIB2 messages"
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-g2"
  url "https://github.com/NOAA-EMC/NCEPLIBS-g2/archive/refs/tags/v4.0.0.tar.gz"
  sha256 "9559590b021ac0be462d975dddb92b0a1e368071aa6b13d59ce35dad8a4649fd"
  license :public_domain

  depends_on "cmake" => :build
  depends_on "gcc" => :build
  depends_on "pkg-config" => :build
  depends_on "jasper"
  depends_on "libpng"
  depends_on "nceplibs-bacio"
  depends_on "nceplibs-g2c"

  def install
    args = std_cmake_args + %W[
      -DCMAKE_PREFIX_PATH=#{Formula["nceplibs-bacio"].opt_prefix};#{Formula["nceplibs-g2c"].opt_prefix};#{Formula["jasper"].opt_prefix};#{Formula["libpng"].opt_prefix}
      -DBUILD_TESTING=OFF
    ]

    # Build static libraries
    system "cmake", "-S", ".", "-B", "build_static", *args, "-DBUILD_SHARED_LIBS=OFF"
    system "cmake", "--build", "build_static"
    system "cmake", "--install", "build_static"

    # Build shared libraries
    system "cmake", "-S", ".", "-B", "build_shared", *args, "-DBUILD_SHARED_LIBS=ON"
    system "cmake", "--build", "build_shared"
    system "cmake", "--install", "build_shared"

    # Copy files into prefix/include/include_* so Homebrew creates actual merged directories
    # in /opt/homebrew/include/ rather than exclusive top-level directory symlinks.
    if (prefix/"include_4").exist?
      (include/"include_4").install Dir[prefix/"include_4/*"]
      rm_r prefix/"include_4"
      (prefix/"include_4").make_symlink include/"include_4"
    end

    if (prefix/"include_d").exist?
      (include/"include_d").install Dir[prefix/"include_d/*"]
      rm_r prefix/"include_d"
      (prefix/"include_d").make_symlink include/"include_d"
    end
  end

  test do
    system "false"
  end
end
