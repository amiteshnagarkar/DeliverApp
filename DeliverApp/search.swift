//
//  search.swift
//  DeliverApp
//
//  Created by Amitesh Nagarkar on 20/12/2019.
//  Copyright © 2019 Amitesh Nagarkar. All rights reserved.
//

import SwiftUI

struct search: View {
    
    @State private var searchTerm: String = ""
    
    let names = ["Amitesh", "Bat", "Cat", "Dog", "Elephant", "Jack", "Jerry"]
    
    
    var body: some View {
        
        VStack{
        SearchBar(text: $searchTerm )
        List {
            
            //SearchBar(text: $searchTerm )
            ForEach(self.names.filter {
                self.searchTerm.isEmpty ? true :
                    $0.localizedCaseInsensitiveContains(self.searchTerm)
            }, id: \.self) { name in
                Text(name)
            }
            
        }
    }
}
}

struct search_Previews: PreviewProvider {
    static var previews: some View {
        search()
    }
}
