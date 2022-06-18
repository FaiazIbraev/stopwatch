//
//  ViewController.swift
//  Stopwatch_test
//
//  Created by Student on 16/6/22.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var secLabel: UILabel!
    @IBOutlet weak var Segment_control: UISegmentedControl!
    @IBOutlet weak var slider: UISlider!
    
    
    var hours: String = "00"
    var minutes: String = "00"
    var seconds: String = "00"
    
    var timer = Timer ()
    var isTimer: Bool = false
    
    var counterSec: Int = 0
    var counterMin: Int = 0
    var minState: Int = 0
    var hourStat: Int = 0
    
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playButton.isEnabled = true
        slider.isHidden = true
        
        hourLabel.text = hours
        minLabel.text = minutes
        secLabel.text = seconds
        
        if isTimer {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(makeStep), userInfo: nil, repeats: true)
        } else{
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(makeStepBack), userInfo: nil, repeats: true)
        }
        
    }
    
    @objc func makeStepBack(){
        if counterSec != 0{
            secLabel.text = "\(counterSec)"
            
        }else{
            timer.invalidate()
        }
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
        
        counterSec = 0
        counterMin = 0
    }
    
    
    @IBAction func pauseButton(_ sender: UIButton) {
        timer.invalidate()
        playButton.isEnabled = true
    }
    
    @IBAction func playButton(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(makeStep), userInfo: nil, repeats: true)
        
        playButton.isEnabled = false
    }
    
    @objc func makeStep(){
        print("Seconds: \(counterSec)")
        if counterSec < 10{
            seconds = "0\(counterSec)"
        } else{
            seconds = "\(counterSec)"}
        counterSec += 1
        secLabel.text = seconds
    }
    
    
    @IBAction func Segmented_control(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0 :
            print("0")
            view.backgroundColor = .white
            slider.isHidden = true
            reset()
        case 1 :
            print("1")
            view.backgroundColor = .darkGray
            slider.isHidden = false
            reset()
        default:
            print("You are wrong!")
        }
    }
    
    @IBAction func Slider_value_change(_ sender: UISlider) {
        secLabel.text = "\(Int (sender.value))"
        counterSec = Int (sender.value)
        print(counterSec)
    }
}


