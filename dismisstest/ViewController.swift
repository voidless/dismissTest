import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let g = UITapGestureRecognizer(target: self, action: #selector(presentVC))
        view.addGestureRecognizer(g)
    }

    @objc func presentVC() {
        let second = SecondVC(titleNum: 2)
        present(second, animated: true, completion: nil)
    }

}

class SecondVC: UIViewController {

    let titleNum: Int
    init(titleNum: Int) {
        self.titleNum = titleNum
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)

        var y: CGFloat = 50

        let label = UILabel(frame: CGRect(x: 10, y: y, width: 500, height: 40))
        label.text = "\(titleNum)"
        label.font = UIFont.systemFont(ofSize: 40)
        view.addSubview(label)

        y += 50

        let buttonS = UIButton(frame: CGRect(x: 10, y: y, width: 500, height: 40))
        buttonS.setTitle("dismiss on self after 2 sec", for: .normal)
        buttonS.setTitleColor(.black, for: .normal)
        buttonS.addTarget(self, action: #selector(dismissS), for: .touchUpInside)
        view.addSubview(buttonS)

        y += 50

        let buttonC = UIButton(frame: CGRect(x: 10, y: y, width: 500, height: 40))
        buttonC.setTitle("dismiss on child after 2 sec", for: .normal)
        buttonC.setTitleColor(.black, for: .normal)
        buttonC.addTarget(self, action: #selector(dismissC), for: .touchUpInside)
        view.addSubview(buttonC)

        y += 50

        let buttonP = UIButton(frame: CGRect(x: 10, y: y, width: 500, height: 40))
        buttonP.setTitle("dismiss on parent after 2 sec", for: .normal)
        buttonP.setTitleColor(.black, for: .normal)
        buttonP.addTarget(self, action: #selector(dismissP), for: .touchUpInside)
        view.addSubview(buttonP)

        let g = UITapGestureRecognizer(target: self, action: #selector(presentVC))
        view.addGestureRecognizer(g)
    }

    @objc func presentVC() {
        let second = SecondVC(titleNum: titleNum+1)
        present(second, animated: true, completion: nil)
    }

    @objc func dismissS() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.dismiss(animated: true, completion: nil)
        })
    }

    @objc func dismissC() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.presentedViewController?.dismiss(animated: true, completion: nil)
        })
    }

    @objc func dismissP() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.presentingViewController?.dismiss(animated: true, completion: nil)
        })
    }

}
