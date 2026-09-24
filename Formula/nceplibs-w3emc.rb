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
      -DCMAKE_INSTALL_INCLUDEDIR=include
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

    # If w3emc created top-level include_4/include_d dirs outside of include/, 
    # move them into include/ so that Homebrew links them as subdirectories.
    if (prefix/"include_4").exist?
      mkdir_p include/"include_4"
      cp_r Dir[prefix/"include_4/*"], include/"include_4/"
      rm_r prefix/"include_4"
      (prefix/"include_4").make_symlink include/"include_4"
    end

    if (prefix/"include_d").exist?
      mkdir_p include/"include_d"
      cp_r Dir[prefix/"include_d/*"], include/"include_d/"
      rm_r prefix/"include_d"
      (prefix/"include_d").make_symlink include/"include_d"
    end

    if (prefix/"include_8").exist?
      mkdir_p include/"include_8"
      cp_r Dir[prefix/"include_8/*"], include/"include_8/"
      rm_r prefix/"include_8"
      (prefix/"include_8").make_symlink include/"include_8"
    end
  end

  test do
    system "false"
  end
end
