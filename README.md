# macro-sample

This package is a minimal reproducible example of the compiler errors caused by https://github.com/apple/swift/pull/70580.

The following code causes an error `error: cannot find 'x' in scope`.

```swift
import MacroSample

switch 0 {
case let x:
    #stringify(x)
}
```

However, the following one is ok.

```swift
import MacroSample

switch 0 {
case let x:
    #stringify(x)
    print(x)
}
```


## How to reproduce the issue

To reproduce the issue, please use swift-DEVELOPMENT-SNAPSHOT-2024-01-03-a or a newer toolchain.

```console
$ swift build
Building for debugging...
/tmp/swift-generated-sources/@__swiftmacro_17MacroSampleClient33_5CBB1E3ABBDA923948F729DA012CA411Ll9stringifyfMf_.swift:1:2: error: cannot find 'x' in scope
(x, "x")
 ^
/home/kebo/macro-sample/Sources/MacroSampleClient/main.swift:5:5: note: in expansion of macro 'stringify' here
    #stringify(x)
    ^~~~~~~~~~~~~
/home/kebo/macro-sample/Sources/MacroSampleClient/main.swift:5:5: warning: expression of type '(Int, String)' is unused
    #stringify(x)
    ^~~~~~~~~~~~~
error: emit-module command failed with exit code 1 (use -v to see invocation)
/tmp/swift-generated-sources/@__swiftmacro_17MacroSampleClient33_5CBB1E3ABBDA923948F729DA012CA411Ll9stringifyfMf_.swift:1:2: error: cannot find 'x' in scope
(x, "x")
 ^
/home/kebo/macro-sample/Sources/MacroSampleClient/main.swift:5:5: note: in expansion of macro 'stringify' here
    #stringify(x)
    ^~~~~~~~~~~~~
/home/kebo/macro-sample/Sources/MacroSampleClient/main.swift:5:5: warning: expression of type '(Int, String)' is unused
    #stringify(x)
    ^~~~~~~~~~~~~
error: fatalError
```
