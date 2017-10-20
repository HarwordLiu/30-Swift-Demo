//
//  ThirdViewController.swift
//  FirstWeek
//
//  Created by 刘浩 on 2017/10/16.
//  Copyright © 2017年 HarwordLiu. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var contentLabel: UILabel!
    
    var timer: Timer?
    
    var timeData: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        fireTimer()
    }
    
    func startTimer() {
        if timer != nil {
            return
        }
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
            self.timeData += 0.1
            self.contentLabel.text = String(format: "%.1f", self.timeData)
        }
        
    }
    
    func fireTimer() {
        if timer == nil {
            return
        }
        timer?.invalidate()
        timer = nil
    }
    
    @IBAction func clickResetBtn(_ sender: UIButton) {
        fireTimer()
        timeData = 0.0
        contentLabel.text = "0.0"
    }
    
    @IBAction func clickStopBtn(_ sender: UIButton) {
        fireTimer()
    }
    
    @IBAction func clickGoBtn(_ sender: UIButton) {
        startTimer()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
