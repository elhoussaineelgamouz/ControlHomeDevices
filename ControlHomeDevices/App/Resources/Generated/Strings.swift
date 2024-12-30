// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Localizable.strings
  ///   ControlHomeDevices
  /// 
  ///   Created by El houssaine El GAMOUZ on 26/12/2024.
  internal static let controlLampApp = L10n.tr("Localizable", "control_Lamp_app", fallback: "Control Lamp APP")
  /// Log In
  internal static let loginButton = L10n.tr("Localizable", "login_button", fallback: "Log In")
  /// Welcome to MyApp!
  internal static let welcomeMessage = L10n.tr("Localizable", "welcome_message", fallback: "Welcome to MyApp!")
  internal enum Home {
    /// Devices
    internal static let devices = L10n.tr("Localizable", "home.devices", fallback: "Devices")
    /// Rooms
    internal static let rooms = L10n.tr("Localizable", "home.rooms", fallback: "Rooms")
  }
  internal enum Login {
    /// Email
    internal static let email = L10n.tr("Localizable", "login.email", fallback: "Email")
    /// Password
    internal static let password = L10n.tr("Localizable", "login.password", fallback: "Password")
    /// Smart Lamp Control
    internal static let title = L10n.tr("Localizable", "login.title", fallback: "Smart Lamp Control")
    internal enum Button {
      /// Login
      internal static let login = L10n.tr("Localizable", "login.button.login", fallback: "Login")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
