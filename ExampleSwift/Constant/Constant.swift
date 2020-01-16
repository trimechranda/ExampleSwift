//
//  Constant.swift
//  ExampleSwift
//
//  Created by Trimech Sofienne on 16/01/2020.
//  Copyright © 2020 TRIMECH. All rights reserved.
//

struct Domain {
    static let dev = "https://www.infoclimat.fr/"

}
extension Domain {
    static func baseUrl() -> String {
        return Domain.dev
    }
}

struct APIEndpoint {
    static let previsions = "public-api/gfs/json?_auth=UkhTRAF%2FV3VecwQzUyVXflgwADUMelVyAHwLaAlsB3pROgRlBmZdOwBuUy4HKFdhUH1XNF5lUmJWPQB4Xy0DYlI4Uz8BalcwXjEEYVN8V3xYdgBhDCxVcgBgC2sJegdjUTMEfgZkXT0AaVMvBzZXYFBhVyheflJrVjAAYF87A2BSMVM%2BAWtXM141BHlTfFdmWD4AYQxnVT4AZAs9CTcHNVFkBDYGbV09AGxTLwcyV2ZQZ1cwXmRSblYxAGRfLQN%2FUkhTRAF%2FV3VecwQzUyVXflg%2BAD4MZw%3D%3D&_c=d0de3ed46d60fccbdbce624540479890&"
    
}
    
