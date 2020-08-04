//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Desmond Tan on 4/8/20.
//  Copyright © 2020 Desmond Tan. All rights reserved.
//

import SwiftUI

struct FlagImage: View {
    let country: String
    
    var body: some View {
        Image(country)
        .renderingMode(.original)
        .clipShape(Capsule())
        .overlay(Capsule().stroke(Color.black, lineWidth: 1))
        .shadow(color: .black, radius: 2)
    }
    
    init(country: String) {
        self.country = country
    }
}

struct ContentView: View {
//    @State private var showingAlert = false
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var message = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    @State private var correctAnswer = Int.random(in: 0...5)
    @State private var currentScore = 0
    
    var body: some View {
//        Button(action: {
//            self.showingAlert = true
//        }) {
//            HStack(spacing: 10) {
//                Image(systemName: "pencil").renderingMode(.original)
//                Text("Edit")
//            }
//        }
//        .alert(isPresented: $showingAlert) {
//            Alert(title: Text("Hello SwiftUI"), message: Text("You tapped the edit button"), dismissButton: .default(Text("OK")))
//        }
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.red, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0 ..< 5) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        FlagImage(country: self.countries[number])
                    }
                    .alert(isPresented: self.$showingScore) {
                        Alert(title: Text(self.scoreTitle), message: Text(self.message), dismissButton: .default(Text("Continue")) {
                                self.askQuestion()
                            })
                    }
                }
                
                Text("Current Score: \(currentScore)")
                    .foregroundColor(.white)
                    .font(.callout)
                    .fontWeight(.black)
                
                Spacer()
            }
        }
    }
    
    // Underscore means omit parameter names when calling
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            currentScore += 1
            message = "Your score is \(currentScore)"
        } else {
            scoreTitle = "Wrong"
            message = "That's the flag of \(countries[number])"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
