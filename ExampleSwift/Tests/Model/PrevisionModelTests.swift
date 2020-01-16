//
//  PrevisionModelTests.swift
//  
//
//  Created by TRIMECH on 14/01/2020.
//

import XCTest

class PrevisionModelTests: XCTestCase {

   
    func testSuccessfulInit() {
        let testSuccessfulJSON: JSON = ["dateString": "2010-01-01",
                                        "temperature": 12,
                                        "pression": 123456,
                                        "humidite": 15,
                                        "vent_moyen": 3
                                       ]
        
        XCTAssertNotNil(Friend(json: testSuccessfulJSON))
    }

}

