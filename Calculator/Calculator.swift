//
//  Calculator.swift
//  Calculator
//
//  Created by Nienke Tan on 20/04/2022.
//

import Foundation

struct Calculator {
    var operation_allowed: Bool = false
    var expression: String = ""
    var decimal_allowed: Bool = true


    var input_string: String = ""
    var output: String = ""


    mutating func reset(){
        expression = ""
    }
    
    mutating func setvalueNum(input: String){
        operation_allowed = true
        addExpr(instring: input)
        print(expression)
    }
    
    mutating func setvaldecimal() {
        if  decimal_allowed == true {
            addExpr(instring: ".")
            operation_allowed = false
            decimal_allowed = false
        }
    }
    
    mutating func setvalueOp(input: String) {
        if expression.count == 0 {
            addExpr(instring: output)
            addExpr(instring: input)
            operation_allowed = false
            decimal_allowed = true
        }
        else if operation_allowed == true {
            addExpr(instring: input)
            operation_allowed = false
            decimal_allowed = true
        }
        print(expression)
    }
    
    mutating func calculate() {
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
            
            // empty out expression
            //expression = ""
        }
    }
    
    func disp() -> String {
        return expression
    }
    
    mutating func addExpr(instring: String){
        expression += instring
    }
    
}
