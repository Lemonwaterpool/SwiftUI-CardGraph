//
//  Home.swift
//  SwiftUI-CardGraph
//
//  Created by H Chan on 2020/10/28.
//

import SwiftUI

struct Home: View {
    
    @State var datas: [Double] = []
    
    @State var data: Double = 0
    
    @State var textFieldCount = 0
    
    func addData() {
        textFieldCount += 1
        datas.append(data)
        data = 0
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Data Input")) {
                    ForEach(0..<textFieldCount, id: \.self) { i in
                        TextField("Input Data", value: Binding(get: {
                            return datas[i]
                        }, set: { value in
                            datas[i] = value
                        }), formatter: NumberFormatter())
                    }
                    Button(action: {
                        addData()
                    }, label: {
                        Text("Add")
                    })
                }
                
                Section {
                    NavigationLink("See Result", destination: GraphView(datas: datas))
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Home")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
