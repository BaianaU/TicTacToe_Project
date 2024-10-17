//
//  ViewController.swift
//  TicTacToe2
//
//  Created by Baiana Usupbaeva on 2024-09-23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField1: UITextField!  // Text field for Player 1
    @IBOutlet weak var nameField2: UITextField!  // Text field for Player 2
    
    // Action for the Start Button
    @IBAction func startBtn(_ sender: UIButton) {
        // Perform the segue when the Start button is pressed
        performSegue(withIdentifier: "startGameSegue", sender: self)}
    
   override func viewDidLoad() {
        super.viewDidLoad()}
    
    // Prepare method to pass the player names to GameViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startGameSegue" {
            // Cast the destination as GameViewController
            let destinationVC = segue.destination as! GameViewController
            
            // Pass the text from the text fields (player names) to GameViewController
            destinationVC.player1Name = nameField1.text
            destinationVC.player2Name = nameField2.text
        }
    }

}
