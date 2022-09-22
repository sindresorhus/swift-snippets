import Cocoa
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


/**
Check or get notified about macOS Dark Mode status.
*/
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

	static var isEnabled: Bool {
		UserDefaults.standard.string(forKey: "AppleInterfaceStyle") == "Dark"
	}

	static var blackColor: NSColor {
		isEnabled ? .white : .black
	}

	@objc
	private static func selectorHandler() {
		onChange?(isEnabled)
	}
}

DarkMode.isEnabled

DarkMode.onChange = { isEnabled in
	print("Is dark mode enabled?", isEnabled)
}
