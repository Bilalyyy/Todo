//
//  ToDo.swift
//  Todo
//
//  Created by bilal on 29/12/2021.
//

import Foundation
import UIKit


struct ToDo: Identifiable, Codable {
    var id = UUID()
    var name: String
    var done: Bool
}
