//
//  AddIntakeView.swift
//  ProteinIntake Watch App
//
//  Created by Giventus Marco Victorio Handojo on 15/05/24.
//

import SwiftUI

// Model to store the accumulated sum
//class AccumulatedNumbers: ObservableObject {
//    @Published var total: Int = 0
//    
//    func addNumber(_ number: Int) {
//        total += number
//    }
//}

//struct NumberPickerView: View {
//    @State private var selectedNumber: Int = 0
//    @StateObject private var accumulatedNumbers = AccumulatedNumbers()
//    let numbers = Array(0...100)
//
//    var body: some View {
//        NavigationView {
//            VStack {
//               
//                ScrollViewReader { proxy in
//                    ScrollView(.vertical) {
//                        LazyVStack {
//                            ForEach(numbers, id: \.self) { number in
//                                Text("\(number)")
//                                    .font(.system(size: 30))
//                                    .frame(maxWidth: .infinity)
//                                    
//                                    .background(selectedNumber == number ? Color.blue.opacity(0.3) : Color.clear)
//                                    .cornerRadius(8)
//                                    .onTapGesture {
//                                        selectedNumber = number
//                                        accumulatedNumbers.addNumber(number) // Accumulate the selected number
//                                        withAnimation {
//                                            proxy.scrollTo(number, anchor: .center)
//                                        }
//                                    }
//                            }
//                        }
//                    }
//                    .frame(maxHeight: 300) // Adjust the frame height as needed
//                }
//                .padding()
//
//                NavigationLink(destination: NumberDisplayView(selectedNumber: selectedNumber, accumulatedNumbers: accumulatedNumbers)) {
//                    Text("Add")
//                        .font(.headline)
//                        .padding()
//                        
//                        .foregroundColor(.white)
//                        .cornerRadius(8)
//                }
//                .padding()
//            }
//            
//        }
//        .environmentObject(accumulatedNumbers) // Inject the AccumulatedNumbers object into the environment
//    }
//}

struct NumberDisplayView: View {
    let selectedNumber: Int
    @ObservedObject var accumulatedNumbers: AccumulatedNumbers // Observe changes in the accumulated sum

    var body: some View {
        VStack {
            Text("Current Selected Number:")
                .font(.headline)
                .padding()

            Text("\(selectedNumber)")
                .font(.largeTitle)
                .padding()

            Text("Total Accumulated Sum:")
                .font(.headline)
                .padding()

            Text("\(accumulatedNumbers.total)")
                .font(.largeTitle)
                .padding()
        }
       
    }
}

struct AddIntakeView: View {
    var body: some View {
        NumberPickerView()
    }
}

#Preview {
    AddIntakeView()
}
