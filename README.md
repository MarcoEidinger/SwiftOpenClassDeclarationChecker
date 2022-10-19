# SwiftOpenClassDeclarationChecker

> "An open class has to have at least one designated initializer that is public or open IF the class as convenience initializers"

https://blog.eidinger.info/subclassing-an-open-swift-class-is-not-always-possible

This Swift package provides command-line tool `socdc` that is able to check for that.

The current directory and its subfolders are checked.

Example: `Example.swift` file in this directory contains `Superclass` which violates the rule above.

```
swift run socdc
```

Output

```
PublicDesignatedInitForOpenClass: Issue detected in Superclass
```