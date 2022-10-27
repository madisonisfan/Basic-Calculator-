//
//  MainScreen.swift
//  Calculator-iOS
//
//  Created by Madison Isfan on 10/26/22.
//

import SwiftUI

struct MainScreen: View {
    @State var currentNumber: String = "0"
    @State var firstNumber: String?
    @State var secondNumber: String?
    //@State var firstNumber: Double?
    //@State var secondNumber: Double?
    @State var operation: String?
    
    var body: some View {
        
        GeometryReader { metric in
        VStack(spacing: 17){
            Spacer()
           //String(format: "%g", currentNumber)
            //Text("Width: \(metric.size.width)").foregroundColor(.white)
            HStack{
               Spacer()
                Text("\(currentNumber)")
                    .foregroundColor(.white)
                    .fontWeight(.light)
                    .font(.system(size: 100))
                    .padding(.trailing, 20)
            }
            HStack (spacing: 17){
                Button() {
                    resetValues()
                } label : {
                    
                    Text("\(firstNumber == nil ? "AC" : "C")").fontWeight(.medium)
                }.modifier(GrayButton())
                    

                Button() {
                    posNegPressed()
                } label : {
                    Image(systemName: "plus.forwardslash.minus")
                        .font(.system(size: 35))
                    //Text("+/-")
                      //  .fontWeight(.medium)
                }.modifier(GrayButton())
                
                
                Button() {
                    percentPressed()
                } label : {
                    Text("%")
                        .fontWeight(.medium)
                        .font(.system(size: 35))
                }.modifier(GrayButton())

              
                Button() {
                    operation = "/"
                } label : {
                    Image(systemName: "divide")
                    /*Image(systemName: "divide.circle.fill")
                        .foregroundColor(.orange)
                        .background(.trans)*/
                        //.accentColor(.black)
                        //.renderingMode(.original)
                        //.background(.white)
                       // .foregroundColor(.orange)
                  
                }.modifier(OrangeButton(pressed: operation == "/" ))
                
                
            }.frame(maxWidth: .infinity)
                   
            
            
           
            HStack(spacing: 17){
                Button() {
                    pressNum(num: 7)
                    
                } label : {
                    
                    Text("7").fontWeight(.medium)
                }
                .modifier(DarkGrayButton())
                    

                Button() {
                    pressNum(num: 8)
                } label : {
                    Text("8")
                        .fontWeight(.medium)
                }
                .modifier(DarkGrayButton())
                
                
                Button() {
                    pressNum(num: 9)
                } label : {
                    Text("9")
                        .fontWeight(.medium)
                }
                .modifier(DarkGrayButton())
             

                Button() {
                    operation = "x"
                } label : {
                    Text("x").fontWeight(.medium)
                }
                .modifier(OrangeButton(pressed: operation == "x" ))
                
            }.frame(maxWidth: .infinity)
            
            
            
            HStack(spacing: 17){
                Button() {
                    pressNum(num: 4)
                } label : {
                    Text("4").fontWeight(.medium)
                }
                .modifier(DarkGrayButton())
                    

                Button() {
                    pressNum(num: 5)
                } label : {
                    Text("5")
                        .fontWeight(.medium)
                }
                .modifier(DarkGrayButton())
                
                
                Button() {
                    pressNum(num: 6)
                } label : {
                    Text("6")
                        .fontWeight(.medium)
                }
                .modifier(DarkGrayButton())
                
             

                Button() {
                    operation = "-"
                } label : {
                    Text("-").fontWeight(.medium)
                }
                .modifier(OrangeButton(pressed: operation == "-" ))
                
            }.frame(maxWidth: .infinity)
                
       
            HStack(spacing: 20){
                Button() {
                    pressNum(num: 1)
                } label : {
                    Text("1").fontWeight(.medium)
                }
                .modifier(DarkGrayButton())

                Button() {
                    pressNum(num: 2)
                } label : {
                    Text("2")
                        .fontWeight(.medium)
                }
                .modifier(DarkGrayButton())
                
                Button() {
                    pressNum(num: 3)
                } label : {
                    Text("3")
                        .fontWeight(.medium)
                }
                .modifier(DarkGrayButton())

                Button() {
                    operation = "+"
                } label : {
                    Text("+").fontWeight(.medium)
                }
                .modifier(OrangeButton(pressed: operation == "+" ))
                
            }.frame(maxWidth: .infinity)
                
          
            
           
            HStack(spacing: 19){
                HStack {
                    Button() {
                        pressNum(num: 0)
                    } label : {
                        Text("0").fontWeight(.medium)
                            .padding(.leading, 30)
                        Spacer()
                    }
                    .frame(maxWidth:.infinity, maxHeight: 80, alignment: .center)
                    .background(Color(red: 49 / 255, green: 49 / 255, blue: 49 / 255))
                    .cornerRadius(40)
                    .foregroundColor(.white)
                    .font(.system(size: 40))
                }.frame(width:  metric.size.width * 0.48)
                    //.padding(.trailing, 10)
               
                    

                Button() {
                    decimalPressed()
                } label : {
                    Text(".")
                        .fontWeight(.medium)
                }
                .modifier(DarkGrayButton())
                
             
                
            
                Button() {
                    pressEqual()
                } label : {
                    Text("=").fontWeight(.medium)
                }
                .modifier(OrangeButton(pressed: operation == "=" ))
                
            }.frame(maxWidth: .infinity)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)

        .background(.black)
    }
    }
    
