//
//  GraphView.swift
//  SwiftUI-CardGraph
//
//  Created by H Chan on 2020/10/28.
//

import SwiftUI

struct GraphView: View {
    
    @EnvironmentObject var appState: AppState
    
    var datas: [Double]
    
    var body: some View {
        VStack {
            CardView(datas: datas)
            List(0..<datas.count, id: \.self) { i in
                HStack {
                    appState.colors[i]
                        .frame(width: 20, height: 20)
                        .clipShape(Circle())
                    Text("\(datas[i])")
                }
            }
            Spacer()
        }
        .navigationTitle("Balance")
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView(datas: [100, 300, 500])
    }
}
