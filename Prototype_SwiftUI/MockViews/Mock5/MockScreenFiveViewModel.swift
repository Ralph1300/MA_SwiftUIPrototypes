//
//  MockScreenFiveViewModel.swift
//  Prototype_SwiftUI
//
//  Created by Ralph Schnalzenberger on 06.07.21.
//

import UIKit

struct Exercise: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let value: String
    
    var text: String {
        return "\(value)s \(name)"
    }
}

struct Round: Identifiable, Hashable {
    let id = UUID()
    let exercises: [Exercise]
}

struct Workout {
    let name: String
    let description: String
    let rounds: [Round]
    let warmup: Round?
}

final class MockScreenFiveViewModel {
    let workout: Workout
    
    var personalBestIcon: UIImage {
        return UIImage(systemName: "timer")!
    }
    
    var descriptionIcon: UIImage {
        return UIImage(systemName: "heart.text.square.fill")!
    }
    
    var personalBest: String {
        return "02:30"
    }
    
    var exerciseImage: UIImage {
        return UIImage(systemName: "rectangle.stack.person.crop")!
    }
    
    init(workout: Workout = WorkoutFactory.makeWorkout(roundCount: 5, includeWarmup: true)) {
        self.workout = workout
    }

}
