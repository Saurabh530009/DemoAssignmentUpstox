//
//  Array+Extension.swift
//  DemoProject
//
//  Created by Saurabh  Verma on 11/06/24.
//

import Foundation

extension Array {
    /// Safely access the element of the array
    /// Time Complexity: -  O(1) because array already maintain count value
    subscript(safe index: Int) -> Element? {
        if index >= 0 && index < count {
            return self[index]
        }
        return nil
    }
}
