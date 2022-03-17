//
//  HomeModelTests.swift
//  MeLi Market
//
//  Created by Ludin Jozabeth on 14-03-22.
//

@testable import MeLi_Market
import XCTest

class HomeModelTests: XCTestCase {
    
    // MARK: Subject under test
    var sut: DataModel!

    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupHomeModel()
    }
    override  func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: Test setup
    func setupHomeModel() {
        sut = DataModel()
    }

    // MARK: Tests
    func testGetDataSuccess() {
        // Given
        // When
        sut.load(search: "Roku", model: sut, completion: {
            XCTAssertNil(self.sut, "No instances")
        })
    }
    func testGetDataFailure() {
        // Given
        // When
        sut.load(search: "Roku", model: sut, completion: {
            XCTAssertNil(self.sut, "No instances")
        })
    }
    
}
