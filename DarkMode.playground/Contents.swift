import Cocoa
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


/// Check or get notified about macOS Dark Mode status
public final class DarkMode {
	private static let notificationName = NSNotification.Name("AppleInterfaceThemeChangedNotification")

	static var onChange: ((Bool) -> Void)? {
		didSet {
			if onChange == nil {
				DistributedNotificationCenter.default().removeObserver(self, name: notificationName, object: nil)
			} else {
				DistributedNotificationCenter.default().addObserver(self, selector: #selector(selectorHandler), name: notificationName, object: nil)
			}
		}
	}

	static var isDark: Bool {
		return UserDefaults.standard.string(forKey: "AppleInterfaceStyle") == "Dark"
	}

	static var blackColor: NSColor {
		return isDark ? .white : .black
	}

	@objc
	private static func selectorHandler() {
		onChange?(isDark)
	}
}

DarkMode.isDark

DarkMode.onChange = { isDark in
	print("Is dark mode enabled?", isDark)
}
