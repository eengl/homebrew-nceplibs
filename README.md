# homebrew-nceplibs
[Homebrew](https://brew.sh) Tap for the NOAA/NCEP/EMC [NCEPLIBS](https://github.com/NOAA-EMC/NCEPLIBS) suite of libraries.

Currently supported libraries *(as of 6/6/2025)*:
* [bacio](https://github.com/NOAA-EMC/NCEPLIBS-bacio)
* [bufr](https://github.com/NOAA-EMC/NCEPLIBS-bufr)
* [g2](https://github.com/NOAA-EMC/NCEPLIBS-g2)
* [g2c](https://github.com/NOAA-EMC/NCEPLIBS-g2c)
* [ip](https://github.com/NOAA-EMC/NCEPLIBS-ip)
* [sp](https://github.com/NOAA-EMC/NCEPLIBS-sp) - This library is deprecated -- use NCEPLIBS-ip 5.0.0+
* [w3emc](https://github.com/NOAA-EMC/NCEPLIBS-w3emc)
* [wgrib2](https://github.com/NOAA-EMC/NCEPLIBS-wgrib2) - Provdes wgrib2 and wgrib1 (does not build wgrib2 API libraries)

# Install into Homebrew
```
brew tap eengl/nceplibs
```
The above command uses shortened syntax since the tap is hosted on GitHub and the repository name is prefixed with "homebrew-".  See Homebrew Tap [documentation](https://docs.brew.sh/Taps) for full syntax.

Each component of NCEPLIBS can be installed with the following command structure:
```
brew install nceplibs-<NAME>
```
where `<NAME>` is one of the above listed libraries.
