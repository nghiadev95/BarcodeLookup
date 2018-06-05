import Foundation

struct Upc: Codable {
    let code: String
    let total, offset: Int
    let items: [Item]
}
