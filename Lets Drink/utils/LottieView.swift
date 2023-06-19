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
    var loadingTitle: String
    var animationCompletionHandler: (() -> Void)? = {}
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView()
        let animationView = AnimationView()
        animationView.backgroundBehavior = .pauseAndRestore
        let animation = Animation.named(animationName)
        let animationCompletionHandler: (() -> Void)?
        
        animationView.animation = animation
        let label = UILabel()
        label.text = loadingTitle
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .title1	)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
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
                    label.text = "Sucesso!"
                    label.textColor = UIColor(red: 0.0, green: 0.5, blue: 0.0, alpha: 1.0)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.animationCompletionHandler?()
                    }
                }
            }
        }
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48),
            label.topAnchor.constraint(equalTo: view.topAnchor),
            
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.topAnchor.constraint(equalTo: label.bottomAnchor)
        ])
        
        return view
        
        
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        
    }
}

