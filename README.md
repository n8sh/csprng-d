# Cryptographic Random D Library

* Author: [Jonathan M. Wilbur](https://jonathan.wilbur.space) <[jonathan@wilbur.space](mailto:jonathan@wilbur.space)>
* Copyright Year: 2018
* License: [MIT License](https://mit-license.org/)
* Version: [0.2.0](https://semver.org/)

## What This Library

This is a library for generating cryptographically random numbers. This library
relies upon existing system sources for cryptographic randomness. When compiled
on Windows, it uses the `BCryptGenRandom`, `CryptGenRandom`, or `RtlGenRandom`
system APIs. When compiled on Linux or Mac, it reads random bytes from
`/dev/random`.

## Building and Installing

There are four scripts in `build/scripts` that help you build this library,
in addition to building using `dub`. If you are using Windows, you can build
by running `.\build\scripts\build.ps1` from PowerShell, or `.\build\scripts\build.bat`
from the traditional `cmd` shell. If you are on any POSIX-compliant(-ish)
operating system, such as Linux or Mac OS X, you may build this library using
`./build/scripts/build.sh` or `make -f ./build/scripts/posix.make`. The output
library will be in `./build/libraries`. The command-line tools will be in
`./build/executables`.

For more information on building and installing, see `documentation/install.md`.

## Library Usage

The usage of this library is really straight-forward. Whether you are on Windows,
Mac OS X, or Linux, generating cryptographically-secure random bytes looks like
this:

```d
import csprng.system;
CSPRNG c = new CSPRNG();
writeln(c.getBytes(10)); // Writes ten random bytes to the command line.
```

On the backend, this library handles opening, caching, and closing file
descriptors, and efficiently managing the Windows cryptography API constructs,
so you don't have to!

## Development

- [ ] Development
  - [x] Create `get-cryptobytes` tool.
  - [ ] Support random byte generation through `RDRAND`
  - [ ] Create a better system of exceptions
- [ ] Documentation
  - [x] Create `man` pages for the `get-cryptobytes` tool.
  - [ ] Create `tools.md`
  - [ ] Create `library.md`
- [ ] Testing
  - [ ] Cross-Platform Testing
    - [ ] Windows
    - [x] Mac OS X
    - [ ] Linux
  - [x] Test for uniform distribution of output bytes.
    - [ ] Windows
    - [x] Mac OS X
    - [ ] Linux
  - [x] Test with multiple CSPRNGs.
    - [ ] Windows
    - [x] Mac OS X
    - [ ] Linux
  - [x] Test with concurrent CSPRNGs.
    - [ ] Windows
    - [x] Mac OS X
    - [ ] Linux
  - [ ] CVE Security Review

## Bugs

## See Also

## Contact Me

If you would like to suggest fixes or improvements on this library, please just
[leave an issue on this GitHub page](https://github.com/JonathanWilbur/asn1-d/issues). If you would like to contact me for other reasons,
please email me at [jonathan@wilbur.space](mailto:jonathan@wilbur.space)
([My GPG Key](https://jonathan.wilbur.space/downloads/jonathan@wilbur.space.gpg.pub))
([My TLS Certificate](https://jonathan.wilbur.space/downloads/jonathan@wilbur.space.chain.pem)). :boar: