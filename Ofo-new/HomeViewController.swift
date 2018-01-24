//
//  HomeViewController.swift
//  Ofo-new
//
//  Created by yons on 2017/9/21.
//  Copyright © 2017年 yons. All rights reserved.
//

import UIKit
import MapKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var arrowBtn: UIButton!
    @IBOutlet weak var panelView: UIView!
    @IBOutlet weak var tabBarStackView: UIStackView!
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var topConstraintPosToPanel: NSLayoutConstraint!
    
    //面板展开状态
    var isPanelCollapsed = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //面板弧度，与父视图宽度相同
        panelView.cornerRadius = view.frame.width
        
        
    }
    
    //手势与控制器的Action关联
    @IBAction func drag(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .changed:
            let translation = sender.translation(in: view)
            
            //如果是Y轴移动时
            if translation.y != 0 {
                movePanelView()
            }
            
            //        if translation.y > 0 {
            //            if isPanelCollapsed {
            //                movePanelView()
            //            }
            //        } else {
            //            if !isPanelCollapsed {
            //                movePanelView()
            //            }
        //        }
        default:
            break
        }
    }
    
    @IBAction func arrowBtnTap(_ sender: UIButton) {
        movePanelView()
    }
    
    func movePanelView()  {
        
        
        let deltaY = panelView.frame.height / 4.5
        let deltaYforStartBtn = panelView.frame.height / 4
        
        if isPanelCollapsed {
            arrowBtn.setImage(#imageLiteral(resourceName: "arrowup"), for: .normal)
            
            UIView.animate(withDuration: 0.3, animations: {
                self.panelView.transform = CGAffineTransform(translationX: 0, y: deltaY)
                self.startBtn.transform = CGAffineTransform(translationX: 0, y: deltaYforStartBtn)
                
                self.panelView.alpha = 0.9
                
                self.tabBarStackView.transform = CGAffineTransform(translationX: 0, y: deltaY)
                
                self.topConstraintPosToPanel.constant -= deltaY
                self.view.layoutIfNeeded()
            })
            
           
            
        }
        else {
            arrowBtn.setImage(#imageLiteral(resourceName: "arrowdown"), for: .normal)
            UIView.animate(withDuration: 0.3, animations: {
                self.panelView.transform = .identity
                self.startBtn.transform = .identity
                self.panelView.alpha = 1
                
                self.topConstraintPosToPanel.constant += deltaY
                self.view.layoutIfNeeded()
            })
            UIView.animate(withDuration: 0.5, animations: {
                self.tabBarStackView.transform = .identity
            })
            
        }
        
        isPanelCollapsed = !isPanelCollapsed
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
