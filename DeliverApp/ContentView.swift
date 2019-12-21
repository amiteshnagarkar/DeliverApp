//
//  ContentView.swift
//  DeliverApp
//
//  Created by Amitesh Nagarkar on 16/12/2019.
//  Copyright © 2019 Amitesh Nagarkar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack {
                Color.black
                
                HStack{
                //button only works once?
                NavigationLink (destination: buyer()) {
                    Image("buy")
                }
                
                 NavigationLink (destination: seller()) {
                                   Image("sell")
                               }
            }.navigationBarTitle("Home").edgesIgnoringSafeArea(.all)
             
        }
        
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}

/*

HStack {
  
//need to change the blue colour to black
Button(action: {
    // What to perform
}) {
     Image("buy").frame(width:80, height: 80)
        

}
    
Button(action: {
    // What to perform
}) {
     Image("sell").frame(width:80, height: 80)
}
    
    
}
 
 */


