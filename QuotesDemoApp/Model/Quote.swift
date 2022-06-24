//
//  Quote.swift
//  QuotesWidgetDemoApp
//
//  Created by Sebastian Hat on 20/06/2022.
//

import Foundation

struct Quote: Codable, Hashable {
    let text: String
    let author: String?
}

typealias Quotes = [Quote]
