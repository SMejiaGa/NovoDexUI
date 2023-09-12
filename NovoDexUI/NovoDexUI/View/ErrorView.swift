//
//  ErrorView.swift
//  NovoDexUI
//
//  Created by Sebastian Mejía on 10/09/23.
//

import SwiftUI

struct ErrorView: View {
    var errorMessage: String
    
    init(message: String) {
        self.errorMessage = message
    }
    var body: some View {
        
        Text(errorMessage)
          
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(message: "Error")
    }
}
