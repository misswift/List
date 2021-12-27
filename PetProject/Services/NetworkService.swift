//
//  NetworkService.swift
//  PetProject
//
//  Created by Халим Магомедов on 07.11.2021.
//

import Foundation
import Alamofire

class NetworkService {

    //построение запроса данных по url
    func request (urlString: String, completion: @escaping(Data?, Error?)->Void){
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let task =  createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping(Data?, Error?)->Void)-> URLSessionDataTask{
        return URLSession.shared.dataTask(with: request) { (data, responce, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
}

protocol Networking {
    func request (urlString: String, completion: @escaping (Data?, Error?) -> Void)
}

class NetworkService: Networking {
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else {return}
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completion: completion)
        task
    }
    
    private func createDataTask ( from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        
    }
}
