//
//  ProductsTableViewCell.swift
//  e-commerce
//
//  Created by Hesham Ali on 10/27/18.
//  Copyright © 2018 Hesham Ali. All rights reserved.
//

import UIKit
import Kingfisher
class ProductsTableViewCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productRating: UILabel!
    @IBOutlet weak var productCode: UILabel!
    @IBOutlet weak var addProductButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadProduct(product:SingleProduct){
        //let url = URL(string: APIManager.baseURL + product.mainImage)
        //self.productImage.kf.setImage(with: url)
        self.productCode.text = product.code
        self.productName.text = product.name
        self.productRating.text = product.averageRating
    }

    @IBAction func addProduct(_ sender: Any) {
        
    }
}
