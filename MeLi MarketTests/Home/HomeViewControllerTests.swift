//
//  HomeViewControllerTests.swift
//  MeLi Market
//
//  Created by Ludin Jozabeth on 14-03-22.
//

@testable import MeLi_Market
import XCTest

class HomeViewControllerTests: XCTestCase {

    // MARK: Subject under test
    var sut: HomeViewController!
    var spyPresenter: HomePresenterLogicSpy!
    var window: UIWindow!

    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        window = UIWindow()
        setupHomeViewController()
    }
    override  func tearDown() {
        spyPresenter = nil
        sut = nil
        window = nil
        super.tearDown()
    }

    // MARK: Test setup
    func setupHomeViewController() {
        sut = HomeViewController()
        spyPresenter = HomePresenterLogicSpy(DataModel.shared)
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
    func testGoToListView() {
        // Given
        sut.searchTextField =  UITextField()
        sut.searchTextField.text = "Roku"
        // When
        sut.goToListView(sut as Any)
        // Then
        XCTAssertTrue(spyPresenter.goSearchCalled, "go to ListView was called after to Search")

    }
    func testSearchEndEditing() {
        // Given
        // When
        sut.searchTextField =  UITextField()
        XCTAssertEqual(sut.searchText, "", "text should match the passed String")
        sut.searchTextField.text = "Roku"
        sut.searchEndEditing(sut.searchTextField as Any)
        // Then
        XCTAssertEqual(sut.searchText, "Roku", "text should match the passed String")
    }

    func testTextFieldShouldReturn(){
        sut.searchTextField =  UITextField()
        let value = sut.textFieldShouldReturn(sut.searchTextField)
        XCTAssertEqual( value, true)
    }
}
