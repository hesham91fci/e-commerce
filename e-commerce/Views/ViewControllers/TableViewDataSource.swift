//
//  TableViewDataSource.swift
//  e-commerce
//
//  Created by Hesham Ali on 10/27/18.
//  Copyright © 2018 Hesham Ali. All rights reserved.
//

import Foundation
import UIKit
class TableViewDataSource<Cell :UITableViewCell,ViewModel> : NSObject, UITableViewDataSource {
    
    private var cellIdentifier :String!
    private var items :[ViewModel]!
    var configureCell :(Cell,ViewModel) -> ()
    
    init(cellIdentifier :String, items :[ViewModel],forTableView tableView: UITableView, configureCell: @escaping (Cell,ViewModel) -> ()) {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: cellIdentifier, bundle: bundle)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //tableView.register(ProductsTableViewCell.self, forCellReuseIdentifier: "ProductsTableViewCell")
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! Cell
        let item = self.items[indexPath.row]
        self.configureCell(cell,item)
        return cell
    }
    
}
