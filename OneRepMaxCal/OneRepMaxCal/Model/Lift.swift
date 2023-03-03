//
//  Max.swift
//  OneRepMaxCal
//
//  Created by Marc Moxey on 3/3/23.
//

import Foundation

struct Lift: Identifiable {
    let id = UUID()
    var percentage: Int
    var liftWeight: Int
    var repsOfMax: Int
    
    var oneRepMax: Double {
        Double(liftWeight) * (1 + Double(repsOfMax) / 30)
    }
}

