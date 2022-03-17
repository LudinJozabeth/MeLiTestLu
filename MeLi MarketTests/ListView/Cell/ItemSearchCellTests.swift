//
//  ItemSearchCellTests.swift
//  MeLi MarketTests
//
//  Created by Ludin Jozabeth on 15-03-22.
//

@testable import MeLi_Market
import XCTest

class ItemSearchCellTests: XCTestCase {
    
    var viewModel: [Result]!
    
    var tableView: UITableView!
    
    override func setUp() {
        super.setUp()
        let model = DataModel.shared
        model.items = ModelCreatorHelper.createMockGetItemsResponse()
        viewModel = model.items
    }
    
    override func tearDown() {
        viewModel = nil
        tableView = nil
        super.tearDown()
    }
    
    /// test the one cell can be selectable or not
    func test_did_select_a_cell() {
        let viewController = (ListViewFactory().getInitVC("Testing") as! ListSearchView)
        let tableView = UITableView()
        viewController.presenter.items = viewModel
        // when
        tableView.register(UINib.init(nibName: "ItemSearchCell", bundle: nil), forCellReuseIdentifier: "ItemSearchCell")
        // then
        XCTAssertNoThrow(viewController.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0)))
        XCTAssertEqual((viewController.tableView(tableView, heightForRowAt: IndexPath(row: 0, section: 0))), 110)
        XCTAssertLessThan(((viewController.tableView(tableView, numberOfRowsInSection: 0))), 50)
        XCTAssertNotNil(viewController.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)))
        
        let cell = viewController.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ItemSearchCell
        XCTAssertNoThrow(cell.fill(info: (viewModel[0])))
        XCTAssertNoThrow(cell.setSelected(true, animated: true))
    }
    
}
