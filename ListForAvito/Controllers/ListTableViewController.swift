//
//  ListTableViewController.swift
//  ListForAvito
//
//  Created by Халим Магомедов on 26.08.2021.
//

import UIKit
import Alamofire


class ListTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let list = [
        List( name : "Dan", phone_number : 222),
        List( name : "Dan", phone_number : 222),
    ]
    
    var tableView = UITableView()
    
    let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
       createTable()
//        getText()
       
    }
    
    func createTable(){
        self.tableView = UITableView(frame: view.bounds, style: .plain )
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        view.addSubview(tableView)
        
    }
    


    // MARK: - Table view data source

  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)

        let list = self.list[indexPath.row]
        cell.textLabel?.text = list.name
        return cell
    }
    
    // MARK: - Table view delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

   

}
