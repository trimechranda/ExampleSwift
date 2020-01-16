//
//  PrevisionResponse.swift
//  ExampleSwift
//
//  Created by TRIMECH  on 16/01/2020.
//  Copyright © 2020 TRIMECH. All rights reserved.
//
import Foundation

// MARK: - PrevisionResponse
struct PrevisionResponse: Codable {

    public var prevision : [String: PuneHedgehog?]


    private struct CustomCodingKeys: CodingKey {
        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        var intValue: Int?
        init?(intValue: Int) {
            return nil
        }
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CustomCodingKeys.self)

        self.prevision = [String: PuneHedgehog]()
        for key in container.allKeys {
            let value = try container.decode(PuneHedgehog.self, forKey: CustomCodingKeys(stringValue: key.stringValue)!)
            self.prevision[key.stringValue] = value
        }
       
    }

}

// MARK: - PuneHedgehog
struct PuneHedgehog: Codable {
    let temperature: Temperature?
    let pression: Pression?
    let pluie, pluieConvective: Double?
    let humidite: Humidite?
    let ventMoyen, ventRafales, ventDirection: Vent?
    let isoZero: Int?
    let risqueNeige: RisqueNeige?
    let cape: Int?
    let nebulosite: Nebulosite?

    enum CodingKeys: String, CodingKey {
        case temperature, pression, pluie
        case pluieConvective = "pluie_convective"
        case humidite
        case ventMoyen = "vent_moyen"
        case ventRafales = "vent_rafales"
        case ventDirection = "vent_direction"
        case isoZero = "iso_zero"
        case risqueNeige = "risque_neige"
        case cape, nebulosite
    }
}

// MARK: - Humidite
struct Humidite: Codable {
    let the2M: Double?

    enum CodingKeys: String, CodingKey {
        case the2M = "2m"
    }
}

// MARK: - Nebulosite
struct Nebulosite: Codable {
    let haute, moyenne, basse, totale: Int?
}

// MARK: - Pression
struct Pression: Codable {
    let niveauDeLaMer: Int?

    enum CodingKeys: String, CodingKey {
        case niveauDeLaMer = "niveau_de_la_mer"
    }
}

enum RisqueNeige: String, Codable {
    case non = "non"
}

// MARK: - Temperature
struct Temperature: Codable {
    let the2M, sol, the500HPa, the850HPa: Double?

    enum CodingKeys: String, CodingKey {
        case the2M = "2m"
        case sol
        case the500HPa = "500hPa"
        case the850HPa = "850hPa"
    }
}

// MARK: - Vent
struct Vent: Codable {
    let the10M: Double?

    enum CodingKeys: String, CodingKey {
        case the10M = "10m"
    }
}
