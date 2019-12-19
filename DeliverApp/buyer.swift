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
            
                Text("Testing").foregroundColor(.white)
                
            }.navigationBarTitle("Detail")
            
        }.edgesIgnoringSafeArea(.all)
         //Image("buy")
    }
}

struct buyer_Previews: PreviewProvider {
    static var previews: some View {
        buyer()
    }
}
