//
//  Service.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 09/04/22.
//

import Foundation

protocol Servicing {
    func request<Request: DataRequest>(_ request: Request, completion: @escaping (Result<Request.Response, ApiError>) -> Void)
}

final class Service: Servicing {
    
    func request<Request: DataRequest>(_ request: Request, completion: @escaping (Result<Request.Response, ApiError>) -> Void) {
    
        guard var urlComponent = URLComponents(string: request.url) else {
            return completion(.failure(.urlComponents))
        }
        
        var queryItems: [URLQueryItem] = []
        request.queryItems.forEach {
            let urlQueryItem = URLQueryItem(name: $0.key, value: $0.value)
            urlComponent.queryItems?.append(urlQueryItem)
            queryItems.append(urlQueryItem)
        }
        urlComponent.queryItems = queryItems
        
        guard let url = urlComponent.url else {
            return completion(.failure(.url))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                return completion(.failure(.generic))
            }
            
            guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                return completion(.failure(.generic))
            }
            
            guard response.statusCode != 404 else {
                return completion(.failure(.notFound))
            }
            
            guard let data = data else {
                return completion(.failure(.data))
            }
            
            do {
                try completion(.success(request.decode(data)))
            } catch {
                completion(.failure(.decoding))
            }
        }
        .resume()
    }
}
