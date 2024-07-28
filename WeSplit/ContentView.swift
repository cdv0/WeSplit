//
//  ContentView.swift
//  WeSplit
//
//  Created by Cathleen Vu on 7/26/24.
//

import SwiftUI

// Shows the initial UI for the app.
// .padding() is Called a view modifier. It returns a new View with old data and new modifications.
struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)    // Add 2 because the range in the ForEach loop within the Picker() starts at 2, but the range actually counts from 0.
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))    // Format is responsible for how the value should be formatted. Locale.current refers to the user's locale settings, which contains information about the user's region, language, and currency. Locale.current.currency?.identifier attempts to retrieve the currency code e.g. USD, EUR from the user's locale. "USD" is a fallback if the left side of ?? is nil.
                        .keyboardType(.decimalPad)  // This method allows to pop up the number keyboard when clicking on the textfield.
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)   // Cannot use this modifier without a NavigationStack wrapping it
                }
                
                Section("How do you want to tip?") {    // This is the title for this section
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
        }
        
    }
}


#Preview {
    ContentView()
}
