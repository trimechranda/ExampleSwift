//
//  PrevisionModelTest.swift
//  ExampleSwiftTests
//
//  Created by TRIMECH on 16/01/2020.
//  Copyright © 2020 TRIMECH. All rights reserved.
//

import XCTest

@testable import PrevisionModel

class PrevisionModelTest: XCTestCase {

        
        
        func testSuccessfulInit() {
            let testSuccessfulJSON = ["dateString": "2010-01-01",
                                      "temperature": 12,
                                      "pression": 123456,
                                      "humidite": 15,
                                      "vent_moyen": 3]
            
            
            XCTAssertNotNil(PrevisionModel( testSuccessfulJSON))
        }
        
    }



