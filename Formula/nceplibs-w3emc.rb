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

    # Symlink precision-specific include directories into prefix/include
    # so Homebrew exposes them while keeping CMake export target paths happy
    if (prefix/"include_4").exist?
      include.install_symlink prefix/"include_4" => "include_4"
    end
    if (prefix/"include_8").exist?
      include.install_symlink prefix/"include_8" => "include_8"
    end
    if (prefix/"include_d").exist?
      include.install_symlink prefix/"include_d" => "include_d"
    end
  end

  test do
    system "false"
  end
end
