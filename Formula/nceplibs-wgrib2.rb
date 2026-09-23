class NceplibsWgrib2 < Formula
  desc "NCEP utility for interacting with, reading, writing, and manipulating GRIB2 files"
  homepage "https://github.com/NOAA-EMC/wgrib2"
  url "https://github.com/NOAA-EMC/wgrib2/archive/refs/tags/v3.7.0.tar.gz"
  sha256 "b741a07710a8195c99a7d50de05bde90182ab4334f5c4a0d6d057c4e20cc6a75"
  license :public_domain

  depends_on "cmake" => :build
  depends_on "gcc"
  depends_on "libaec"
  depends_on "nceplibs-ip"
  depends_on "netcdf"
  depends_on "openblas"

  def install
    gcc_formula = Formula["gcc"]

    gcc_bin = Dir["#{gcc_formula.opt_bin}/gcc-[0-9]*"]
                .select { |f| File.basename(f) =~ /\Agcc-\d+\z/ }
                .max
    gfortran_bin = Dir["#{gcc_formula.opt_bin}/gfortran-[0-9]*"]
                     .select { |f| File.basename(f) =~ /\Agfortran-\d+\z/ }
                     .max

    ENV["CC"] = gcc_bin
    ENV["FC"] = gfortran_bin

    args = std_cmake_args + [
      "-DCMAKE_PREFIX_PATH=#{Formula["nceplibs-ip"].opt_prefix};#{Formula["openblas"].opt_prefix}",
      "-DUSE_AEC=ON",
      "-DUSE_IPOLATES=ON",
      "-DUSE_NETCDF=ON",
      "-DUSE_OPENMP=ON",
      "-DBUILD_LIB=OFF",
      "-DBUILD_SHARED_LIB=OFF",
      "-DBUILD_WGRIB=ON",
    ]

    system "cmake", "-S", ".", "-B", "build", *args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "#{bin}/wgrib2", "--help"
    system "#{bin}/wgrib", "--help"
  end
end
