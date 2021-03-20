//
//  ContentView.swift
//  SafariCompassSwiftUI
//
//  Created by Shreyas Vilaschandra Bhike on 20/03/21.
//  The App Wizard
// Instagram : theappwizard2408

import SwiftUI

private let gradient = RadialGradient(gradient: Gradient(colors: [Color("Compass"), .blue]), center: .center, startRadius: 2, endRadius: 650)



struct ContentView: View {
    var body: some View {
        ZStack{
        CompassView()
            
        VStack{
            
            Spacer().frame(width: 0, height: 450, alignment: .center)
            
            Text("The App Wizard")
                .font(.title3)
                .fontWeight(.regular)
                .foregroundColor(Color.white).opacity(0.5)
           
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





















struct CompassView: View {
   
    
    @State private var needleswing = false

    var body: some View {
            ZStack{
                //for phonescreen
                Color("Dark")
                    .edgesIgnoringSafeArea(.all)
                

                VStack(alignment: .center, spacing: 100) {
                    // Path for positioning dots
                    ZStack {
                        //Icon Frame
                        Circle()
                            .fill(RadialGradient(gradient: Gradient(colors: [Color("Compass"), .blue]), center: .center, startRadius: 110, endRadius: 400)
)
                          //  .foregroundColor(Color("Compass"))
                            .frame(width: 350, height: 350, alignment: .center)
                            .clipShape(Circle())
                            .blur(radius: 3)
                            .overlay(Circle().stroke(Color.white, lineWidth: 10))
                            .shadow(color: .black, radius: 8, x: 0.0, y: 0.0)
                        
                       
                        
                        // Big dots: Equal intervals
                        ForEach(0 ..< 31) {
                            RoundedRectangle(cornerRadius: 25.0)
                                .frame(width: 4, height: 12)
                                .foregroundColor(.white)
                                .offset(y: -147)
                                .rotationEffect(.degrees(Double($0) * 15))
                        }.rotationEffect(.degrees(7))
                        
                        // Big dots: Equal intervals
                        ForEach(0 ..< 32) {
                            RoundedRectangle(cornerRadius: 25.0)
                                .frame(width: 4, height: 25)
                                .foregroundColor(.white)
                                .offset(y: -140)
                                .rotationEffect(.degrees(Double($0) * 15))
                                
                           }
                        
                        Image("needle")
                            .resizable()
                            .frame(width: 350, height: 350, alignment: .center)
                            .shadow(color: .black, radius: 10, x: 10, y: 10)
                            .rotationEffect(.degrees(needleswing ? 130 : 225))
                            .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                            .onAppear() {
                                    self.needleswing.toggle()
                                }
                    
                        
                    }
                }
        }
    }

}

