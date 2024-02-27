//
//  BottomSheet.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 22.02.2024.
//

import UIKit

class BottomSheetView: UIView, UITextFieldDelegate {
    
    let title: UILabel = {
        let label = UILabel()
        label.font = UIFont.customFont(.bold, size: 24)
        label.text = "Info"
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.customFont(.regular, size: 14)
        label.text = "To submit an application for a tour reservation, you need to fill in your information and select the number of people for the reservation"
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let fieldLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.customFont(.medium, size: 14)
        label.text = "To submit an application for a tour reservation, you need to fill in your information and select the number of people for the reservation"
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let phoneNumberField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "(___)___-__-__"
        return textField
    }()
    
    let commentTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Write your wishes for trip..."
        return textField
    }()
    
    let button: CustomPrimaryButton = {
        let button = CustomPrimaryButton()
        #warning("TODO: Make disabled if phoneNumberFiled is empty")
        button.setTitle("Submit", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let grayBack: UIView = {
        let view = UIView()
        view.backgroundColor = .stepperBackgroundColor
        view.frame.size.height = 36
        view.layer.cornerRadius = view.frame.size.height / 2
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let increaseButton: CustomStepperButton = {
        let button = CustomStepperButton()
        button.setTitle("+", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    let decreaseButton: CustomStepperButton = {
        let button = CustomStepperButton()
        button.isEnabled = false 
        button.setTitle("-", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    var currentValue = 1 {
        didSet {
            currentValue = currentValue > 1 ? currentValue : 1
            decreaseButton.isEnabled = currentValue > 1 ? true : false
            increaseButton.isEnabled = currentValue < 10 ? true : false
            currentStepperValue.text = "\(currentValue)"
            conclusionText.text = "\(currentValue) People"
        }
    }
    
    private lazy var currentStepperValue: UILabel = {
        var label = UILabel()
        label.text = "\(currentValue)"
        label.textColor = .black
        label.font = UIFont.customFont(.black, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let peopleIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "user")
        icon.frame.size.height = 20
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    private lazy var conclusionText: UILabel = {
        var label = UILabel()
        label.text = "\(currentValue) People"
        label.font = UIFont.customFont(.medium, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Class Init
    #warning("TODO: Add Flag to phoneNumberField")
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configure()
        configureStepper()
        setupConstraints()
    }
    
    private func configure() {
        addSubview(title)
        addSubview(descriptionLabel)
        addSubview(phoneNumberField)
        addSubview(commentTextField)
        addSubview(button)
    }
    
    private func configureStepper() {
        clipsToBounds = true
        addSubview(grayBack)
        grayBack.addSubview(decreaseButton)
        grayBack.addSubview(currentStepperValue)
        grayBack.addSubview(increaseButton)
        addSubview(peopleIcon)
        addSubview(conclusionText)
    }
    
    @objc private func buttonAction(_ sender: UIButton) {
        switch sender {
        case decreaseButton:
            currentValue -= 1
        case increaseButton:
            currentValue += 1
        default:
            break
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BottomSheetView {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            descriptionLabel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -40),
            
            phoneNumberField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            phoneNumberField.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            phoneNumberField.widthAnchor.constraint(equalTo: descriptionLabel.widthAnchor),
            phoneNumberField.heightAnchor.constraint(equalToConstant: 50),
            
            
            commentTextField.topAnchor.constraint(equalTo: phoneNumberField.bottomAnchor, constant: 20),
            commentTextField.leadingAnchor.constraint(equalTo: phoneNumberField.leadingAnchor),
            commentTextField.widthAnchor.constraint(equalTo: descriptionLabel.widthAnchor),
            commentTextField.heightAnchor.constraint(equalToConstant: 50),
            
            grayBack.topAnchor.constraint(equalTo: commentTextField.bottomAnchor, constant: 20),
            grayBack.leadingAnchor.constraint(equalTo: commentTextField.leadingAnchor),
            grayBack.heightAnchor.constraint(equalToConstant: 36),
            grayBack.widthAnchor.constraint(equalToConstant: 104),
            
            button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            decreaseButton.leadingAnchor.constraint(equalTo: grayBack.leadingAnchor),
            decreaseButton.centerYAnchor.constraint(equalTo: grayBack.centerYAnchor),
            
            currentStepperValue.centerXAnchor.constraint(equalTo: grayBack.centerXAnchor),
            currentStepperValue.centerYAnchor.constraint(equalTo: grayBack.centerYAnchor),
            
            increaseButton.trailingAnchor.constraint(equalTo: grayBack.trailingAnchor),
            increaseButton.centerYAnchor.constraint(equalTo: grayBack.centerYAnchor),
            
            peopleIcon.leadingAnchor.constraint(equalTo: grayBack.trailingAnchor, constant: 16),
            peopleIcon.centerYAnchor.constraint(equalTo: grayBack.centerYAnchor),
            
            conclusionText.leadingAnchor.constraint(equalTo: peopleIcon.trailingAnchor, constant: 5),
            conclusionText.centerYAnchor.constraint(equalTo: peopleIcon.centerYAnchor),
        ])
    }
}

// MARK: - CustomStepperButton
class CustomStepperButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    func configure() {
        backgroundColor = .primaryColor
        frame.size.height = 36
        frame.size.width = 29
        layer.cornerRadius = frame.size.width / 2
        tintColor = .white
        titleLabel?.font = UIFont.customFont(.medium, size: 16)
        translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(.white, for: .normal)
    }
    
    override var isEnabled: Bool {
        didSet {
            if self.isEnabled == false {
                backgroundColor = .secondaryColor
            } else {
                backgroundColor = .primaryColor
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - CustomTextField
class CustomTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    func configure() {
        borderStyle = .none
        font = UIFont.customFont(.regular, size: 16)
        frame.size.height = 50
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = frame.size.height / 2
        layer.masksToBounds = false
        textAlignment = .left
        textColor = .black
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = true
        let paddingView = UIView(frame: CGRectMake(0, 0, 15, frame.size.height))
        leftView = paddingView
        leftViewMode = UITextField.ViewMode.always
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
