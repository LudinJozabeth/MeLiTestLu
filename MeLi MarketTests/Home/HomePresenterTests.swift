//
//  HomePresenterTests.swift
//  MeLi Market
//
//  Created by Ludin Jozabeth on 14-03-22.
//

@testable import MeLi_Market
import XCTest

class HomePresenterTests: XCTestCase {

    // MARK: Subject under test
    var sut: HomePresenter!
    var spyView: HomeViewController!
    var spyModel: HomeModelLogicSpy!

    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupHomePresenter()
    }
    override  func tearDown() {
        spyModel = nil
        spyView = nil
        sut = nil
        super.tearDown()
    }

    // MARK: Test setup
    func setupHomePresenter() {
        spyModel = HomeModelLogicSpy()
        sut = HomePresenter()
        spyModel.items = ModelCreatorHelper.createMockGetItemsResponse()
        spyView = HomeViewController()
        sut.view = spyView
    }

    // MARK: Tests
    func testGoSearchSuccess() {
        // Given
        spyModel.possibleResult = .success
        // When
        sut.goSearch(searchText: "Roku", fromView: HomeViewController())
        // Then
        XCTAssertFalse(spyModel.getDataCalled)
        XCTAssertGreaterThan(spyModel.items!.count, 2)
    }

    func testGetEntityArray() {
        // Given
        let result = ModelCreatorHelper.createMockGetItemsResponse()
        // When
        sut.goToListView(search:  "Roku")
        // Then
        XCTAssertNotNil(result)
        XCTAssertFalse(spyModel.getDataCalled)
        XCTAssertNotNil(spyModel.items)
    }
    func testGoToListViewSuccess() {
        // Given
        spyModel.items = ModelCreatorHelper.createMockGetItemsResponse()
        // When
        sut.goToListView(search:  "Roku")
        // Then
        XCTAssertFalse(spyModel.getDataCalled)
        XCTAssertGreaterThan(spyModel.items!.count, 15)
    }
    func testGoToListViewFailure() {
        // Given
        spyModel.items = ModelCreatorHelper.createMockGetItemsResponse()
        // When
        sut.goToListView(search:  "")
        // Then
        XCTAssertFalse(spyModel.getDataCalled)
        XCTAssertGreaterThan(spyModel.items!.count, 2)
    }

}
