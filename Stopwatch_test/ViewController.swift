//
//  ViewController.swift
//  Stopwatch_test
//
//  Created by Student on 16/6/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var secLabel: UILabel!
    
    var hours: String = "00"
    var minutes: String = "00"
    var seconds: String = "00"
    var timer = Timer ()
    var counter: Int = 0

    
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playButton.isEnabled = true
        
        hourLabel.text = hours
        minLabel.text = minutes
        secLabel.text = seconds

    }

    @IBAction func stopButton(_ sender: UIButton) {
        print("Stop")
        timer.invalidate()
        reset()
        playButton.isEnabled = true
    }
    
    func reset (){
        hourLabel.text = "00"
        minLabel.text = "00"
        secLabel.text = "00"
        
    }
    
    
    @IBAction func pauseButton(_ sender: UIButton) {
        print("Pause")
        timer.invalidate()
        playButton.isEnabled = true
    }
    
    @IBAction func playButton(_ sender: UIButton) {
        print("Play")
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(makeStep), userInfo: nil, repeats: true)
    
        playButton.isEnabled = false
    }
    
    @objc func makeStep(){
        print("Seconds: \(counter)")
        if counter < 10{
            seconds = "0\(counter)"
        } else{
            seconds = "\(counter)"}
        counter += 1
        secLabel.text = seconds
    }
    
}

