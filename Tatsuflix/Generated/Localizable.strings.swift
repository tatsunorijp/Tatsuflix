// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// TatsuFlix
  internal static let title = L10n.tr("Localizable", "Title")

  internal enum EpisodeListView {
    /// Season %@
    internal static func season(_ p1: Any) -> String {
      return L10n.tr("Localizable", "EpisodeListView.Season", String(describing: p1))
    }
    /// Episodes
    internal static let title = L10n.tr("Localizable", "EpisodeListView.Title")
  }

  internal enum EpisodeView {
    /// %@. - %@
    internal static func title(_ p1: Any, _ p2: Any) -> String {
      return L10n.tr("Localizable", "EpisodeView.Title", String(describing: p1), String(describing: p2))
    }
  }

  internal enum GenericError {
    /// Something went wrong
    internal static let body = L10n.tr("Localizable", "GenericError.Body")
    /// OK
    internal static let ok = L10n.tr("Localizable", "GenericError.OK")
    /// Oops...
    internal static let title = L10n.tr("Localizable", "GenericError.Title")
  }

  internal enum SearchSeries {
    /// Search Series
    internal static let searchPlaceholder = L10n.tr("Localizable", "SearchSeries.SearchPlaceholder")
    /// Search
    internal static let title = L10n.tr("Localizable", "SearchSeries.Title")
  }

  internal enum SerieDetails {
    /// Episodes
    internal static let episodes = L10n.tr("Localizable", "SerieDetails.Episodes")
    /// Exchibition Time: %@
    internal static func exhibitionTime(_ p1: Any) -> String {
      return L10n.tr("Localizable", "SerieDetails.ExhibitionTime", String(describing: p1))
    }
    /// Genres
    internal static let genres = L10n.tr("Localizable", "SerieDetails.Genres")
    /// Release Days
    internal static let releaseDays = L10n.tr("Localizable", "SerieDetails.ReleaseDays")
    /// Details
    internal static let title = L10n.tr("Localizable", "SerieDetails.Title")
  }

  internal enum SerieView {
    /// Stars - %@
    internal static func stars(_ p1: Any) -> String {
      return L10n.tr("Localizable", "SerieView.Stars", String(describing: p1))
    }
    /// Status - %@
    internal static func status(_ p1: Any) -> String {
      return L10n.tr("Localizable", "SerieView.Status", String(describing: p1))
    }
  }

  internal enum Settings {
    /// Authentication
    internal static let authentication = L10n.tr("Localizable", "Settings.Authentication")
    /// Created by
    internal static let createdBy = L10n.tr("Localizable", "Settings.CreatedBy")
    /// Wellington Tatsunori Asahide
    internal static let me = L10n.tr("Localizable", "Settings.Me")
    /// TatsuFlix
    internal static let tatsuflix = L10n.tr("Localizable", "Settings.Tatsuflix")
    /// Settings
    internal static let title = L10n.tr("Localizable", "Settings.Title")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
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
