import UIKit


final class AnimatedSymbolExampleViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(
            systemName: "wifi",
            variableValue: 0.0,
            configuration: UIImage.SymbolConfiguration(paletteColors: [.darkGray])
        )
        imageView.image = image
        return imageView
    }()
    
    private lazy var animatedButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .large
        config.title = "Start Animating"
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonDidClick(_:)), for: .touchUpInside)
        return button
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(animatedButton)
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    func setupLayout() {
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            animatedButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func buttonDidClick(_ sender: UIButton) {
        /*
         
        // Bonuce Effect
        imageView.addSymbolEffect(.bounce)
        
        // Pulse Effect
        imageView.addSymbolEffect(.pulse)
        
        // Scale Effect
        imageView.addSymbolEffect(.scale)
        
        // VariableColor Effect
        imageView.addSymbolEffect(.variableColor.iterative)
        imageView.removeSymbolEffect(ofType:.variableColor)
         
        */
        
        // Image Transition
        imageView.setSymbolImage(UIImage(systemName: "swift")!, contentTransition: .replace.offUp)
        print("Animated: Bounce Effect")
    }
}
