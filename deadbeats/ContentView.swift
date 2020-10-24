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

struct ContentView: View {
    @State var isShowingText: Bool = true
      
      var body: some View {
          Group {
              Spacer()
              Toggle(isOn: $isShowingText) {
                  Text("Show Text")
              }
              Spacer()
              
              (self.isShowingText)
                ? Text("I love to toggle").bold().foregroundColor(Color.red)
                  : nil
              (self.isShowingText)
                  ? Text("Yes blinking is so great")
                  : nil
              (self.isShowingText)
                  ? Text("Why did they ever take this out of Swift")
                  : nil
              (self.isShowingText)
                  ? Text("Look at me look at me look at me")
                  : nil
              Spacer()
          }
          
      }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




//PlaygroundPage.current.liveView = UIHostingController(rootView: Blink())
