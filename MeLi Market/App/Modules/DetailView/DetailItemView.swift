//
//  DetailItemView.swift
//  MeLi Market
//
//  Created by Ludin Jozabeth on 14-03-22.
//

import UIKit

protocol DetailItemViewLogic: AnyObject {
}

class DetailItemView: UIViewController {
    var presenter: DetailItemViewPresenterLogic
    
    @IBOutlet weak var closeImg: UIImageView!
    @IBOutlet weak var ItemImg: UIImageView!
    @IBOutlet weak var titleItemLbl: UILabel!
    @IBOutlet weak var priceItemLbl: UILabel!
    @IBOutlet weak var infoItemLbl: UILabel!
    @IBOutlet weak var info2ItemLbl: UILabel!
    @IBOutlet weak var info3ItemLbl: UILabel!
    @IBOutlet weak var info4ItemLbl: UILabel!
    @IBOutlet weak var info5ItemLbl: UILabel!
    @IBOutlet weak var info6ItemLbl: UILabel!
    // MARK: Object lifecycle
    init(_ presenter: DetailItemViewPresenterLogic) {
        self.presenter = presenter
        super.init(nibName: String(describing: DetailItemView.self),
                   bundle: Bundle(for: DetailItemView.classForCoder()))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeTapped(tapGestureRecognizer:)))
        closeImg.isUserInteractionEnabled = true
        closeImg.addGestureRecognizer(tapGestureRecognizer)
        fill()
    }
    
    func fill(){
        titleItemLbl.text = presenter.item.title
        priceItemLbl.text = "$ \(String(presenter.item.price ?? 0.0))"
        let url = URL(string: presenter.item.thumbnail!)!
        downloadImage(from: url)
        infoItemLbl.text = presenter.item.condition == "new" ? NSLocalizedString("New", comment: "")  : NSLocalizedString("Used", comment: "")
        info2ItemLbl.text = NSLocalizedString("Available", comment: "") + "\( String(presenter.item.installments?.quantity ?? 0) )"
        info3ItemLbl.text = NSLocalizedString("Rate", comment: "") + "\( String(presenter.item.installments?.rate ?? 0) )"
        
        var attributesItem = [String]()
        presenter.item.attributes!.forEach { (attr) in
            let x = attr.name ?? ""
            attr.values!.forEach { (value) in
                let aux = value.name ?? " "
                let y = x + " " + String(describing: aux)
                attributesItem.append(y)
            }
        }
        info4ItemLbl.text = NSLocalizedString("Attributes", comment: "")  + "\(attributesItem.joined(separator: "\n"))"
        info5ItemLbl.text = ""
        info6ItemLbl.text = ""
    }
    
    func downloadImage(from url: URL) {
        Utils().getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.ItemImg.image = UIImage(data: data)
            }
        }
    }
    
    @objc func closeTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        _ = tapGestureRecognizer.view as! UIImageView
                self.dismiss(animated: true, completion: nil)
//        self.navigationController?.popViewController(animated: true)
    }
}
