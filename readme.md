# Swift snippets

> Various nifty Swift snippets and playgrounds I have created

## [macOS Dark Mode handling](DarkMode.playground/Contents.swift)

```swift
print(DarkMode.isEnabled)

DarkMode.onChange = { isEnabled in
	print("Is dark mode enabled?", isEnabled)
}
```

Playground: `DarkMode.playground` *(Clone the repo and double-click this file)*
