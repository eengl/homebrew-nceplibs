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

    # Move headers into prefix/include/include_* so Homebrew creates shared merged directories 
    # inside /opt/homebrew/include/, and symlink prefix/include_* back to prefix/include/include_*
    # so w3emc-targets.cmake validations pass.
    %w[include_4 include_8 include_d].each do |inc_dir|
      next unless (prefix/inc_dir).exist?

      (include/inc_dir).mkpath
      (include/inc_dir).install Dir[prefix/"#{inc_dir}/*"]
      rm_r(prefix/inc_dir)
      (prefix/inc_dir).make_symlink(include/inc_dir)
    end
  end

  test do
    system "false"
  end
end
