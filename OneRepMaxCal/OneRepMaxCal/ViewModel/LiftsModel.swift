//
//  MaxViewModel.swift
//  OneRepMaxCal
//
//  Created by Marc Moxey on 3/3/23.
//

import Foundation

class LiftsViewModel: ObservableObject {
    @Published var lifts = [Lift]()
    
    func calculateOneRepMax(weight: String, reps: String) {
        guard let weightDouble = Double(weight), let repsInt = Int(reps) else {
            return
        }
        
        let oneRepMax = weightDouble * (1 + Double(repsInt) / 30)
        let roundedMax = (oneRepMax * 10).rounded() / 10
        
        if lifts.isEmpty {
            for i in stride(from: 100, to: 50, by: -5) {
                let percentage = Double(i)
                let liftWeight = (percentage / 100) * roundedMax
                let repsOfMax = Int(roundedMax / liftWeight)
                let lift = Lift(percentage: Int(percentage), liftWeight: Int(liftWeight), repsOfMax: repsOfMax)
                lifts.append(lift)
            }
        } else {
            var i = 0
            for percentage in stride(from: 100, to: 50, by: -5) {
                let liftWeight = (Double(percentage) / 100) * roundedMax
                let repsOfMax = Int(roundedMax / liftWeight)
                lifts[i].percentage = percentage
                lifts[i].liftWeight = Int(liftWeight)
                lifts[i].repsOfMax = repsOfMax
                i += 1
            }
        }
    }
}





