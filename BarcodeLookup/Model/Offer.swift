import Foundation

struct Offer: Codable {
    let merchant, domain, title, currency: String
    let listPrice: ListPrice
    let price: Double
    let shipping, condition, availability, link: String
    let updatedT: Int
    
    enum CodingKeys: String, CodingKey {
        case merchant, domain, title, currency
        case listPrice = "list_price"
        case price, shipping, condition, availability, link
        case updatedT = "updated_t"
    }
}

enum ListPrice: Codable {
    case integer(Int)
    case string(String)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(ListPrice.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ListPrice"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}
