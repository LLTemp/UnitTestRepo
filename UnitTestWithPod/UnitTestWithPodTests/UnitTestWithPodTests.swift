//
//  UnitTestWithPodTests.swift
//  UnitTestWithPodTests
//
//  Created by SergeyBrazhnik on 18.11.2020.
//

import XCTest
@testable import UnitTestWithPod

class UnitTestWithPodTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testZero() throws {
        let res = HelloLib.shared.returnZero()
        //let res = HelloLib.returnZero()
        XCTAssert(res == 0)
    }

    func testOpenSSLFunc() throws {
        let md5 = HelloLib.shared.md5()
        XCTAssert(md5 == "5d41402abc4b2a76b9719d911017c592")
    }

}
