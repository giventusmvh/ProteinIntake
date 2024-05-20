import SwiftUI

class AccumulatedNumbers: ObservableObject {
    @Published var total: Int = 0
    
    func addNumber(_ number: Int) {
        total += number
    }
}

struct NumberPickerView: View {
    @State private var selectedNumber: Int = 0
    @EnvironmentObject var accumulatedNumbers: AccumulatedNumbers
    @Environment(\.dismiss) var dismiss
    let numbers = Array(0...100)

    var body: some View {
        NavigationView {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.orange, Color.black]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    ScrollViewReader { proxy in
                        ScrollView(.vertical) {
                            LazyVStack {
                                ForEach(numbers, id: \.self) { number in
                                    Text("\(number)")
                                        .font(.system(size: 30))
                                        .frame(maxWidth: .infinity)
                                        .background(selectedNumber == number ? Color.white.opacity(0.3) : Color.clear)
                                        .cornerRadius(8)
                                        .onTapGesture {
                                            selectedNumber = number
                                            withAnimation {
                                                proxy.scrollTo(number, anchor: .center)
                                            }
                                        }
                                }
                            }
                        }
                        .frame(maxHeight: 100)
                    }
                    .padding()
                    
                    Button(action: {
                        accumulatedNumbers.addNumber(selectedNumber)
                        dismiss()
                    }, label: {
                        Text("Add")
                            .font(.headline)
                            .padding()
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    })
                    .padding()
                }
            }
            
        }
    }
}

func getCurrentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: Date())
    }

struct ContentView: View {
    @ObservedObject var accumulatedNumbers: AccumulatedNumbers
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.orange, Color.black]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    
                    VStack(spacing: 30) {
//                        HStack{
//                            Text("Protake")
//                                .font(.system(size: 11))
//                            Spacer()
//                            Text(getCurrentDate())
//                                .font(.system(size: 11))
//                                
//                              
//                        }
//                        .padding(.top,-40)
//                        .padding()
                            
                        ZStack {
                            Text("\(accumulatedNumbers.total) gram")
                                .foregroundColor(.white)
                            
                            Circle()
                                .stroke(lineWidth: 12.0)
                                .foregroundColor(.white)
                            
                            Circle()
                                .trim(from: 0, to: CGFloat(accumulatedNumbers.total) / 100.0)
                                .stroke(style: StrokeStyle(lineWidth: 8.0, lineCap: .round, lineJoin: .round))
                                .foregroundColor(Color.orange)
                                .rotationEffect(Angle(degrees: 270.0))
                        }
                        .frame(width: 100, height: 100)
                      //  .padding(.top,30)
                        NavigationLink(destination: NumberPickerView().environmentObject(accumulatedNumbers)) {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                Text("Protein Intake")
                                    .foregroundColor(.white)
                            }
                        }
                        .buttonStyle(BorderedButtonStyle())
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    ContentView(accumulatedNumbers: AccumulatedNumbers())
}
