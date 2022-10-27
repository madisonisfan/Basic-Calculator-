//
//  MainScreen.swift
//  Calculator-iOS
//
//  Created by Madison Isfan on 10/26/22.
//

import SwiftUI

struct MainScreen: View {
    @State var currentNumber = 0
    @State var viewedNumber = 0
    @State var firstNumber: Int?
    @State var secondNumber: Int?
    @State var operation = ""
    
    var body: some View {
        
        GeometryReader { metric in
        VStack(spacing: 17){
            Spacer()
           
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
                   
                    Text("AC").fontWeight(.medium)
                }.modifier(GrayButton())
                    

                Button() {
                } label : {
                    Text("+/-")
                        .fontWeight(.medium)
                }.modifier(GrayButton())
                
                
                Button() {
                } label : {
                    Text("%")
                        .fontWeight(.medium)
                }.modifier(GrayButton())

              
                Button() {
                } label : {
                    Image(systemName: "divide")
                    /*Image(systemName: "divide.circle.fill")
                        .foregroundColor(.orange)
                        .background(.trans)*/
                        //.accentColor(.black)
                        //.renderingMode(.original)
                        //.background(.white)
                       // .foregroundColor(.orange)
                  
                }.modifier(OrangeButton())
                
                
            }.frame(maxWidth: .infinity)
                   
            
            
           
            HStack(spacing: 17){
                Button() {
                    pressNum(num: 7 )
                } label : {
                    
                    Text("7").fontWeight(.medium)
                }
                .modifier(DarkGrayButton())
                    

                Button() {
                } label : {
                    Text("8")
                        .fontWeight(.medium)
                }
                .modifier(DarkGrayButton())
                
                
                Button() {
                } label : {
                    Text("9")
                        .fontWeight(.medium)
                }
                .modifier(DarkGrayButton())
             

                Button() {
                } label : {
                    Text("x").fontWeight(.medium)
                }
                .modifier(OrangeButton())
                
            }.frame(maxWidth: .infinity)
            
            
            
            HStack(spacing: 17){
                Button() {
                } label : {
                    Text("4").fontWeight(.medium)
                }
                .modifier(DarkGrayButton())
                    

                Button() {
                } label : {
                    Text("5")
                        .fontWeight(.medium)
                }
                .modifier(DarkGrayButton())
                
                
                Button() {
                } label : {
                    Text("6")
                        .fontWeight(.medium)
                }
                .modifier(DarkGrayButton())
                
             

                Button() {
                } label : {
                    Text("-").fontWeight(.medium)
                }
                .modifier(OrangeButton())
                
            }.frame(maxWidth: .infinity)
                
       
            HStack(spacing: 20){
                Button() {
                } label : {
                    Text("1").fontWeight(.medium)
                }
                .modifier(DarkGrayButton())

                Button() {
                } label : {
                    Text("2")
                        .fontWeight(.medium)
                }
                .modifier(DarkGrayButton())
                
                Button() {
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
                .modifier(OrangeButton())
                
            }.frame(maxWidth: .infinity)
                
          
            
           
            HStack(){
                HStack {
                    Button() {
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
                }.frame(width:  metric.size.width * 0.5)
               
                    

                Button() {
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
                .modifier(OrangeButton())
                
            }.frame(maxWidth: .infinity)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)

        .background(.black)
    }
    }
    
    func pressNum (num: Int) {
        
        currentNumber = num
        
        
        //First check if the first number has been presseed
        if firstNumber == nil {
            firstNumber = num
        } else {
            secondNumber = num
        }
    
    }
    
    func pressEqual(){
        
        
        if operation == "+" {
            
            if firstNumber != nil && secondNumber != nil {
                currentNumber = firstNumber! + secondNumber!
            }
           
        }
    }
    
    
    
    func resetValues() {
        currentNumber = 0
        //firstNumber = 0
        secondNumber = nil
        
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}


/*
 
 
 
 
 */
