//
//  ListSearchView.swift
//  MeLi Market
//
//  Created by Ludin Jozabeth on 13-03-22.
//

import UIKit

protocol ListSearchViewLogic: AnyObject {
    func presentViewController(vc: UIViewController)
}

class ListSearchView: UIViewController {
    var presenter: ListSearchPresenterLogic
    
    @IBOutlet var tableView: UITableView!
    // MARK: Object lifecycle
    init(_ presenter: ListSearchPresenterLogic) {
        self.presenter = presenter
        super.init(nibName: String(describing: ListSearchView.self),
                   bundle: Bundle(for: ListSearchView.classForCoder()))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("TitleSecondView", comment: "") + presenter.title
        // Table view delegate
        self.tableView.delegate = self
        self.tableView.dataSource = self
        //Regester Cell
        self.tableView.register(UINib.init(nibName: "ItemSearchCell", bundle: nil), forCellReuseIdentifier: "ItemSearchCell")
    }
}

// MARK: - Tableview delegates
extension ListSearchView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemSearchCell", for: indexPath) as! ItemSearchCell
        let info = presenter.items[indexPath.row]
        cell.fill(info: info)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let info = presenter.items[indexPath.row]
        presenter.goToDetailView(items: info, fromView: self)
    }
}

extension ListSearchView: ListSearchViewLogic{
    func presentViewController(vc: UIViewController) {
        vc.popoverPresentationController?.sourceView = self.view
        self.present(vc, animated: true, completion: nil)
    }
}
