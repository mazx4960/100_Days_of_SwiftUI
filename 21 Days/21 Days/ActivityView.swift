//
//  ActivityView.swift
//  21 Days
//
//  Created by Desmond Tan on 12/8/20.
//  Copyright © 2020 Desmond Tan. All rights reserved.
//

import SwiftUI

struct ActivityView: View {
    var item: Activity
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    ProgressBar(progress: Float(self.item.daysCompleted) / 21, strokeWidth: 20, showText: true)
                        .frame(width: geometry.size.width * 0.5, height: geometry.size.width * 0.5)
                        .padding(40.0)
                    Text("\(self.item.daysCompleted) / 21 days completed")
                        .font(.headline)
                }
                .padding()
                
                Spacer()
                
                VStack {
                    Text("")
                        .frame(maxWidth: .infinity)
                    
                    Text("Description")
                        .font(.title)
                    Text(self.item.description)
                        .font(.body)
                    
                    Spacer(minLength: 25)
                    
                    Text("Category")
                        .font(.title)
                    Text(self.item.category)
                        .font(.body)
                }
                .padding(.horizontal)
                
                Spacer(minLength: 40)
                
                if self.hasCompleted(item: self.item) {
                    Text("Good job for hitting your goal today!")
                } else {
                    Text("Have you completed your workout today?")
                        .font(.headline)
                    Button("Yes") {
                        // work in progress
//                        self.item.daysCompleted += 1
//                        self.item.latestDate = Date()
                    }
                }
            }
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
    }
    
    func hasCompleted(item: Activity) -> Bool {
        let currentDate = Date()
        return item.latestDate == currentDate
    }
}

struct ActivityView_Previews: PreviewProvider {
    static let item = Activity(name: "Test Activity", description: "This is a test activity", category: "Others", daysCompleted: 13)
    
    static var previews: some View {
        ActivityView(item: item)
    }
}
