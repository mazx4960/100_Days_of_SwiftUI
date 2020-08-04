//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Desmond Tan on 4/8/20.
//  Copyright © 2020 Desmond Tan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let moves = ["Rock", "Paper", "Scissors"]
    
    @State private var currentChoice = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var playerScore = 0
    @State private var message = ""
    @State private var messageTitle = ""
    @State private var showingAlert = false
    
    var body: some View {
        ZStack {
//            LinearGradient(gradient: Gradient(colors: [.red]), startPoint: .top, endPoint: .bottom)
//                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                Text("Current score: \(playerScore)")
                    .font(.title)
                    .fontWeight(.black)
                VStack(spacing: 10) {
                    Text("App's move: \(moves[currentChoice])")
                    Text("Try to \(shouldWin ? "win" : "lose")")
                        .font(.largeTitle)
                }
                .font(.headline)
                .frame(width: 200, height: 100)
//                .border(Color.black)
//                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.secondary, lineWidth: 2)
                )
                
                Spacer()
                
                VStack(spacing: 20) {
                    Text("Your move: ")
                        .font(.title)
                        .fontWeight(.black)
                    
                    ForEach(0 ..< moves.count) { choice in
                        Button(action: {
                            // calculate win or lose
                            self.verifyChoice(choice)
                            self.showingAlert = true
                        }) {
                            Text(self.moves[choice])
                        }
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 150)
                        .background(Color.secondary)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                        .alert(isPresented: self.$showingAlert) {
                            Alert(title: Text(self.messageTitle), message: Text(self.message), dismissButton: .default(Text("Continue")) {
                                self.currentChoice = Int.random(in: 0...2)
                                self.shouldWin = Bool.random()
                            })
                        }
                    }
                }
                Spacer()
            }
            .foregroundColor(.black)
        }
    }
    
    func verifyChoice(_ playerChoice: Int) {
        if shouldWin {
            if self.isWinning(playerChoice: playerChoice) {
                messageTitle = "Congrats"
                message = "You won!"
                playerScore += 1
            } else {
                messageTitle = "Try harder"
                message = "You lost but you should have won..."
            }
        } else {
            if self.isLosing(playerChoice: playerChoice) {
                messageTitle = "Congrats"
                message = "You lost but you won!"
                playerScore += 1
            } else {
                messageTitle = "Try harder"
                message = "You won but you should have lost..."
            }
        }
    }
    
    func isWinning(playerChoice: Int) -> Bool {
        if currentChoice == 0 && playerChoice == 1 {
            return true
        } else if currentChoice == 1 && playerChoice == 2 {
            return true
        } else if currentChoice == 2 && playerChoice == 0 {
            return true
        }
        return false
    }
    
    func isLosing(playerChoice: Int) -> Bool {
        if currentChoice == 0 && playerChoice == 2 {
            return true
        } else if currentChoice == 1 && playerChoice == 0 {
            return true
        } else if currentChoice == 2 && playerChoice == 1 {
            return true
        }
        return false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
