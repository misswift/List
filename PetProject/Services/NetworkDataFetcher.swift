//
//  NetworkDataFetcher.swift
//  PetProject
//
//  Created by Халим Магомедов on 08.11.2021.
//

import Foundation

class NetworkDataFetcher {
   var  networkService = NetworkService()
    
    init (networkService: NetworkService = NetworkService()){
        self.networkService  = networkService
    }
    //декодируем json данные в конкретную модель данных
    func fetchList (urlString: String, completion: @escaping([List]?)->Void) {
        networkService.request(urlString: urlString) { (data, error) in
            let decoder = JSONDecoder()
            guard let data = data else {return}
            let response = try? decoder.decode([List].self, from: data)
            completion (response)
        }
        
    }
}

class NetworkingDataFetcher: DataFetcher {
    var networking: Networking
    
    init(networking: Networking = NetworkService() ) {
        self.networking = networking

    }
    func fetchGenericJSONData<T>(urlString: String, responce: @escaping (T?) -> Void) where T : Decodable {
        print (T.self)
        networking.request(urlString: urlString) { (data, error) in
            if let error =  error {
                print ("Error received request data: \(error.localizedDescription)")
                responce(nil)
            }
            let decoded = self.decodeJSON(type: T.self, from: data)
            responce(decoded)
        }
        
    }
    
    func decodeJSON <T: Decodable>(type: T.Type, from: Data?)-> T? {
        let decoder = JSONDecoder()
        guard let data = from else {return nil}
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print ("Failet to decode json \(jsonError) ")
            return nil
        }
    }
}

