//
//  GameViewController.swift
//  TicTacToe2
//
//  Created by Baiana Usupbaeva on 2024-09-25.
//

import UIKit

class GameViewController: UIViewController {

    
    @IBOutlet weak var playerName1Lbl: UILabel!
    
    @IBOutlet weak var player1Score: UILabel!
    
    @IBOutlet weak var playerName2Lbl: UILabel!
    
    @IBOutlet weak var player2Score: UILabel!
    
    @IBOutlet weak var box1: UIImageView!
    
    @IBOutlet weak var box2: UIImageView!
    
    @IBOutlet weak var box3: UIImageView!
    
    @IBOutlet weak var box4: UIImageView!
    
    @IBOutlet weak var box5: UIImageView!
    
    @IBOutlet weak var box6: UIImageView!
    
    @IBOutlet weak var box7: UIImageView!
    
    @IBOutlet weak var box8: UIImageView!
    
    @IBOutlet weak var box9: UIImageView!
    
    
    
    // Variables for game state
        var currentPlayer = "X"  // Alternates between "X" and "O"
        var board: [String] = ["", "", "", "", "", "", "", "", ""]  // Game board
        var player1Points = 0
        var player2Points = 0
        
        var player1Name: String?
        var player2Name: String?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Set the player names in labels
            playerName1Lbl.text = player1Name ?? "Player 1"
            playerName2Lbl.text = player2Name ?? "Player 2"
            
            // Add tap gesture recognizers to each box
            addTapGesture(to: box1, index: 0)
            addTapGesture(to: box2, index: 1)
            addTapGesture(to: box3, index: 2)
            addTapGesture(to: box4, index: 3)
            addTapGesture(to: box5, index: 4)
            addTapGesture(to: box6, index: 5)
            addTapGesture(to: box7, index: 6)
            addTapGesture(to: box8, index: 7)
            addTapGesture(to: box9, index: 8)
        }
        
        // Function to add tap gesture recognizer to a box (UIImageView)
        func addTapGesture(to box: UIImageView, index: Int) {
            let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
            box.tag = index
            box.isUserInteractionEnabled = true
            box.addGestureRecognizer(tap)
        }
        
        // Function to handle tap on a box
        @objc func handleTap(_ sender: UITapGestureRecognizer) {
            let tappedBox = sender.view as! UIImageView
            let index = tappedBox.tag
            
            // Check if the box is empty before placing a mark
            if board[index] == "" {
                board[index] = currentPlayer
                tappedBox.image = UIImage(named: currentPlayer == "X" ? "X_image" : "O_image")  // Use your own X and O images
                
                // Check for a win or draw
                if checkForWin() {
                    // Show win message and update points
                    if currentPlayer == "X" {
                        player1Points += 1
                        player1Score.text = "\(player1Points)"
                    } else {
                        player2Points += 1
                        player2Score.text = "\(player2Points)"
                    }
                    resetBoard()
                } else if board.contains("") == false {
                    // It's a draw
                    showAlert(title: "It's a draw", message: "No one wins!")
                    resetBoard()
                } else {
                    // Switch player
                    currentPlayer = (currentPlayer == "X") ? "O" : "X"
                }
            }
        }
        
        // Function to check if a player has won
        func checkForWin() -> Bool {
            let winningCombinations = [
                [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
                [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
                [0, 4, 8], [2, 4, 6]  // Diagonals
            ]
            
            for combination in winningCombinations {
                if board[combination[0]] != "" &&
                    board[combination[0]] == board[combination[1]] &&
                    board[combination[1]] == board[combination[2]] {
                    showAlert(title: "Winner", message: "Player \(currentPlayer) wins!")
                    return true
                }
            }
            return false
        }
        
        // Function to reset the game board after a win or draw
        func resetBoard() {
            board = ["", "", "", "", "", "", "", "", ""]
            
            // Reset all boxes to empty
            [box1, box2, box3, box4, box5, box6, box7, box8, box9].forEach { box in
                box?.image = nil
            }
            
            // Optionally, switch starting player after each round
            currentPlayer = "X"
        }
        
        // Helper function to show an alert
        func showAlert(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    


