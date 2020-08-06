//
//  ContentView.swift
//  Edutainment Multiplication
//
//  Created by Desmond Tan on 6/8/20.
//  Copyright © 2020 Desmond Tan. All rights reserved.
//

import SwiftUI

struct Question {
    var num1: Int
    var num2: Int
    
    var questionText: String {
        return "\(num1) x \(num2)"
    }
    
    var answer: Int {
        return num1 * num2
    }
}

struct ContentView: View {
    @State private var buttonMessage = "Start Game"
    @State private var gameActive = false
    
    @State private var maxNum = 1
    @State private var numRange = 12
    // There should be an option to select all for number of questions
    @State private var numQuestions = ""
    @State private var numQuestionsOptions = ["5", "10", "15", "20", "All"]
    
    var numQuestionsActual: Int {
        if numQuestions == "All" {
            return maxNum * maxNum
        } else {
            return Int(numQuestions) ?? 0
        }
    }
    
    @State private var questionBank = [Question]()
    @State private var currentQuestion = 0
    @State private var currentAnswer = ""
    @State private var score = 0
    @State private var showingCards = true
    
    var body: some View {
//        print("hello world")
        
        Group {
            VStack {
                if !gameActive {
                    // Show the settings page
                    NavigationView {
                        Form {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Maximum number")
                                    .font(.headline)

                                Stepper(value: $maxNum, in: 1...numRange, step: 1) {
                                    Text(String(maxNum))
                                }
                            }
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Number of questions")
                                    .font(.headline)
                                
                                Picker("No. Questions", selection: $numQuestions) {
                                    ForEach(numQuestionsOptions, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .pickerStyle(SegmentedPickerStyle())
                            }
                        }
                        .navigationBarTitle("Multiplication Game")
                    }
                } else {
                    if showingCards {
                        if currentQuestion < questionBank.count {
                            ZStack {
                                LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                
                                VStack(spacing: 20) {
                                    VStack(spacing: 10) {
                                        Text("Question \(currentQuestion + 1)")
                                            .font(.title)
                                            .fontWeight(.bold)
                                        Text("What is \(questionBank[currentQuestion].questionText) ?")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                    }
                                    
                                    TextField("Enter your answer", text: $currentAnswer)
                                        .font(.headline)
                                        .foregroundColor(.black)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .multilineTextAlignment(.center)
                                        .padding(50)
                                                        
                                    Button("Submit") {
                                        if Int(self.currentAnswer) == self.questionBank[self.currentQuestion].answer {
                                            self.score += 1
                                        }
                                        self.currentQuestion += 1
                                        
                                        withAnimation {
                                            self.showingCards.toggle()
                                        }
                                        
                                        self.showingCards.toggle()
                                    }
                                    .font(.headline)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(20)
                                    .foregroundColor(Color.red)
                                    .padding(10)
                                    .overlay(RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.white, lineWidth: 3))
                                    
                                }
                                .foregroundColor(.white)
                            }
                            .font(.headline)
                            .frame(width: 300, height: 500)
                            .transition(.slide)
                        } else {
                            Text("Your score is \(score)")
                        }
                    }
                }
                
                Button(buttonMessage) {
                    if !self.gameActive {
                        self.generateQuestions()
                        self.buttonMessage = "Restart Game"
                    } else {
                        self.score = 0
                        self.currentQuestion = 0
                        self.buttonMessage = "Start Game"
                    }
                    self.gameActive.toggle()
                }
            }
        }
    }
    
    func generateQuestions() {
        let numArray = Array(1...maxNum)
        let arr1 = numArray.shuffled()
        let arr2 = numArray.shuffled()
        var count = 0
        
        questionBank = [Question]()
        
        for num1 in arr1 {
            for num2 in arr2 {
                if count < numQuestionsActual {
                    questionBank.append(Question(num1: num1, num2: num2))
                    count += 1
                } else {
                    break
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
