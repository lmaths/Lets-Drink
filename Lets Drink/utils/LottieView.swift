//
//  LottieView.swift
//  Lets Drink
//
//  Created by Matheus Lima da Silva on 09/06/23.
//
import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    
    typealias UIViewType = UIView
    var isLoading: Bool
    var animationName: String
    var startFrame: CGFloat = 0.0
    var endFrame: CGFloat = 0.0
    var animationCompletionHandler: (() -> Void)? = {}
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView()
        let animationView = AnimationView()
        animationView.backgroundBehavior = .pauseAndRestore
        let animation = Animation.named(animationName)
        let animationCompletionHandler: (() -> Void)?
        
        animationView.animation = animation
        
        if isLoading {
            let animationHeight = animation?.size.height ?? 100.0
            animationView.loopMode = .loop
            let startProgress = startFrame / animationHeight
            let endProgress = endFrame / animationHeight
            animationView.play(fromProgress: startProgress, toProgress: endProgress)
        } else {
            animationView.loopMode = .playOnce
            animationView.play { finished in
                if finished {
                    self.animationCompletionHandler?()
                }
            }
        }
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        return view
        
        
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        // Update the view if needed
    }
}

