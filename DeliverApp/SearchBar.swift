//
//  SearchBar.swift
//  DeliverApp
//
//  Created by Amitesh Nagarkar on 20/12/2019.
//  Copyright © 2019 Amitesh Nagarkar. All rights reserved.
//

import Foundation
import SwiftUI
 
 struct SearchBar: UIViewRepresentable {
    
    //@Binding lets us declare that the value actually comes from elsewhere, and should be shared in both places.
    @Binding var text: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        
        @Binding var text: String
        
        init (text: Binding<String>) {
            _text = text
            
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
        
    }
    
    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
        
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
    
    
 }
