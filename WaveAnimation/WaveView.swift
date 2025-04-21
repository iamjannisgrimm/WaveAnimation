//
//  Wave.swift
//  WaveAnimation
//
//  Created by Jannis Grimm on 4/17/25.
//


import SwiftUI


/// A SwiftUI view showing two overlaid waves, moving right-to-left, clipped in a circle.
struct WaveView: View {
    var color: Color = .blue
    var speed: CGFloat = 0.45
    
    var body: some View {
        TimelineView(.animation) { timeline in
            // Calculate phase based on current time for smooth looping
            let now = timeline.date.timeIntervalSinceReferenceDate
            let phase = CGFloat(now) * speed

            ZStack {
                // Back wave (smallest amplitude, highest frequency)
                Wave(phase: phase, amplitude: 0.1, frequency: 0.8, baseline: 0.9)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [color.opacity(1)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                
                // Back wave (smallest amplitude, highest frequency)
                Wave(phase: phase + 0.35, amplitude: 0.1, frequency: 0.5, baseline: 0.7)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [color.opacity(0.5)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                
                // Back wave (smallest amplitude, highest frequency)
                Wave(phase: phase + 0.55, amplitude: 0.15, frequency: 0.25, baseline: 0.5)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [color.opacity(0.2)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
            }
            .clipShape(Circle())
        }
        .frame(width: 200, height: 200)
        .shadow(radius: 10)
    }
}
