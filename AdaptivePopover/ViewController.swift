//
//  ViewController.swift
//  AdaptivePopover
//
//  Created by akio0911 on 2016/02/15.
//  Copyright © 2016年 akio0911. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func presentPopover(sender:AnyObject, style:UIModalPresentationStyle) {
        let contentController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewControllerWithIdentifier("SettingNav")
        
        contentController.modalPresentationStyle = style
        
        guard let
            popPC = contentController.popoverPresentationController
            else {
                return
        }
        
        switch sender {
        case let item as UIBarButtonItem:
            popPC.barButtonItem = item
        case let view as UIView:
            popPC.sourceView = view
        default:
            ()
        }
        
        popPC.permittedArrowDirections = .Any
        
        self.presentViewController(contentController, animated: true, completion: nil)
    }

    @IBAction func pressSettingButton(sender: AnyObject) {
        let contentController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewControllerWithIdentifier("SettingNav")
        
        contentController.modalPresentationStyle = .Popover
        
        guard let
            popPC = contentController.popoverPresentationController,
            item = sender as? UIBarButtonItem
            else {
                return
        }
        
        popPC.barButtonItem = item
        
        popPC.permittedArrowDirections = .Any
        
        self.presentViewController(contentController, animated: true, completion: nil)
    }
    
    @IBAction func exitFromSettingByClose(segue:UIStoryboardSegue) {
        
    }

}

