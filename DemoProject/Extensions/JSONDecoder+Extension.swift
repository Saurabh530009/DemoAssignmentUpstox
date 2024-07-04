//
//  JSONDecoder+Extension.swift
//  DemoProject
//
//  Created by Saurabh  Verma on 12/06/24.
//

import Foundation

extension JSONDecoder {
    func decodeData<T: Decodable>(_ type: T.Type, from data: Data) -> Result<T, Error> {
        do {
            let decodedData = try self.decode(T.self, from: data)
            return .success(decodedData)
        } catch let error {
            return .failure(error)
        }
    }
}
