//
//  ViewController.swift
//  TrafficLights
//
//  Created by Pavel Mazurenko on 30.04.2023.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var redSignal: UIView!
    @IBOutlet weak var yellowSignal: UIView!
    @IBOutlet weak var greenSignal: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    private var currentSignal = CurrentSignal.red
    private let signalOn: CGFloat = 1
    private let signalOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 10
        
        redSignal.alpha = signalOff
        yellowSignal.alpha = signalOff
        greenSignal.alpha = signalOff
        
//        redSignal.layer.cornerRadius = redSignal.frame.width / 2
//        yellowSignal.layer.cornerRadius = yellowSignal.frame.width / 2
//        greenSignal.layer.cornerRadius = greenSignal.frame.width / 2
        
    }
    
    override func viewWillLayoutSubviews() {
        redSignal.layer.cornerRadius = redSignal.frame.width / 2
        yellowSignal.layer.cornerRadius = yellowSignal.frame.width / 2
        greenSignal.layer.cornerRadius = greenSignal.frame.width / 2
    }

    @IBAction func startButtonTapped() {
        if startButton.currentTitle == "START" {
            startButton.setTitle("NEXT", for: .normal)
        }
        switch currentSignal {
        case .red:
            greenSignal.alpha = signalOff
            redSignal.alpha = signalOn
            currentSignal = .yellow
        case .yellow:
            redSignal.alpha = signalOff
            yellowSignal.alpha = signalOn
            currentSignal = .green
        case .green:
            greenSignal.alpha = signalOn
            yellowSignal.alpha = signalOff
            currentSignal = .red
        }
    }
}
// MARK: - CurrentSignal
extension ViewController {
    private enum CurrentSignal {
        case red, yellow, green
    }
}
