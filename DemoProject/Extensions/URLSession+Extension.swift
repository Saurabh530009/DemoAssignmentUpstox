//
//  URLSession+Extension.swift
//  DemoProject
//
//  Created by Saurabh  Verma on 12/06/24.
//

import Foundation

extension URLSession {
    func fetchData<T: Decodable>(url: URL, decodeType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        let _ = self.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "DataErrorDomain", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                completion(.failure(error))
                return
            }
            
            let result: Result<T, Error> = JSONDecoder().decodeData(T.self, from: data)
            completion(result)
        }.resume()
    }
}
