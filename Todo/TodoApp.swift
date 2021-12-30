//
//  TodoApp.swift
//  Todo
//
//  Created by bilal on 29/12/2021.
//

import SwiftUI

@main
struct TodoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(toDoList: UDViewModel())
        }
    }
}
