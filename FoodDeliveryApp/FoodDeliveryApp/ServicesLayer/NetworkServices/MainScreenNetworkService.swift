//
//  MainScreenNetworkService.swift
//  FoodDeliveryApp
//
//  Created by Азат Ибрагимов on 23.06.2024.
//

import Foundation

class MainScreenNetworkService {
    static let shared = MainScreenNetworkService(); private init() { }
    
    private func createURL() -> URL? {
        let tunnel = "https://"
        let server = "randomuser.me"
        let endPoint = "/api"
        let getParams = ""
        
        let urlStr = tunnel + server + endPoint + getParams
        let url = URL(string: urlStr)
        return url
    }
    func fetchData(completion: @escaping (Result<Data, Error>) -> ()) {
        guard let url = createURL() else {
            completion(.failure(NetworkingError.badURL as! Error))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                if let error {
                    completion(.failure(error))
                    return
                }
                completion(.failure(NetworkingError.badResponse as! Error))
                return
            }
            completion(.success(data))
        }
    }
}

enum NetworkingError {
    case badURL, badRequest, badResponse
}
