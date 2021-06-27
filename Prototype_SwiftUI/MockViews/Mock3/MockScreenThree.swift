//
//  MockScreenThree.swift
//  Prototype_SwiftUI
//
//  Created by Ralph Schnalzenberger on 27.06.21.
//

import SwiftUI

struct MockScreenThree: View {
    let viewModel = MockScreenThreeViewModel()
    
    @State private var currentPage = 0
    
    var body: some View {
        VStack {
            HStack(spacing: 8) {
                if currentPage > 0 {
                    Button(action: {
                        currentPage = 0
                    }, label: {
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.black)
                    })
                }
                ProgressView(value: CGFloat(currentPage + 1), total: CGFloat(viewModel.questions.count))
            }
            .frame(minHeight: 32)
            .padding(.horizontal, 16)
            
            PageView(pageCount: viewModel.questions.count, currentIndex: $currentPage) {
                ForEach(viewModel.questions) { question in
                    QuestionView(question: question) { index in
                        viewModel.selectAnswer(at: index, for: question)
                    }
                }
            }
            
            Divider()
            Button(currentPage == 1 ? "Finish" : "Next") {
                currentPage = 1
            }
            .buttonStyle(PrimaryButtonStyle())
            .padding(.horizontal, 16)
        }
        .padding(.bottom, 8)
        .animation(.default)
    }
}

struct QuestionView: View {
    let question: Question
    let didChangeAnswerSelection: (Int) -> Void
    
    @State private var selectedAnswerIndex: Int?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(question.title)
                .font(.title)
            Text(question.description)
                .font(.caption)
            ForEach(0..<question.potentialAnswers.count, id: \.self) { index in
                AnswerSelectionView(answer: question.potentialAnswers[index],
                                    isSelected: selectedAnswerIndex == index)
                    .onTapGesture(count: 1, perform: {
                        selectedAnswerIndex = selectedAnswerIndex == index ? nil : index
                        didChangeAnswerSelection(index)
                    })
            }
        }
        .padding(.all, 16)
    }
}

struct AnswerSelectionView: View {
    let answer: String
    let isSelected: Bool
    
    var body: some View {
        HStack(spacing: 8) {
            Text(answer)
                .font(.title)
            Spacer()
            Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 32, height: 32)
        }
        .padding(.all, 16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray, lineWidth: 1.0)
                
        )
    }
}

struct MockScreenThree_Previews: PreviewProvider {
    static var previews: some View {
        MockScreenThree()
    }
}
