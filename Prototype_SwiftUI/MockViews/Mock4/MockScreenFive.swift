//
//  MockScreenFive.swift
//  Prototype_SwiftUI
//
//  Created by Ralph Schnalzenberger on 04.07.21.
//

import SwiftUI

struct MockScreenFive: View {
    let viewModel = MockScreenFiveViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ExerciseList(viewModel: viewModel)
                Divider()
                Button("Start") {
                    print("Start plan")
                }
                .buttonStyle(PrimaryButtonStyle())
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
            }
            .navigationTitle(viewModel.workout.name)
            .navigationBarItems(leading: Image(systemName: "arrow.backward"),
                                trailing: Image(systemName: "square.and.arrow.up"))
        }
    }
}

struct ExerciseListView: View {
    let exercise: Exercise
    let image: UIImage
    
    var body: some View {
        HStack(spacing: 8.0) {
            Image(uiImage: image)
            Text(exercise.text)
        }
    }
}

struct DescriptionView: View {
    let viewModel: MockScreenFiveViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            HStack(alignment: .top, spacing: 16.0) {
                Image(uiImage: viewModel.descriptionIcon)
                Text(viewModel.workout.description)
            }
            HStack(spacing: 16.0) {
                Image(uiImage: viewModel.personalBestIcon)
                Text("Personal Best")
                Spacer()
                Text(viewModel.personalBest)
            }
            Button(action: { }, label: {
                HStack {
                    Image(systemName: "bookmark")
                    Text("Bookmark")
                }
            })
            .buttonStyle(PrimaryButtonStyle())
            .fixedSize()
        }
    }
}

struct ExerciseList: View {
    let viewModel: MockScreenFiveViewModel
    var workout: Workout { return viewModel.workout }
    var exerciseImage: UIImage { return viewModel.exerciseImage }
    
    @State private var warmupCollapsed = false
    
    var body: some View {
        List {
            DescriptionView(viewModel: viewModel)
            if let warmup = workout.warmup {
                Section(header: CollapsibleSectionHeader(isCollapsed: $warmupCollapsed, text: "Warmup")) {
                    if !warmupCollapsed {
                        ForEach(warmup.exercises) { exercise in
                            ExerciseListView(exercise: exercise,
                                             image: exerciseImage)
                        }
                        
                    }
                }
            }
            ForEach(0..<workout.rounds.count) { roundIndex in
                Section(header: Text("Round \(roundIndex + 1)")) {
                    ForEach(workout.rounds[roundIndex].exercises) { exercise in
                        ExerciseListView(exercise: exercise,
                                         image: exerciseImage)
                    }
                }
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct CollapsibleSectionHeader: View {
    @Binding var isCollapsed: Bool
    let text: String
    
    var body: some View {
        HStack(spacing: 8.0) {
            Text(text)
            Spacer()
            Button(action: {
                withAnimation {
                    isCollapsed.toggle()
                }
            }, label: {
                Image(systemName: isCollapsed ? "arrowtriangle.down.fill" : "arrowtriangle.up.fill")
                    .foregroundColor(.blue)
            })
        }
    }
}

struct MockScreenFive_Previews: PreviewProvider {
    static var previews: some View {
        MockScreenFive()
    }
}
