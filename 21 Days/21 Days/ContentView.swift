//
//  ContentView.swift
//  21 Days
//
//  Created by Desmond Tan on 12/8/20.
//  Copyright © 2020 Desmond Tan. All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
    let progress: Float
    let strokeWidth: CGFloat
    let showText: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: strokeWidth)
                .opacity(0.3)
                .foregroundColor(Color.red)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.red)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
            
            if showText {
                Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
                    .font(.largeTitle)
                    .bold()
            }
        }
    }
}

struct ContentView: View {
    @ObservedObject var activities = Activities()
    
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activities.items) { item in
                    NavigationLink(destination: ActivityView(item: item)) {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.description)
                        }
                            .layoutPriority(1)
                        
                        Spacer()
                        ProgressBar(progress: Float(item.daysCompleted)/21, strokeWidth: 8.0, showText: false)
                            .frame(width: 30, height: 30)
                            .padding()
                        Text("\(Float(item.daysCompleted)/21*100, specifier: "%.1f") %")
                            .layoutPriority(1)
                    }
                }
                    .onDelete(perform: removeItem)
            }
                
            .navigationBarTitle("21 Days")
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button(action: {
                    self.showingAddActivity = true
                }) {
                    Image(systemName: "plus")
                }
            ).sheet(isPresented: $showingAddActivity) {
                AddActivityView(activities: self.activities)
            }
        }
    }
    
    func removeItem(at offsets: IndexSet) {
        activities.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
