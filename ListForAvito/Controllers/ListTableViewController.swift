//
//  ListTableViewController.swift
//  ListForAvito
//
//  Created by Халим Магомедов on 26.08.2021.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    let list = [
        List( name : "Dan", phone_number : 222),
        List( name : "Dan", phone_number : 222),
    ]
    
    let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
       
    }

    // MARK: - Table view data source

  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)

        let list = self.list[indexPath.row]
        cell.textLabel?.text = list.name
        return cell
    }
    

   

}
