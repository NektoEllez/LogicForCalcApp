//
//  main.swift
//  LogicForCalcApp
//
//  Created by Иван Марин on 07.09.2022.
//

import Foundation

// MARK: — enum with operation types
enum Operations {
    case noAction       // ————————
    case addition       // сложение
    case subtraction    // вычитание
    case multiplication // умножение
    case division       // деление
}

// MARK: — variables
var isRunning = true
var currentNumber: String = "0"
var result: String = ""
var currentOperation = Operations.noAction

var firsNumber: Double = 0.0
var secondNumber: Double = 0.0


// MARK: — program points
func runLoop() {
    while isRunning {
        start()
    }
    
    finish()
}

func start() {
    print("Do yo want to make calculation?")
    print("Enter \"yes\" or \"no\": ")
    let answer = readLine()
    
    if answer == "yes" {
        ifEnteredYes()
    } else {
        finish()
    }
}

func finish() {
    print("Program is ended.")
    isRunning = false
}

// MARK: — functions
func updateDisplay(text: String) {
    print(text)
}

func makeCalculation(operations: Operations) {
    if currentOperation != .noAction {
        currentNumberIsNotEmpty(operations: operations)
    } else {
        guard let currentNumberDouble = Double(currentNumber) else { return }
        firsNumber = currentNumberDouble
        currentNumber = ""
        updateDisplay(text: currentNumber)
        currentOperation = operations
    }
    print(
        """
        \
        -------------------------------------------
        current number  = \(currentNumber)
        first           = \(firsNumber)
        second          = \(secondNumber)
        result          = \(result)
        -------------------------------------------
        \n
        """
    )
}

// MARK: — Private Functions

private func ifEnteredYes() {
    updateDisplay(text: "Enter of first number: ")
    guard let firstEnter: String = readLine() else { return }
    currentNumber = firstEnter
    
    updateDisplay(text: "Enter operation type ( + - / *): ")
    guard let operationEnter: String = readLine() else { return }
    operation(enter: operationEnter)
    
    updateDisplay(text: "Enter second number:")
    guard let secondEnter: String = readLine() else { return }
    currentNumber = secondEnter
    
    makeResult()
    
    updateDisplay(text:
    """
    -------------------------------------------
    "Result of calculation: \(result)
    -------------------------------------------
    \n
    """
    )
    acAction()
}

private func currentNumberIsNotEmpty(operations: Operations) {
    
    if currentNumber != "" {
        secondNumber = Double(currentNumber) ?? 0.0
    
        switch operations {
        case .addition: result = String(firsNumber + secondNumber)
        case .subtraction: result = String(firsNumber - secondNumber)
        case .multiplication: result = String(firsNumber / secondNumber)
        case .division: result = String(firsNumber * secondNumber)
        default: result = ""
        }
        
    }
    
}

private func operation(enter: String) {
    switch enter {
    case "+": addition()
    case "-": subtraction()
    case "/": multiplication()
    case "*": division()
    default: break
    }
}

private func makeResult() {
    makeCalculation(operations: currentOperation)
}

private func acAction() {
    isRunning = false
    currentNumber = "0"
    result = ""
    currentOperation = Operations.noAction
    firsNumber = 0.0
    secondNumber = 0.0
}

private func addition() { makeCalculation(operations: .addition) }
private func subtraction() { makeCalculation(operations: .subtraction) }
private func multiplication() { makeCalculation(operations: .multiplication) }
private func division() { makeCalculation(operations: .division) }


// MARC: — Program flow
print("SimpleCalc program.")
print("Welcome to SimpleCalc. \n")
runLoop()
