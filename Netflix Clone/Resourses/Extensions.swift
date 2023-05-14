//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Amr El-Fiqi on 14/05/2023.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}
