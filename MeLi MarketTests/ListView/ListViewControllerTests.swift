//
//  ListViewControllerTests.swift
//  MeLi Market
//
//  Created by Ludin Jozabeth on 14-03-22.
//

@testable import MeLi_Market
import XCTest

class ListViewControllerTests: XCTestCase {

    // MARK: Subject under test
    var sut: ListSearchView!
    var spyPresenter: ListViewPresenterLogicSpy!
    var window: UIWindow!

    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        window = UIWindow()
        setupListViewController()
    }
    override  func tearDown() {
        spyPresenter = nil
        sut = nil
        window = nil
        super.tearDown()
    }

    // MARK: Test setup
    func setupListViewController() {
        let model = DataModel.shared
        model.items = ModelCreatorHelper.createMockGetItemsResponse()
        sut = (ListViewFactory().getInitVC("Testing") as! ListSearchView)
        spyPresenter = ListViewPresenterLogicSpy()
        sut.presenter = spyPresenter
        sut.presenter.items = model.items!
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
    func testGoToDetailItemView() {
        // Given
        sut.tableView =  UITableView()
        sut.title = "Testing"
        let items = ModelCreatorHelper.createMockGetItemsResponse()
        let nextView = DetailItemView(DetailItemViewPresenter(DataModel(), item: items[0]))
        // When
        sut.presenter.goToDetailView(items: items[0], fromView: nextView)
        // Then
        XCTAssertTrue(spyPresenter.goToDetaiViewCalled, "go to DetailItemView")

    }
    func testTable() {
        // Given
        // When
        sut.tableView =  UITableView()
        XCTAssertNoThrow(sut.tableView.cellForRow(at: IndexPath()))
    }
}
