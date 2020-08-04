//
//  ContentView.swift
//  LengthConversion
//
//  Created by Desmond Tan on 3/8/20.
//  Copyright © 2020 Desmond Tan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var inputLength = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    
    let units = [
        "m": UnitLength.meters,
        "km": UnitLength.kilometers,
        "yd": UnitLength.yards,
        "ft": UnitLength.feet
    ]
    let units_arr = ["m", "km", "yd", "ft"]
//    var units_arr = Array(units.keys)
    
    var outputLength: Double {
        let inputValue = Double(inputLength) ?? 0.0
        
        let inputMeasurement = Measurement(value: inputValue, unit: units[units_arr[inputUnit]]!)
        let outputValue = inputMeasurement.converted(to: units[units_arr[outputUnit]]!)
        
        return outputValue.value
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input length")) {
                    TextField("Enter input length", text: $inputLength)
                }
                .keyboardType(.decimalPad)
                
                Section(header: Text("Unit for input length")) {
                    Picker("Unit", selection: $inputUnit) {
                        ForEach(0 ..< units_arr.count) {
                            Text("\(self.units_arr[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Unit for output length")) {
                    Picker("Unit", selection: $outputUnit) {
                        ForEach(0 ..< units_arr.count) {
                            Text("\(self.units_arr[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Output length")) {
                    Text("\(outputLength, specifier: "%.4f")")
                }
            }
            .navigationBarTitle("Length Conversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
