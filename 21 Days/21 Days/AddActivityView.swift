//
//  AddActivityView.swift
//  21 Days
//
//  Created by Desmond Tan on 12/8/20.
//  Copyright © 2020 Desmond Tan. All rights reserved.
//

import SwiftUI

struct AddActivityView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var activities: Activities
    static let categories = ["Sports", "Well Being", "Self improvement", "Others"]
    
    @State private var name = ""
    @State private var category = ""
    @State private var description = ""
    
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Category", selection: $category) {
                    ForEach(Self.categories, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Description", text: $description)
            }
            .navigationBarTitle("Add new habit")
            .navigationBarItems(
                leading: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "multiply.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }.buttonStyle(PlainButtonStyle()),
                
                trailing: Button("Save") {
                    let activity = Activity(name: self.name, description: self.description, category: self.category, daysCompleted: 15)
                    
                    self.activities.items.append(activity)
                    self.presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static let activities = Activities()
    
    static var previews: some View {
        AddActivityView(activities: activities)
    }
}
