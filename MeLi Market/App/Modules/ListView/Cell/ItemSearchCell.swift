//
//  ItemSearchCell.swift
//  MeLi Market
//
//  Created by Ludin Jozabeth on 13-03-22.
//

import UIKit

class ItemSearchCell: UITableViewCell {
   
    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet weak var infoItemLbl: UILabel!
    @IBOutlet weak var info2ItemLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        let bgColorView = UIView()
        bgColorView.backgroundColor =  UIColor(red: 240, green: 231, blue: 229, alpha: 1)
        
        self.selectedBackgroundView = bgColorView
    }
    
    func fill(info: Result){
        titleLabel.text = info.title
        priceLabel.text = "$ \(String(info.price ?? 0.0))"
        let url = URL(string: info.thumbnail!)!
            downloadImage(from: url)
        infoItemLbl.text = info.condition == "new" ?  NSLocalizedString("New", comment: "")  : NSLocalizedString("Used", comment: "")
        info2ItemLbl.text = NSLocalizedString("Available", comment: "") + "\( String(info.installments?.quantity ?? 0) )"
    }
    
    func downloadImage(from url: URL) {
        Utils().getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.imageItem.image = UIImage(data: data)
            }
        }
    }
}
