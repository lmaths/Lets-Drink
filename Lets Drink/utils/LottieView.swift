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
    
    var animationName: String
    var loopMode: LottieLoopMode = .loop
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView()
        let animationView = LottieAnimationView()
        animationView.animation = LottieAnimationView(animationName)
        animationView.loopMode = loopMode
        animationView.play()
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

