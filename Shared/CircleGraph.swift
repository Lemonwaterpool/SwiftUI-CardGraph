//
//  CircleGraph.swift
//  Shared
//
//  Created by H Chan on 2020/10/28.
//

import SwiftUI

struct CircleGraph: View {
    
    private var lineWidth: CGFloat
    
    private var datas: [Double]
    
    private let colors: [Color] = [.red, .yellow, .blue, .green, .orange, .purple, .pink]
    
    @State private var circleAnimation = false
    @State private var textAnimation = false
    
    private var total: Double {
        get {
            var count: Double = 0
            for i in datas {
                count += i
            }
            return count
        }
    }
    
    init(datas: [Double], lineWidth: CGFloat = 40) {
        self.datas = datas
        self.lineWidth = lineWidth
    }
    
    private func end(_ index: Int) -> CGFloat {
        var percent: CGFloat = 0
        for i in 0...index {
            let data = datas[i]
            let p = CGFloat(data / total)
            percent += p
        }
        print("i: \(index), end: \(percent)")
        return percent
    }
    
    private func start(_ index: Int) -> CGFloat {
        var percent: CGFloat = 0
        for i in 0..<index {
            let data = datas[i]
            let p = CGFloat(data / total)
            percent += p
        }
        print("i: \(index), start: \(percent)")
        return percent
    }
    
    private func color(_ index: Int) -> Color {
        return colors[index]
    }
    
    private func showAnimation() {
        withAnimation(.spring()) {
            circleAnimation.toggle()
        }
        withAnimation(Animation.spring().delay(textAnimation ? 0 : 0.3)) {
            textAnimation.toggle()
        }
    }
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(0..<datas.count) { i in
                    Circle()
                        .trim(
                            from: i == 0 ? 0 : start(i),
                            to: i == 0
                                ? CGFloat(datas[i] / total)
                                : end(i)
                        )
                        .stroke(color(i), lineWidth: lineWidth)
                        .opacity(circleAnimation ? 1 : 0.001)
                        .rotationEffect(circleAnimation ? .degrees(-90) : .degrees(-360))
                        .scaleEffect(circleAnimation ? 1 : 0.001)
                }
                
                VStack {
                    Text("Total Balance")
                        .font(.title2)
                    Text("\(Int(total))") // Not accurate
                        .font(.largeTitle)
                }
                .scaleEffect(textAnimation ? 1 : 0.001)
                .opacity(textAnimation ? 1 : 0.001)
            }
            .padding(lineWidth)
            .onAppear {
                showAnimation()
            }
//            
//            Spacer()
//            Button(action: {
//                showAnimation()
//            }, label: {
//                Text("TEST")
//            })
//            .padding()
        }
    }
}

struct CircleGraph_Previews: PreviewProvider {
    static var previews: some View {
        CircleGraph(datas: [100, 200, 300, 400])
            .previewDevice("iPhone 12 mini")
    }
}
