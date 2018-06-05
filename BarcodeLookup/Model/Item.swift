import Foundation

struct Item: Codable {
    let ean, title, description, upc: String
    let brand, model, color, size: String
    let dimension, weight, currency: String
    let lowestRecordedPrice: Double
    let highestRecordedPrice: Int
    let images: [String]
    let offers: [Offer]
    let asin, elid: String
    
    enum CodingKeys: String, CodingKey {
        case ean, title, description, upc, brand, model, color, size, dimension, weight, currency
        case lowestRecordedPrice = "lowest_recorded_price"
        case highestRecordedPrice = "highest_recorded_price"
        case images, offers, asin, elid
    }
}
