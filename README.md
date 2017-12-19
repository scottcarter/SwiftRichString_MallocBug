# SwiftRichString_MallocBug
Illustrates a bug (crash) with the Pod SwiftRichString version 1.0.1 in a macOS project.

I have discovered a bug using [SwiftRichString](https://github.com/malcommac/SwiftRichString)  under the following situation:

* Release Configuration
* Project compiled with Swift 3.2
* SwiftRichString compiled with Swift 4.0

The scheme has Address Sanitizer enabled which I found will reliably reproduce the bug.  The crash includes the signature: 
"ERROR: AddressSanitizer: heap-buffer-overflow on address"

Without using the Address Sanitizer, it could take several attempts to reproduce the bug.   In this case, an example signature is:
"malloc: *** error for object 0x618000161440: Invalid pointer dequeued from free list
*** set a breakpoint in malloc_error_break to debug"

The bug is seen with a macOS project, though it is likely also present in iOS.


**Podfile**

The Podfile includes code that allows one to choose how specific pods are compiled.
See the assignment for swift_32 ahd swift4, which are currently setup to compile SwiftRichString with Swift 4.0.

**Environment**

* macOS Sierra version 10.12.6
* Xcode version 9.2




