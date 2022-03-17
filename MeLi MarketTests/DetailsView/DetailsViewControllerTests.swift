//
//  DetailsViewControllerTests.swift
//  MeLi Market
//
//  Created by Ludin Jozabeth on 14-03-22.
//

@testable import MeLi_Market
import XCTest

class DetailsViewControllerTests: XCTestCase {

    // MARK: Subject under test
    var sut: DetailItemView!
    var spyPresenter: DetailsViewPresenterLogicSpy!
    var window: UIWindow!

    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        window = UIWindow()
        setupDetailsViewController()
    }
    override  func tearDown() {
        spyPresenter = nil
        sut = nil
        window = nil
        super.tearDown()
    }

    // MARK: Test setup
    func setupDetailsViewController() {
        let model = DataModel.shared
        model.items = ModelCreatorHelper.createMockGetItemsResponse()
        sut = DetailItemFactory().getInitVC(model.items![0]) as? DetailItemView
        spyPresenter = DetailsViewPresenterLogicSpy(model, item: model.items![0])
        sut.presenter = spyPresenter
        // Add to test show segues
        _ = UINavigationController(rootViewController: sut)
        loadView()
    }
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }

    // MARK: Tests
    func testViewDidLoad() {
        // Given
        // When
        // Then
        XCTAssertNotNil(sut, "sut should be instantiated")
    }
    func testFillDetailItemView() {
        // Given
        

    }
}
