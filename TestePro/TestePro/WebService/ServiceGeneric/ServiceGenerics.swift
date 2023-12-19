//
//  ServiceGenerics.swift
//  TestePro
//
//  Created by Rogerio Martins on 18/12/23.
//

import Foundation

enum CustomError: Error {
    case error
    case invalidUrl
    case invalidResponse
    case errorStatusCode(Int)
    case invalidData
    case invalidJsonDecoder
}

class ServiceGenerics: NSObject {

    enum Method: String {
        case get = "GET"
        case post = "POST"
    }
    
    func serviceGenerics<T: Codable>(urlString: String, method: Method, bodyParameters: [String:Any]? = nil, expecting: T.Type, completion: @escaping (Result<T,CustomError>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        if let bodyParameters = bodyParameters {
            
            if method == .post {
                do {
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: bodyParameters)
                    urlRequest.addValue("application/json", forHTTPHeaderField: "Content-type")
                } catch {
                    completion(.failure(.error))
                    return
                }
            }
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if error != nil {
                completion(.failure(.error))
            } else {
                guard let response = response as? HTTPURLResponse else {
                    completion(.failure(.invalidResponse))
                    return
                }
                if response.statusCode == 200 {
                    guard let data = data else {
                        completion(.failure(.invalidData))
                        return
                    }
                    do {
                        let jsonData = try JSONDecoder().decode(expecting, from: data)
                        DispatchQueue.main.async {
                            completion(.success(jsonData))
                        }
                    } catch {
                        completion(.failure(.invalidJsonDecoder))
                    }
                } else {
                    completion(.failure(.errorStatusCode(response.statusCode)))
                }
            }
        }
        task.resume()
    }
}
