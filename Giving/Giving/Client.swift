//
//  Client.swift
//  Giving
//
//  Created by Adam on 10/25/21.
//

import Foundation

struct Client: Decodable, Identifiable {
    var id = UUID()
    let title: String
    let description: String

    static let allClients = Bundle.main.decode([Client].self, from: "Client.json")
    private enum CodingKeys: String, CodingKey {
        case title, description
    }
}
