//
//  ViewController.swift
//  FirstArkit
//
//  Created by msano on 2017/09/28.
//  Copyright © 2017年 msano. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        let scene = SCNScene(named: "art.scnassets/Bear_Brown/Bear_Brown.scn")!
        // Set the scene to the view
        sceneView.scene = scene
        routeScene(scene: sceneView.scene)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
    // MEMO: 平面検知？？？
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let planeAncher = anchor as? ARPlaneAnchor else {
//            print("😈")
            return
        }
//        print("😎")
        let plane = SCNPlane(
            width: CGFloat(planeAncher.extent.x),
            height: CGFloat(planeAncher.extent.y)
        )
        let planeNode = SCNNode(geometry: plane)
        planeNode.position = SCNVector3Make(
            planeAncher.extent.x,
            planeAncher.extent.y,
            planeAncher.extent.z
        )
        planeNode.transform = SCNMatrix4MakeRotation(-Float.pi / 2, 1, 0, 0)
        node.addChildNode(planeNode)
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    // MARK: private
    private func routeScene(scene: SCNScene) {
//        for i in 0...360 {
//            scene.rootNode.position.y = Float(i)
//            sleep(1)
//        }
        scene.rootNode.position.y = 200.0
    }
}
