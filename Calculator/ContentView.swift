//
//  ContentView.swift
//  Calculator
//
//  Created by Nienke Tan on 20/04/2022.
//

import SwiftUI



struct ContentView: View {
    //@State
    var displayval = "0"
    @ObservedObject var calc = Calculator()
    var body: some View {
        
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text(calc.expression)
                    .font(.system(size: 60))
                    .multilineTextAlignment(.trailing)
                    .padding()
            }
            .padding(.horizontal)
            HStack(alignment: .bottom) {
                VStack {
                    Button("AC"){
                        calc.reset()
                    }.modifier(ButtonLookSoft())
                    Button("7"){
                        calc.setvalueNum(input: "7")
                    }.modifier(ButtonLookSolid())
                    Button("4"){
                        calc.setvalueNum(input: "4")
                    }.modifier(ButtonLookSolid())
                    Button("1"){
                        calc.setvalueNum(input: "1")
                    }.modifier(ButtonLookSolid())
                    Button(" "){
                    }.modifier(ButtonLookSoft())
                }.frame(maxWidth: .infinity)
                
                VStack {
                    Button("C"){
                        calc.reset()
                    }.modifier(ButtonLookSoft())
                    Button("8"){
                        calc.setvalueNum(input: "8")
                    }.modifier(ButtonLookSolid())
                    Button("5"){
                        calc.setvalueNum(input: "5")
                    }.modifier(ButtonLookSolid())
                    Button("2"){
                        calc.setvalueNum(input: "2")
                    }.modifier(ButtonLookSolid())
                    Button("0"){
                        calc.setvalueNum(input: "0")
                    }.modifier(ButtonLookSolid())
                }.frame(maxWidth: .infinity)

                VStack {
                    Button(" "){
                
                    }.modifier(ButtonLookSoft())
                    Button("9"){
                        calc.setvalueNum(input: "9")
                    }.modifier(ButtonLookSolid())
                    Button("6"){
                        calc.setvalueNum(input: "6")
                    }.modifier(ButtonLookSolid())
                    Button("3"){
                        calc.setvalueNum(input: "3")
                    }.modifier(ButtonLookSolid())
                    Button(","){
                        calc.setvaldecimal()
                    }.modifier(ButtonLookSoft())
                }.frame(maxWidth: .infinity)
                
                VStack {
                    Button("/"){
                        calc.setvalueOp(input: "/")
                    }.modifier(ButtonLookSoft())
                    Button("x"){
                        calc.setvalueOp(input: "*")
                    }.modifier(ButtonLookSoft())
                    Button("-"){
                        calc.setvalueOp(input: "-")
                    }.modifier(ButtonLookSoft())
                    Button("+"){
                        calc.setvalueOp(input: "+")
                    }.modifier(ButtonLookSoft())
                    Button("="){
                        calc.calculate()
                    }.modifier(ButtonLookSoft())
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ButtonLookSoft: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.016, saturation: 0.049, brightness: 0.95)/*@END_MENU_TOKEN@*/)
            .accentColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
    }
}

struct ButtonLookSolid: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity)
            .accentColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.gray/*@END_MENU_TOKEN@*/)
    }
}

