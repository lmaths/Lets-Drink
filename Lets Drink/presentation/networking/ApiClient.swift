//
//  ApiClient.swift
//  Lets Drink
//
//  Created by Matheus Lima da Silva on 07/06/23.
//

import Foundation
import Alamofire

class ApiClient {
    
    static let shared = ApiClient()
    let baseURL: String
    
    private init() { baseURL = "https://rails-production-72ec.up.railway.app/" }
    func performRequest<T: Decodable>(endpoint: String, method: HTTPMethod, parameters: Parameters? = nil, completion: @escaping (Result<T, Error>) -> Void) {
            let url = baseURL + endpoint
            
            AF.request(url, method: method, parameters: parameters)
                .validate()
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let result):
                        completion(.success(result))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
        }
    
}
