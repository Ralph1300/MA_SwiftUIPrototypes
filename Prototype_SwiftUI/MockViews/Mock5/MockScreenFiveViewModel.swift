//
//  MockScreenFiveViewModel.swift
//  Prototype_SwiftUI
//
//  Created by Ralph Schnalzenberger on 06.07.21.
//

import UIKit

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
