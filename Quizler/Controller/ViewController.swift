//
//  ViewController.swift
//  Quizler
//
//  Created by Artur Imanbaev on 03.02.2023.
//

import UIKit

class ViewController: UIViewController {

    var quizBrain = QuizBrain()
    let questionLabel: UILabel = {
        $0.text = ""
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 30)
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    let trueButton: UIButton = {
        $0.layer.cornerRadius = 30
        $0.setTitle("True", for: .normal)
        $0.backgroundColor = UIColor.black
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
    let falseButton: UIButton = {
        $0.layer.cornerRadius = 30
        $0.setTitle("False", for: .normal)
        $0.backgroundColor = UIColor.black
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.07843137532, green: 0.09411765635, blue: 0.7803922296, alpha: 1)
        setupConstraints()
        questionLabel.text = quizBrain.getQuestionText()
        trueButton.addTarget(self, action: #selector(checkAnswer), for: .touchUpInside)
        falseButton.addTarget(self, action: #selector(checkAnswer), for: .touchUpInside)
    }

    @objc func checkAnswer(_ sender: UIButton){
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
            if userGotItRight {
                sender.backgroundColor = UIColor.green
            } else {
                sender.backgroundColor = UIColor.red
            }
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor  = UIColor.black
        falseButton.backgroundColor  = UIColor.black
    }
}



extension ViewController{
    func setupConstraints(){
        view.addSubview(questionLabel)
        view.addSubview(trueButton)
        view.addSubview(falseButton)
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 1),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: questionLabel.bottomAnchor, multiplier: 50),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: questionLabel.trailingAnchor, multiplier: 1),
            questionLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            trueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            trueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            trueButton.heightAnchor.constraint(equalToConstant: 70),
            trueButton.widthAnchor.constraint(equalToConstant: 300),
            falseButton.topAnchor.constraint(equalToSystemSpacingBelow: trueButton.bottomAnchor, multiplier: 2),
            falseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            falseButton.heightAnchor.constraint(equalToConstant: 70),
            falseButton.widthAnchor.constraint(equalToConstant: 300),
        ])
    }
}




