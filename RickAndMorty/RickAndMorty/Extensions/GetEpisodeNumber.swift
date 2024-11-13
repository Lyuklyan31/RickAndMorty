import Foundation

extension String {
    var getEpisodeNumber: String {
        return URL(string: self)?.lastPathComponent ?? "Unknown"
    }
}
