//
//  Calculator.swift
//  Calculator
//
//  Created by Nienke Tan on 20/04/2022.
//

import Foundation

class Calculator: ObservableObject {
    var operation_allowed: Bool = false
    @Published var expression: String = ""
    var decimal_allowed: Bool = true
    var input_string: String = ""
    var output: String = ""

    // reset calculator values
    func reset(){
        expression = ""
        output = ""
    }
    
    // button number function
    func setvalueNum(input: String){
        if  output.count != 0 {
            reset()
        }
        
        addExpr(instring: input)
        operation_allowed = true
    }
    
    // button decimal function
    func setvaldecimal() {
        if  decimal_allowed == true {
            addExpr(instring: ".")
            operation_allowed = false
            decimal_allowed = false
        }
    }
    
    // button operation function
    func setvalueOp(input: String) {
        if operation_allowed == true {
            addExpr(instring: input)
            operation_allowed = false
            decimal_allowed = true
            output = ""
        }
    }
    
    // "=" function
    func calculate() {
         
        // add decimal to treat numbers as doubles
        if operation_allowed == true {
            if expression.contains(".") == false {
                    addExpr(instring: ".00")
            }
            print(expression)
            // format expression then calculate
            let expr = NSExpression(format: expression)
            let result = expr.expressionValue(with: nil, context: nil) as! NSNumber
            output = result.stringValue
            print(output)
            // storing output
            expression = output
        }
    }
    
    // add to expression
    func addExpr(instring: String){
        expression += instring
    }
}
