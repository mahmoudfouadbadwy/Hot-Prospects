//
//  Prospect.swift
//  Hot Prospects
//
//  Created by Mahmoud Fouad on 8/22/21.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    let id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate (set) var isContacted = false
    
}

class Prospects: ObservableObject {
    
    @Published var people: [Prospect]
    init() {
        self.people = []
    }
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
    }
    
}