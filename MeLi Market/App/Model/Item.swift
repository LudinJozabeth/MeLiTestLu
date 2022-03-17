//
//  Item.swift
//  MeLiApp
//
//  Created by Ludin Jozabeth on 12-03-22.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let searchItem = try SearchItem(json)

import Foundation

// MARK: - SearchItem
struct SearchItem: Codable {
    var siteID: String?
    var countryDefaultTimeZone, query: String?
    var paging: Paging?
    var results: [Result]?
    var sort: Sort?
    var availableSorts: [Sort]?
    var filters: [Filter]?
    var availableFilters: [AvailableFilter]?
    
    enum CodingKeys: String, CodingKey {
        case siteID
        case countryDefaultTimeZone
        case query
        case results
        case sort
        case availableSorts
        case filters
        case availableFilters
    }
}

// MARK: - AvailableFilter
struct AvailableFilter: Codable {
    var id, name, type: String?
    var values: [AvailableFilterValue]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case type
        case values
    }
}

// MARK: - AvailableFilterValue
struct AvailableFilterValue: Codable {
    var id, name: String?
    var results: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case results
    }
}

// MARK: - Sort
struct Sort: Codable {
    var id: String?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}

// MARK: - Filter
struct Filter: Codable {
    var id, name, type: String?
    var values: [FilterValue]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case type
        case values
    }
}

// MARK: - FilterValue
struct FilterValue: Codable {
    var id, name: String?
    var pathFromRoot: [Sort]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case pathFromRoot
    }
}

// MARK: - Paging
struct Paging: Codable {
    var total, primaryResults, offset, limit: Int?
    
    enum CodingKeys: String, CodingKey {
        case total
        case primaryResults
        case offset
        case limit
    }
}

// MARK: - Result
struct Result: Codable {
    var id: String?
    var siteID: String?
    var title: String?
    var seller: Seller?
    var price: Double?
    var prices: Prices?
    var salePrice: String?
    var currencyID: String?
    var availableQuantity, soldQuantity: Int?
    var buyingMode: String?
    var listingTypeID: String?
    var stopTime: String?
    var condition: String?
    var permalink: String?
    var thumbnail: String?
    var thumbnailID: String?
    var acceptsMercadopago: Bool?
    var installments: Installments?
    var address: Address?
    var shipping: Shipping?
    var sellerAddress: SellerAddress?
    var attributes: [Attributes]?
    var originalPrice: Int?
    var categoryID: String?
    var officialStoreID: String?
    var domainID: String?
    var catalogProductID: String?
    var tags: [String]?
    var catalogListing, useThumbnailID: Bool?
    var offerScore, offerShare, matchScore, winnerItemID: String?
    var melicoin: String?
    var orderBackend: Int?
    var differentialPricing: DifferentialPricing?
    
    enum CodingKeys: String, CodingKey {
        case id
        case siteID
        case title
        case seller
        case price
        case prices
        case salePrice
        case currencyID
        case availableQuantity
        case soldQuantity
        case buyingMode
        case listingTypeID
        case stopTime
        case condition
        case permalink
        case thumbnail
        case thumbnailID
        case acceptsMercadopago
        case installments
        case address
        case shipping
        case sellerAddress
        case attributes
        case originalPrice
        case categoryID
        case officialStoreID
        case domainID
        case catalogProductID
        case tags
        case catalogListing
        case useThumbnailID
        case offerScore
        case offerShare
        case matchScore
        case winnerItemID
        case melicoin
        case orderBackend
        case differentialPricing
    }
}

// MARK: - Address
struct Address: Codable {
    var stateID, stateName: String?
    var cityID: String?
    var cityName: String?
    
    enum CodingKeys: String, CodingKey {
        case stateID
        case stateName
        case cityID
        case cityName
    }
}

// MARK: - Attribute
struct Attributes: Codable {
    var id: String?
    var valueID: String?
    var valueName: String?
    var attributeGroupID: String?
    var attributeGroupName: String?
    var source: Int?
    var name: String?
    var valueStruct: ValueStruct?
    var values: [AttributeValue]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case valueID
        case valueName
        case attributeGroupID
        case attributeGroupName
        case source
        case name
        case valueStruct
        case values
    }
}

