//
//  ContentView.swift
//  Shared
//
//  Created by Huanhuan Sun on 4/16/22.
//

import SwiftUI

struct ContentView: View {
    let currency = FloatingPointFormatStyle<Double>.Currency.currency(code: Locale.current.currencyCode ?? "USD")
    let percentages = [10, 15, 18, 20, 25]

    @State var checkAmount: Double = 0.0
    @State private var peopleCount = 2
    @State private var tipPercentage = 15
    @FocusState private var checkAmountFocused: Bool

    var avgAmount: Double {
        let totalAmount: Double = checkAmount + checkAmount * Double(tipPercentage) / 100.0
        return totalAmount / Double(peopleCount + 2)
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: currency)
                        .keyboardType(.decimalPad)
                        .focused($checkAmountFocused)
                } header: {
                    Text("Your total bill")
                }

                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(percentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much you want to tip?")
                }

                Section {
                    Picker("Total people", selection: $peopleCount) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }

                Section {
                    Text(avgAmount, format: currency)
                } header: {
                    Text("Split bill")
                }

            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()

                    Button("Done") {
                        checkAmountFocused = false
                    }
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
