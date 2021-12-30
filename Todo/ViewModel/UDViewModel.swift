//
//  UDViewModel.swift
//  Todo
//
//  Created by bilal on 30/12/2021.
//

import SwiftUI

class UDViewModel: ObservableObject {
    
    @Published var items: [ToDo] = []
    let userD = UserDefaults.standard
    let key = "Key"
    
    init() {
        guard let datas = userD.data(forKey: key) else {return}
        do {
            items = try JSONDecoder().decode([ToDo].self, from: datas)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    func sync() {
        do {
            let encoded = try JSONEncoder().encode(items)
            userD.set(encoded, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func update(toDo: ToDo) {
        guard let index = items.firstIndex(where: { $0.id == toDo.id}) else {return}
        items[index].done.toggle()
        sync()
    }
     
    func add(string: String) {
        guard string != "" else  {return}
        items.append(ToDo(name: string, done: false))
        sync()
    }
    
    func delete(index: IndexSet) {
        items.remove(atOffsets: index)
        sync()
    }

    
}
