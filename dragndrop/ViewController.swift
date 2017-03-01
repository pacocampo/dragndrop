//
//  ViewController.swift
//  dragndrop
//
//  Created by Francisco Ocampo Romero on 28/02/17.
//  Copyright © 2017 devf. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

  @IBOutlet weak var dragView: UIView!
  
  var lastLocation = CGPoint(x: 0, y: 0)
  var motionManager: CMMotionManager!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
//    let gesture = UIPanGestureRecognizer(target: self, action: #selector(self.detectPan))
    
    let swipe = UISwipeGestureRecognizer(target: self, action: #selector(self.detectPan))
    
    dragView.addGestureRecognizer(swipe)
    
    //acelerometro
    motionManager = CMMotionManager()
    motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
      if let myData = data {
        if myData.acceleration.x >= 2 {
        print(myData.acceleration.x)
        print(myData.acceleration.y)
        print(myData.acceleration.z)
        }
      }
    }
    
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func detectPan(gesture : UISwipeGestureRecognizer) {
    if gesture.direction == .left {
      print("izquierda")
    } else if gesture.direction == .right {
      dragView.isHidden = true
      print("derecha")
    }
//    let traslado = gesture.translation(in: self.view)
//    dragView.center = CGPoint(x:lastLocation.x + traslado.x, y: lastLocation.y + traslado.y)
//    print(traslado)
  }
  
//  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//    self.view.bringSubview(toFront: dragView)
//    lastLocation = dragView.center
//    print(lastLocation)
//  }
//  
//  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//    if lastLocation.x > 100 {
//      dragView.isHidden = true
//    }
//  }

}



