    func posNegPressed() {
        if operation == nil {
            print("operation is nil")
            //MEANS WE ARE STILL ON FIRST NUMBER
            if firstNumber == nil {
                //NO NUMBER SELECTED YET
                firstNumber = "-0"
            } else  {
                
                firstNumber = firstNumber!.first! == "-" ? firstNumber?.replacingOccurrences(of: "-", with: "") : "-" + firstNumber!
            }
            currentNumber = firstNumber!
            //currentNumber = String(format: "%g", firstNumber!)
        } else {
            //WE ARE ON THE SECOND NUMBER
            if secondNumber == nil {
                //NO NUMBER SELECTED YET
                secondNumber = "0."
            } else if secondNumber?.last != "." {
                secondNumber! += "."
            }
            
            currentNumber = secondNumber!
        }
    }
    
    
       
    func percentPressed(){
        
        currentNumber = String(format: "%g", Double(currentNumber)! / 100)
        firstNumber = currentNumber
    }
    
    func decimalPressed(){
        
        if operation == nil {
            print("operation is nil")
            //MEANS WE ARE STILL ON FIRST NUMBER
            if firstNumber == nil {
                //NO NUMBER SELECTED YET
                firstNumber = "0."
            } else if firstNumber?.last != "." {
                
                firstNumber! += "."
            }
            currentNumber = firstNumber!
            //currentNumber = String(format: "%g", firstNumber!)
        } else {
            //WE ARE ON THE SECOND NUMBER
            if secondNumber == nil {
                //NO NUMBER SELECTED YET
                secondNumber = "0."
            } else if secondNumber?.last != "." {
                secondNumber! += "."
            }
            
            currentNumber = secondNumber!
        }
    }
    
    
    
    func pressNum (num: Int) {
        
        if operation == nil {
            print("operation is nil")
            //MEANS WE ARE STILL ON FIRST NUMBER
            if firstNumber == nil {
                //NO NUMBER SELECTED YET
                firstNumber = String(num)
            } else {
                firstNumber! += String(num)
            }
            currentNumber = firstNumber!
            //currentNumber = String(format: "%g", firstNumber!)
        } else {
            //WE ARE ON THE SECOND NUMBER
            if secondNumber == nil {
                //NO NUMBER SELECTED YET
                secondNumber = String(num)
            } else {
                secondNumber! += String(num)
            }
            
            currentNumber = secondNumber!
        }
        
        
    
        //currentNumber = num
        
        /*

        //First check if the first number has been presseed
        if firstNumber == nil {
            firstNumber = num
        } else {
            secondNumber = num
        }
    */
    }
    
    func pressEqual(){
       
        switch operation {
            case "+":
                print("+")
                if firstNumber != nil && secondNumber != nil {
                  
                    currentNumber = String(format: "%g",Double(firstNumber!)! + Double(secondNumber!)!)
                }
            case "-":
                if firstNumber != nil && secondNumber != nil {
                    currentNumber = String(format: "%g", Double(firstNumber!)! - Double(secondNumber!)!)
                }
            case "/":
                
                if firstNumber != nil && secondNumber != nil {
                    currentNumber = String(format: "%g", Double(firstNumber!)! / Double(secondNumber!)!)
                }
            case "x":
                if firstNumber != nil && secondNumber != nil {
                    currentNumber = String(format: "%g", Double(firstNumber!)! * Double(secondNumber!)!)
                }
            
           
            default:
                print("unknown operation")
        }
        
        
        setValuesForNewOperation()
        
      
    }
    
    func setValuesForNewOperation(){
        firstNumber = currentNumber
        secondNumber = nil
        operation = nil
        
    }
    
    func resetValues() {
       
        firstNumber = nil
        secondNumber = nil
        operation = nil
        currentNumber = "0"
        
        
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}


/*
 
 
 
 
 */
