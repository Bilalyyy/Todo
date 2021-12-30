//
//  ContentView.swift
//  Todo
//
//  Created by bilal on 29/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var inputText: String = ""
    @ObservedObject var toDoList : UDViewModel
    
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    HStack {
                        TextField("Ajouter une tache", text: $inputText)
                        Button {
                            toDoList.add(string: inputText)
                            inputText = ""
                        } label: {
                            Image(systemName: "plus.circle.fill")
                        }
                    }
                }
                Section(header: Text("Mes to do")) {
                    List {
                        ForEach(toDoList.items) { toDo in
                            HStack {
                                Text(toDo.name)
                                Spacer()
                                Button {
                                    toDoList.update(toDo: toDo)
                                } label: {
                                    self.updateDoneBtn(done: toDo.done )
                                }

                            }
                        }
                        .onDelete { index in
                            toDoList.delete(index: index)
                        }
                    }
                }
            }
            .navigationTitle(Text("My To Do"))
        }
    }
    
    func updateDoneBtn(done: Bool)-> some View {
        let systemName = done ? "checkmark.square" : "x.square"
        let color: Color = done ? .green : .red
        
        return Image(systemName: systemName).foregroundColor(color)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(toDoList: UDViewModel())
    }
}