// MARK: - Struct
struct ValueStruct: Codable {
    var number: Double?
    var unit: String?
    
    enum CodingKeys: String, CodingKey {
        case number
        case unit
    }
}

// MARK: - AttributeValue
struct AttributeValue: Codable {
    var valueStruct: ValueStruct?
    var source: Int?
    var id: String?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case valueStruct
        case source
        case id
        case name
    }
}

// MARK: - DifferentialPricing
struct DifferentialPricing: Codable {
    var id: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
    }
}

// MARK: - Installments
struct Installments: Codable {
    var quantity: Int?
    var amount, rate: Double?
    var currencyID: String?
    
    enum CodingKeys: String, CodingKey {
        case quantity
        case amount
        case rate
        case currencyID
    }
}

// MARK: - Prices
struct Prices: Codable {
    var id: String?
    var prices: [Price]?
    var presentation: Presentation?
    var paymentMethodPrices: [String?]?
    var referencePrices: [Price]?
    var purchaseDiscounts: [String?]?
}

// MARK: - Presentation
struct Presentation: Codable {
    var displayCurrency: String?
}

// MARK: - Price
struct Price: Codable {
    var id: String?
    var type: String?
    var amount: Double?
    var regularAmount: Int?
    var currencyID: String?
    var lastUpdated: Date?
    var conditions: Conditions?
    var exchangeRateContext: String?
    var metadata: Metadata?
    var tags: [String?]?
}

// MARK: - Conditions
struct Conditions: Codable {
    var contextRestrictions: [String]?
    var startTime, endTime: Date?
    var eligible: Bool?
}

// MARK: - Metadata
struct Metadata: Codable {
    var promotionID, promotionType, campaignID: String?
    var discountMeliAmount: Int?
    var campaignDiscountPercentage: Double?
    var campaignEndDate: Date?
    var orderItemPrice: Int?
}

// MARK: - Seller
struct Seller: Codable {
    var id: Int?
    var permalink: String?
    var registrationDate: String?
    var carDealer, realEstateAgency: Bool?
    var tags: [String]?
    var eshop: Eshop?
    var sellerReputation: SellerReputation?
}

// MARK: - Eshop
struct Eshop: Codable {
    var seller: Int?
    var eshopRubro: String?
    var eshopID: Int?
    var nickName: String?
    var siteID: String?
    var eshopLogoURL: String?
    var eshopStatusID, eshopExperience: Int?
    var eshopLocations: [String]?
}

// MARK: - SellerReputation
struct SellerReputation: Codable {
    var powerSellerStatus: String?
    var levelID: String?
    var metrics: Metrics?
    var transactions: Transactions?
    var realLevel, protectionEndDate: String?
}

// MARK: - Metrics
struct Metrics: Codable {
    var cancellations, claims, delayedHandlingTime: Cancellations?
    var sales: Sales?
}

// MARK: - Cancellations
struct Cancellations: Codable {
    var period: String?
    var rate: Double?
    var value: Int?
    var excluded: Excluded?
}

// MARK: - Excluded
struct Excluded: Codable {
    var realValue: Int?
    var realRate: Double?
}

// MARK: - Sales
struct Sales: Codable {
    var period: String?
    var completed: Int?
}

// MARK: - Transactions
struct Transactions: Codable {
    var canceled: Int?
    var period: String?
    var total: Int?
    var ratings: Ratings?
    var completed: Int?
}

// MARK: - Ratings
struct Ratings: Codable {
    var negative, neutral, positive: Double?
}

// MARK: - SellerAddress
struct SellerAddress: Codable {
    var id, comment, addressLine, zipCode: String?
    var country, state, city: Sort?
    var latitude, longitude: String?
}

// MARK: - Shipping
struct Shipping: Codable {
    var freeShipping: Bool?
    var mode: String?
    var tags: [String]?
    var logisticType: String?
    var storePickUp: Bool?
}
