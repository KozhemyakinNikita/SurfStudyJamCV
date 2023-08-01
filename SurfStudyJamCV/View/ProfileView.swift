
import UIKit

class ProfileView: UIView {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    lazy var bioStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor = UIColor.Colors.skillsBackground
        stack.spacing = 16.0
        stack.alignment = .center
        return stack
    }()
    
    lazy var infoStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor = UIColor.Colors.skillsBackground
        stack.spacing = 4.0
        stack.alignment = .center
        return stack
    }()
    
    lazy var placeHStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.backgroundColor = UIColor.Colors.skillsBackground
        stack.spacing = 2.0
        stack.alignment = .center
        return stack
    }()
    
    let imageView = UIImageView()
    let textName = UITextView()
    let textBioInfo = UITextView()
    let placeLabel = UILabel()
    let placeIcon = UIImageView(image: UIImage(named: "placeIcon"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        addSubview(scrollView)
        scrollView.addSubview(bioStackView)
        bioStackView.addArrangedSubview(imageView)
        bioStackView.addArrangedSubview(infoStackView)
        infoStackView.addArrangedSubview(textName)
        infoStackView.addArrangedSubview(textBioInfo)
        infoStackView.addArrangedSubview(placeHStack)
        placeHStack.addArrangedSubview(placeIcon)
        placeHStack.addArrangedSubview(placeLabel)
        
        setupConstraints()
        setupBioStackView()
    }
    
    private func setupConstraints() {
        
        addSubview(scrollView)
        scrollView.addSubview(bioStackView)
        bioStackView.addArrangedSubview(imageView)
        bioStackView.addArrangedSubview(infoStackView)
        infoStackView.addArrangedSubview(textName)
        infoStackView.addArrangedSubview(textBioInfo)
        infoStackView.addArrangedSubview(placeHStack)
        placeHStack.addArrangedSubview(placeIcon)
        placeHStack.addArrangedSubview(placeLabel)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        bioStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bioStackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 16),
            bioStackView.leadingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leadingAnchor, constant: 35),
            bioStackView.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor, constant: -35),
        ])
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoStackView.leadingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leadingAnchor, constant: 35),
            infoStackView.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor, constant: -35),
        ])
        
        textName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textName.leadingAnchor.constraint(equalTo: infoStackView.leadingAnchor, constant: 62),
            textName.trailingAnchor.constraint(equalTo: infoStackView.trailingAnchor, constant: -62),
        ])
        
        textBioInfo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textBioInfo.leadingAnchor.constraint(equalTo: infoStackView.leadingAnchor),
            textBioInfo.trailingAnchor.constraint(equalTo: infoStackView.trailingAnchor),
        ])
    }
    func setupBioStackView() {
        bioStackView.backgroundColor = UIColor.Colors.skillsBackground
        setupImageView()
        setupTextName()
        setupTextBioInfo()
        setupPlaceHStack()
    }
    
    func setupImageView() {
        imageView.backgroundColor = .blue
        imageView.backgroundColor = UIColor.Colors.skillsBackground
    }
    
    func setupTextName() {
        textName.font = UIFont.boldSystemFont(ofSize: 24)
        textName.textAlignment = .center
        textName.textContainer.maximumNumberOfLines = 2
        textName.isScrollEnabled = false
        textName.textContainer.lineBreakMode = .byTruncatingTail
        
    }
    
    func setupTextBioInfo() {
        textBioInfo.font = UIFont.systemFont(ofSize: 14)
        textBioInfo.textColor = .lightGray
        textBioInfo.textAlignment = .center
        textBioInfo.textContainer.maximumNumberOfLines = 2
        textBioInfo.isScrollEnabled = false
        textBioInfo.textContainer.lineBreakMode = .byTruncatingTail
    }
    
    func setupPlaceLabel() {
        placeLabel.font = UIFont.systemFont(ofSize: 14)
        placeLabel.textColor = .lightGray
        placeLabel.numberOfLines = 1
    }
    
    func setupPlaceHStack() {
        setupPlaceLabel()
    }
    
    func configure(with person: Person) {
        imageView.image = person.profileImage
        textName.text = person.name
        textBioInfo.text = person.bioInfo
        placeLabel.text = person.location
    }
}
