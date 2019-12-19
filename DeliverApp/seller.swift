//
//  seller.swift
//  DeliverApp
//
//  Created by Amitesh Nagarkar on 19/12/2019.
//  Copyright © 2019 Amitesh Nagarkar. All rights reserved.
//

import SwiftUI

struct seller: View {
    var body: some View {
        ZStack{
            Color.pink
            VStack{
            
                Text("Testing").foregroundColor(.white)
                
            }.navigationBarTitle("Welcome Seller")
            
        }.edgesIgnoringSafeArea(.all)
        
    }
}

struct seller_Previews: PreviewProvider {
    static var previews: some View {
        seller()
    }
}
