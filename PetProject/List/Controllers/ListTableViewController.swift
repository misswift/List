//
//  ListTableViewController.swift
//  ListForAvito
//
//  Created by Халим Магомедов on 26.08.2021.
//

import UIKit
import Alamofire


class ListTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let urlString = "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c"
    var networkService = NetworkService()
    var listCache = NSCache<AnyObject, AnyObject>()
    
  
    var list = [
        Employee(name: "name", phoneNumber: "phone", skills: ["skills", "skills", "skills"])]
    
    var tableView = UITableView()
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        networkService.dataFetch(urlString: urlString)
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
    
//    if let cachedList = listCache.object(forKey: url as NSString) { }
//    else {
    
    func getText(){
            AF.request(urlString).responseData { (dataResponce) in
                if let err = dataResponce.error{
                    print("error dataResponce", err)
                    return
                }
                guard let data = dataResponce.data else {return}
                
                do {
                    let listResult = try JSONDecoder().decode(List.self, from: data)
                    //получаем json  идекодируем его
                    //print (listResult)
                    DispatchQueue.main.async {
                        // сортировка в алфавитном порядке полученных данных
                        self.list = listResult.company.employees.sorted(by: { $0.name < $1.name})
                        
                       // listCache.setObject(list, forKey: cachedList)
                        self.tableView.reloadData()
                    }
                    
                } catch let decodeErr{
                    print ("Error Decode" , decodeErr)
                }
              }
            
    }
    
    
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath )  {
//        let aboutController = AboutController()
//        navigationController?.pushhview
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        // выводим все данные в три строки
        let list = self.list[indexPath.row]
        //вывожу массив который возвращает каждый раз разное количество полей
        guard  let skills = list.skills else {return cell}
        //извлечение данных из полей
        cell.textLabel?.text = "\(list.name) ☎︎ \(list.phoneNumber) \n \(String(describing: skills.joined(separator:",")))" // извлечение данных из опционального массива с разными полями
        cell.textLabel?.layer.shadowOffset = CGSize(width: 0, height: 5)
        //добавлена красная тень в метке
        cell.textLabel?.layer.shadowOpacity = 20
        cell.textLabel?.layer.shadowRadius = 5
        cell.textLabel?.layer.shadowColor = UIColor.red.cgColor
       // рамка и цвет рамки картинки... использовать анимации CALayer
        cell.textLabel?.numberOfLines = 0
        cell.imageView?.image = UIImage(named: "iconphoto")
        cell.imageView?.layer.cornerRadius = 50
        cell.imageView?.layer.borderColor = UIColor.gray.cgColor
        cell.imageView?.layer.masksToBounds = true
       // cell.imageView?.layer.borderWidth = 1
        
        return cell
    }
    
    
    
    // MARK: - Table view delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
