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
    static let saveKey = "ProspectsData"
    @Published private (set) var people: [Prospect]
    init() {
        if let data = UserDefaults.standard.data(forKey: Prospects.saveKey),
           let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
            self.people = decoded
        } else {
            self.people = []
        }
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(people) {
            UserDefaults.standard.setValue(encoded, forKey: Prospects.saveKey)
        }
    }
    
  
    
}
