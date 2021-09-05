//
//  ListTableViewController.swift
//  ListForAvito
//
//  Created by Халим Магомедов on 26.08.2021.
//

import UIKit
import Alamofire


class ListTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    var list = [
        Employee(name: "name", phoneNumber: "phone", skills: ["skills"])]
    
    var tableView = UITableView()
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTable()
        getText()
        
    }
    
    func createTable(){
        self.tableView = UITableView(frame: view.bounds, style: .plain )
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        view.addSubview(tableView)
        
    }
    
    func getText(){
        let url = "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c"
        AF.request(url).responseData { (dataResponce) in
            if let err = dataResponce.error{
                print("error dataResponce", err)
                return
            }
            
            guard let data = dataResponce.data else {return}
            
            do {
                let listResult = try JSONDecoder().decode(List.self, from: data)
                
                
                self.list = listResult.company.employees
                self.tableView.reloadData()
            } catch let decodeErr{
                print ("Error Decode" , decodeErr)
            }
            
        }
    }
    
    
    
    // MARK: - Table view data source
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let list = self.list[indexPath.row]
        cell.textLabel?.text = "\(list.name)\n \(list.phoneNumber)\n \(list.skills)"
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15.0)
        cell.textLabel?.sizeToFit()
        cell.textLabel?.numberOfLines = 0
    
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    
    
}
