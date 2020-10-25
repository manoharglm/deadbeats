//
//  ContentView.swift
//  deadbeats
//
//  Created by Manohar on 24/10/20.
//  Copyright © 2020 thecodeabides. All rights reserved.
//

import UIKit
import SwiftUI
//import PlaygroundSupport

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
    var artworkUrl100: URL
}



struct ContentView: View {
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId) { item in
            HStack(alignment: .bottom){
//                Text(item.trackName)
                VStack(alignment: .leading) {
                    Text(item.trackName)
                    Text(item.collectionName)
                }
            }

        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        guard let url = URL(string: "https://itunes.apple.com/search?term=pink+floyd&entity=song") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    // we have good data – go back to the main thread
                    DispatchQueue.main.async {
                        // update our UI
                        self.results = decodedResponse.results
                    }
                    
                    // everything is good, so we can exit
                    return
                }
            }
            
            // if we're still here it means there was a problem
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")    }.resume()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




//PlaygroundPage.current.liveView = UIHostingController(rootView: Blink())
