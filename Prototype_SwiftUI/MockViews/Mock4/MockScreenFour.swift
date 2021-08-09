//
//  MockScreenFour.swift
//  Prototype_SwiftUI
//
//  Created by Ralph Schnalzenberger on 29.06.21.
//

import SwiftUI

struct MockScreenFour: View {
    let viewModel = MockScreenFourViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        HeaderView(image: viewModel.headerImage,
                                   title: viewModel.title,
                                   description: viewModel.description,
                                   duration: viewModel.duration)
                        Divider()
                        SampleWeekView(title: "Sample Plan Week",
                                       workouts: viewModel.workouts)
                        Divider()
                        UserReviewView(title: "What people are saying",
                                       reviews: viewModel.reviews)
                    }
                }
                Divider()
                Button("Start") {
                    print("Start plan")
                }
                .buttonStyle(PrimaryButtonStyle())
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
            }
            .navigationTitle("Plan")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HeaderView: View {
    
    let image: UIImage
    let title: String
    let description: String
    let duration: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading, spacing: 8.0) {
                Text(title.uppercased())
                    .font(.title)
                    .bold()
                HStack(spacing: 16) {
                    Image(systemName: "flag.fill")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .aspectRatio(contentMode: .fit)
                    Text(description)
                }
                HStack(spacing: 16) {
                    Image(systemName: "hourglass")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .aspectRatio(contentMode: .fit)
                    Text(duration)
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

struct SampleWeekView: View {
    let title: String
    let workouts: [ExampleWorkout]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Text(title)
                .bold()
            ForEach(0..<workouts.count) { index in
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.gray)
                        Text(workouts[index].day)
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(workouts[index].title)
                        Text(workouts[index].exercises)
                            .font(.callout)
                        if index != workouts.count - 1 {
                            Divider()
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 16)
    }
}

struct UserReviewView: View {
    let title: String
    let reviews: [ExampleUserReview]
    
    var body: some View {
        Text("")
    }
}


struct MockScreenFour_Previews: PreviewProvider {
    static var previews: some View {
        MockScreenFour()
    }
}
