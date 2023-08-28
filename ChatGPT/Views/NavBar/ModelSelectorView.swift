//
//  NavBarView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/25/23.
//

import SwiftUI

struct ModelSelectorView: View {
    @Binding var modelDetailsEngaged: Bool
    @Binding var selectedModel: GPTModel
    
    private let hapticFeedback = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 13.0)
                    .frame(height: 50)
                    .foregroundColor(Color("SecondaryBackgroundColor"))
                HStack {
                    if selectedModel.name == "GPT-4" {
                        Spacer()
                    }
                    RoundedRectangle(cornerRadius: 10.0)
                        .frame(width: (geometry.size.width/2)-4, height: 42)
                        .foregroundColor( Color(UIColor.systemBackground))
                        .padding(.horizontal, 4)
                    if selectedModel.name == "GPT-3.5" {
                        Spacer()
                    }
                }
                .animation(.spring(duration: 0.2, bounce: 0.2), value: selectedModel.name)
                HStack {
                    ModelButtonView(modelDetailsEngaged: $modelDetailsEngaged,model: GPTModel.gpt3_5, isSelected: selectedModel.name == "GPT-3.5")
                        .onTapGesture {
                            if selectedModel.name == "GPT-4" {
                                selectedModel = GPTModel.gpt3_5
                                hapticFeedback.impactOccurred()
                            } else {
                                modelDetailsEngaged.toggle()
                            }
                        }
                    ModelButtonView(modelDetailsEngaged: $modelDetailsEngaged,model: GPTModel.gpt4, isSelected: selectedModel.name == "GPT-4")
                        .onTapGesture {
                            if selectedModel.name == "GPT-3.5" {
                                selectedModel = GPTModel.gpt4
                                hapticFeedback.impactOccurred()
                            } else {
                                modelDetailsEngaged.toggle()
                            }
                        }
                }
            }
        }
        .frame(height: 50)
    }
}

#Preview {
    ModelSelectorView(modelDetailsEngaged: .constant(false), selectedModel: .constant(GPTModel.gpt3_5))
}