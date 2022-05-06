//
//  NoDataView.swift
//  LetsEat
//
//  Created by Daya Pangestu on 06/05/22.
//

import UIKit

class NoDataView: UIView {
    var view : UIView!
    @IBOutlet var titleLabel : UILabel!
    @IBOutlet var descLabel :UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init(coder : NSCoder) {
        super.init(coder: coder)!
        setUpView()
    }
    
    func loadFromNib() -> UIView {
        let nib = UINib(nibName: "NoDataView", bundle: Bundle.main)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    func setUpView(){
        view = loadFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        addSubview(view)
    }
    
    func set(title :String, desc : String){
        titleLabel.text = title
        descLabel.text = desc
    }
    

}
