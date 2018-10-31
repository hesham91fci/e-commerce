//
//  ProductsViewController.swift
//  e-commerce
//
//  Created by Hesham Ali on 10/27/18.
//  Copyright © 2018 Hesham Ali. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
class ProductsViewController: UIViewController {

    @IBOutlet weak var productsTableView: UITableView!
    private var dataSource :TableViewDataSource<ProductsTableViewCell,SingleProduct>!
    private var productsViewModel:ProductsViewModel!
    var page=1
    override func viewDidLoad() {
        super.viewDidLoad()
        productsViewModel = ProductsViewModel()
        productsViewModel.getProdcuts(forPage: page)
        self.updateUI()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    private func updateUI() {

        self.productsViewModel.bindToProductViewModels = {
            self.bindProducts()
        }
        
    }
    
    private func bindProducts() {
        self.dataSource = TableViewDataSource(cellIdentifier: "ProductsTableViewCell", items: self.productsViewModel.products,forTableView: productsTableView) { cell, product in
            cell.loadProduct(product: product)
        }
        
        self.productsTableView.dataSource = self.dataSource
        self.productsTableView.reloadData()

    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
