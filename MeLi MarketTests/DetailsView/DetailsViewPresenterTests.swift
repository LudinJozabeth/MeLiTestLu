//
//  DetailsViewPresenterTests.swift
//  MeLi Market
//
//  Created by Ludin Jozabeth on 14-03-22.
//

@testable import MeLi_Market
import XCTest

class DetailsViewPresenterTests: XCTestCase {

    // MARK: Subject under test
    var sut: ListSearchPresenter!
    var spyModel: HomeModelLogicSpy!

    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupDetailsViewPresenter()
    }
    override  func tearDown() {
        spyModel = nil
        sut = nil
        super.tearDown()
    }

    // MARK: Test setup
    func setupDetailsViewPresenter() {
        spyModel = HomeModelLogicSpy()
        spyModel.items = ModelCreatorHelper.createMockGetItemsResponse()
        sut = ListSearchPresenter(spyModel)
    }

    // MARK: Tests
    func testGoToDetailView() {
        // Given
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
