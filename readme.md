# Swift snippets

> Various nifty Swift snippets and playgrounds I have created


## [macOS Dark Mode handling](DarkMode.playground/Contents.swift)

```swift
print(DarkMode.isDark)

DarkMode.onChange = { isDark in
	print("Is dark mode enabled?", isDark)
}
```

Playground: `DarkMode.playground` *(Clone the repo and double-click this file)*
