import Foundation

extension String {
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        if let date = formatter.date(from: self) {
            formatter.dateFormat = "dd MMMM yyyy"
            return formatter.string(from: date)
        }
        
        return "Invalid date"
    }
}
