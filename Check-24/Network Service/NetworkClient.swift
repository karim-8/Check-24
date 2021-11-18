//
//  NetworkClient.swift
//  Check-24
//
//  Created by KarimAhmed on 18/11/2021.
//
    
import Foundation

protocol RequestProtocol {
    var url: URL { get }
}

class NetworkClient {
    func get(request: RequestProtocol, completion: @escaping (Result<Data, Error>) -> ()){
        let urlRequest = URLRequest(url: request.url)
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                completion(.failure(NetworkError.networkError))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            completion(.success(data))
        }.resume()
    }
}

enum NetworkError: Error {
    case noData
    case networkError
}
