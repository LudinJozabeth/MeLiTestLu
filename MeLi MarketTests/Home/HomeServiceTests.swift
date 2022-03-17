//
//  HomeServiceTests.swift
//  MeLi Market
//
//  Created by Ludin Jozabeth on 14-03-22.
//

@testable import MeLi_Market
import XCTest

class HomeServiceTests: XCTestCase {
    
    // MARK: Subject under test
    var sut: APIServiceItems!

    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupHomeService()
    }
    override  func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: Test setup
    func setupHomeService() {
        sut = APIServiceItems()
    }

    // MARK: Tests
    func testGetDataFromAPIFail() {
        // Given
        // When
        sut.apiToGetItemsData(searchItem: "Roku", completion: { (error, result) in
            if !(result?.isEmpty ?? true) {
                // Then
                XCTAssertNotNil(result![0].id)
                XCTAssertNotNil(result![1].id)
            } else {
                XCTFail("Should not fail")
            }
        })
    }

}
