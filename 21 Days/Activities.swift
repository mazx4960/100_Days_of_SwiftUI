//
//  Activities.swift
//  21 Days
//
//  Created by Desmond Tan on 12/8/20.
//  Copyright © 2020 Desmond Tan. All rights reserved.
//

import Foundation

struct Activity: Codable, Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let category: String
    
    let dateStarted = Date()

    var latestDate = Date()
    var daysCompleted = 0
}

class Activities: ObservableObject, Identifiable {
    let id = UUID()
    
    @Published var items = [Activity]() {
        
        // Saves the activity to memory everytime it is being edited
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "activities")
            }
        }
    }
    
    init() {
        
        // Restore the activities array from memory when initialised
        if let items = UserDefaults.standard.data(forKey: "activities") {
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([Activity].self, from: items) {
                self.items = decoded
                return
            }
        } else {
            self.items = [Activity]()
        }
    }
}
