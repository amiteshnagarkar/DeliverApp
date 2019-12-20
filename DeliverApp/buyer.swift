//
//  buyer.swift
//  DeliverApp
//
//  Created by Amitesh Nagarkar on 18/12/2019.
//  Copyright © 2019 Amitesh Nagarkar. All rights reserved.
//

import SwiftUI

struct buyer: View {
    var body: some View {
        ZStack{
            Color.pink
            VStack{
            
                 HStack{
                        //need to add correct destination
                NavigationLink (destination: search()) {
                Image("search")}
                                     
            NavigationLink (destination: seller()) {
                Image("add")
                                                    }
                                 }
                
            }.navigationBarTitle("Welcome Buyer")
            
        }.edgesIgnoringSafeArea(.all)
        
    
         
    }
}

struct buyer_Previews: PreviewProvider {
    static var previews: some View {
        buyer()
    }
}
