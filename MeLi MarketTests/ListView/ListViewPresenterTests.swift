//
//  ListViewPresenterTests.swift
//  MeLi Market
//
//  Created by Ludin Jozabeth on 14-03-22.
//

@testable import MeLi_Market
import XCTest

class ListViewPresenterTests: XCTestCase {

    // MARK: Subject under test
    var sut: ListSearchPresenter!
    var spyView: ListSearchViewLogic!
    var spyModel: HomeModelLogicSpy!

    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupListViewPresenter()
    }
    override  func tearDown() {
        spyModel = nil
        spyView = nil
        sut = nil
        super.tearDown()
    }

    // MARK: Test setup
    func setupListViewPresenter() {
        spyModel = HomeModelLogicSpy()
        sut = ListSearchPresenter(DataModel.shared)

        spyView = ListViewLogicSpy()
        sut.view = spyView
    }

    // MARK: Tests
    func testGoToDetailView() {
        // Given
        spyModel.items = ModelCreatorHelper.createMockGetItemsResponse()
        spyModel.possibleResult = .success
        let nextView = DetailItemView(DetailItemViewPresenter(spyModel, item: spyModel.items![0]))
        // When
        sut.goToDetailView(items: spyModel.items![0], fromView: nextView)
        // Then
        XCTAssertFalse(spyModel.getDataCalled)
        XCTAssertGreaterThan(spyModel.items!.count, 2)
        XCTAssertFalse(false)
    }
}
