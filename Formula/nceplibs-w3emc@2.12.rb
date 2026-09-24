class NceplibsW3emc < Formula
  desc "Fortran 90 decoder/encoder routines for GRIB Edition 1"
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-w3emc"
  url "https://github.com/NOAA-EMC/NCEPLIBS-w3emc/archive/refs/tags/v2.12.0.tar.gz"
  sha256 "77c0732541ade1deb381f5a208547ccc36e65efa91c8f7021b299b20a6ae0d27"
  license :public_domain

  depends_on "cmake" => :build
  depends_on "gcc" => :build
  depends_on "pkg-config" => :build
  depends_on "nceplibs-bacio"

  def install
    args = std_cmake_args + %W[
      -DCMAKE_PREFIX_PATH=#{Formula["nceplibs-bacio"].opt_prefix}
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
    if (prefix/"include_4").exist?
      (include/"include_4").install Dir[prefix/"include_4/*"]
      rm_r prefix/"include_4"
      (prefix/"include_4").make_symlink include/"include_4"
    end

    if (prefix/"include_8").exist?
      (include/"include_8").install Dir[prefix/"include_8/*"]
      rm_r prefix/"include_8"
      (prefix/"include_8").make_symlink include/"include_8"
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
