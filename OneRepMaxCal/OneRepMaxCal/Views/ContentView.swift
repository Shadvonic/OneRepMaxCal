//
//  ContentView.swift
//  OneRepMaxCal
//
//  Created by Marc Moxey on 3/3/23.

//
import SwiftUI

struct ContentView: View {
    @StateObject var liftsViewModel = LiftsViewModel()
    @State private var weight = ""
    @State private var reps = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Enter Weight and Reps")) {
                    TextField("Weight", text: $weight)
                        .keyboardType(.decimalPad)
                    TextField("Reps", text: $reps)
                        .keyboardType(.decimalPad)
                }
                .onTapGesture {
                    self.hideKeyboard()
                }
                
                Section(header: Text("Lifts")) {
                    if let oneRepMax = liftsViewModel.lifts.first?.oneRepMax {
                        Text("Your one rep max is \(Int(oneRepMax)) lb")
                    }
                    
                    Section {
                        HStack {
                            Text("Percentage of 1RM")
                                .font(.headline)
                            Spacer()
                            Text("Lift Weight")
                                .font(.headline)
                            Spacer()
                            
                        }
                    }
                        
                    ForEach(liftsViewModel.lifts) { lift in
                        HStack {
                            Text("\(lift.percentage)%")
                            Spacer()
                            Text("\(lift.liftWeight) lb")
                         
                        }
                    }
                }
            }
            .navigationTitle("One Rep Max Calculator")
            .onChange(of: weight) { newValue in
                liftsViewModel.calculateOneRepMax(weight: weight, reps: reps)
            }
            .onChange(of: reps) { newValue in
                liftsViewModel.calculateOneRepMax(weight: weight, reps: reps)
            }
        }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
    }
}

