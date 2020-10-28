//
//  CardView.swift
//  SwiftUI-CardGraph
//
//  Created by H Chan on 2020/10/28.
//

import SwiftUI

struct CardView: View {
    
    @State var flip = false
    
    var datas: [Double]
    
    var body: some View {
        ZStack {
            ZStack {
                Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
                    .cornerRadius(20)
                CircleGraph(datas: datas, lineWidth: 25)
            }
            .opacity(flip ? 0 : 1)
            .rotation3DEffect(
                .degrees(flip ? -180 : 0),
                axis: (x: 0.0, y: 10.0, z: 0.0)
            )
            
            ZStack {
                Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
                    .cornerRadius(20)
                Text("TEST")
            }
            .opacity(flip ? 1 : 0)
            .rotation3DEffect(
                .degrees(flip ? 0 : 180),
                axis: (x: 0.0, y: 10.0, z: 0.0)
            )
            
        }
        .frame(height: 250)
        .padding()
        .onTapGesture {
            withAnimation(.spring()) {
                flip.toggle()
            }
        }
    }
}

