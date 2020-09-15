//
//  ContentView.swift
//  SwipeDirection
//
//  Created by Md Shawkath Hossain on 12/9/20.
//  Copyright © 2020 Md Shawkath Hossain. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var color = Color.red.opacity(0.4)
    @State private var direction: String = "Center"
    
    @State private var startPoint: CGPoint = .zero
    @State private var isSwipping: Bool = true
    
    var body: some View {
        VStack {
            Text("Hello")
            ZStack {
                color
                Text(direction)
                    .font(.system(size: 30))
                    .bold()
            }
            .edgesIgnoringSafeArea(.all)
            .gesture(DragGesture()
                .onChanged { gesture in
                    if self.isSwipping {
                        self.startPoint = gesture.location
                        self.isSwipping.toggle()
                    }
                }
                .onEnded { gesture in
                    let xDist = abs(gesture.location.x - self.startPoint.x)
                    let yDist = abs(gesture.location.y - self.startPoint.y)
                    
                    if self.startPoint.y < gesture.location.y && yDist > xDist {
                        self.direction = "Down"
                        self.color = Color.green.opacity(0.4)
                    } else if self.startPoint.y > gesture.location.y && yDist > xDist {
                        self.direction = "Up"
                        self.color = Color.blue.opacity(0.4)
                    } else if self.startPoint.x < gesture.location.x && xDist > yDist {
                        self.direction = "Right"
                        self.color = Color.purple.opacity(0.4)
                    } else if self.startPoint.x > gesture.location.x && xDist > yDist {
                        self.direction = "Left"
                        self.color = Color.yellow.opacity(0.4)
                    }
                }
            )
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
