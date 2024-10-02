//
//  ViewController.swift
//  drink
//
//  Created by 陳曉潼 on 2024/9/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var orderName: UITextField!
    @IBOutlet weak var teaSelect: UISegmentedControl!
    @IBOutlet weak var sizeSelect: UISegmentedControl!
    @IBOutlet weak var sugarSlide: UISlider!
    @IBOutlet weak var coldAndHotSelect: UISegmentedControl!
    @IBOutlet weak var iceSlide: UISlider!
    @IBOutlet weak var iceMinusButton: UIButton!
    @IBOutlet weak var icePlusButton: UIButton!
    @IBOutlet weak var orderList: UILabel!
    @IBOutlet weak var addBubble: UISwitch!
    @IBOutlet weak var sugarLabel: UILabel!
    @IBOutlet weak var iceLabel: UILabel!
    // 先宣告tea(紅茶 綠茶 青茶 烏龍茶)
    var tea = ""
    // 宣告飲料的size(中杯 大杯)
    var size = ""
    // 宣告飲料要冷飲或是熱飲(冰 熱)
    var temperature = ""
    // 宣告珍珠
    var bubble = ""
    // 點餐字串
    var order = ""
    // 點空白處收鍵盤
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          self.view.endEditing(true)
        }
        
    // 點return鍵收鍵盤
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder();
           return true
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // 選擇茶類的SegmentControl
    @IBAction func teaChange(_ sender: UISegmentedControl) {
        if teaSelect.selectedSegmentIndex == 0 {
            tea = "紅茶"
        }else if teaSelect.selectedSegmentIndex == 1 {
            tea = "綠茶"
        }else if teaSelect.selectedSegmentIndex == 2 {
            tea = "青茶"
        }else if teaSelect.selectedSegmentIndex == 3 {
            tea = "烏龍茶"
        }
    }
    // 選擇飲料大小杯的SegmentControl
    @IBAction func sizeChange(_ sender: UISegmentedControl) {
        if sizeSelect.selectedSegmentIndex == 0 {
            size = "中杯"
        }else if sizeSelect.selectedSegmentIndex == 1 {
            size = "大杯"
        }
    }
    // 調整甜度的Slider 範圍是1-5
    @IBAction func sugarChange(_ sender: UISlider) {
        if sugarSlide.value.rounded() == 1 {
            sugarLabel.text = "無糖"
        }else if sugarSlide.value.rounded() == 2 {
            sugarLabel.text = "微糖"
        }else if sugarSlide.value.rounded() == 3 {
            sugarLabel.text = "半糖"
        }else if sugarSlide.value.rounded() == 4 {
            sugarLabel.text = "少糖"
        }else if sugarSlide.value.rounded() == 5 {
            sugarLabel.text = "全糖"
        }
    }
    // 利用減號button減少sugarSlider的值
    @IBAction func sugarMinus(_ sender: UIButton) {
        if sugarSlide.value>1 {
            sugarSlide.value-=1
        }
        if sugarSlide.value.rounded() == 1 {
            sugarLabel.text = "無糖"
        }else if sugarSlide.value.rounded() == 2 {
            sugarLabel.text = "微糖"
        }else if sugarSlide.value.rounded() == 3 {
            sugarLabel.text = "半糖"
        }else if sugarSlide.value.rounded() == 4 {
            sugarLabel.text = "少糖"
        }else if sugarSlide.value.rounded() == 5 {
            sugarLabel.text = "全糖"
        }
    }
    // 利用加號button增加sugarSlider的值
    @IBAction func sugarPlus(_ sender: UIButton) {
        if sugarSlide.value<5 {
            sugarSlide.value+=1
        }
        if sugarSlide.value.rounded() == 1 {
            sugarLabel.text = "無糖"
        }else if sugarSlide.value.rounded() == 2 {
            sugarLabel.text = "微糖"
        }else if sugarSlide.value.rounded() == 3 {
            sugarLabel.text = "半糖"
        }else if sugarSlide.value.rounded() == 4 {
            sugarLabel.text = "少糖"
        }else if sugarSlide.value.rounded() == 5 {
            sugarLabel.text = "全糖"
        }
    }
    // 選擇飲料要冷飲或是熱飲
    @IBAction func coldAndHotChange(_ sender: UISegmentedControl) {
        if coldAndHotSelect.selectedSegmentIndex == 0 {
            temperature = ""
            iceSlide.isHidden = false
            iceMinusButton.isHidden = false
            icePlusButton.isHidden = false
        }else if coldAndHotSelect.selectedSegmentIndex == 1 {
            temperature = "熱飲"
            iceSlide.isHidden = true
            iceMinusButton.isHidden = true
            icePlusButton.isHidden = true
        }
    }
    // 調整冰塊的Slider 範圍是1-4
    @IBAction func iceChange(_ sender: UISlider) {
        if iceSlide.value.rounded() == 1 {
            iceLabel.text = "去冰"
        }else if iceSlide.value.rounded() == 2 {
            iceLabel.text = "微冰"
        }else if iceSlide.value.rounded() == 3 {
            iceLabel.text = "少冰"
        }else if iceSlide.value.rounded() == 4 {
            iceLabel.text = "正常冰"
        }
    }
    // 利用減號button減少iceSlider的值
    @IBAction func iceMinus(_ sender: UIButton) {
        if iceSlide.value>1 {
            iceSlide.value-=1
        }
        if iceSlide.value.rounded() == 1 {
            iceLabel.text = "去冰"
        }else if iceSlide.value.rounded() == 2 {
            iceLabel.text = "微冰"
        }else if iceSlide.value.rounded() == 3 {
            iceLabel.text = "少冰"
        }else if iceSlide.value.rounded() == 4 {
            iceLabel.text = "正常冰"
        }
    }
    // 利用加號button增加iceSlider的值
    @IBAction func icePlus(_ sender: UIButton) {
        if iceSlide.value<5 {
            iceSlide.value+=1
        }
        if iceSlide.value.rounded() == 1 {
            iceLabel.text = "去冰"
        }else if iceSlide.value.rounded() == 2 {
            iceLabel.text = "微冰"
        }else if iceSlide.value.rounded() == 3 {
            iceLabel.text = "少冰"
        }else if iceSlide.value.rounded() == 4 {
            iceLabel.text = "正常冰"
        }
    }
    @IBAction func addBubble(_ sender: UISwitch) {
        if addBubble.isOn {
            bubble = "加珍珠"
        }
    }
    // 訂購按鈕
    @IBAction func order(_ sender: UIButton) {
        orderList.textColor = UIColor.black
        orderList.font = UIFont.systemFont(ofSize: 14)
        order.append("\(orderName.text!) 訂了 \(tea)拿鐵 \(size) \(sugarLabel.text!) \(temperature) \(iceLabel.text!) \(bubble) \n")
        orderList.text = order
        // 按了訂購以後恢復初始值
        orderName.text = ""
        teaSelect.selectedSegmentIndex = 0
        sizeSelect.selectedSegmentIndex = 0
        sugarSlide.value = 1
        sugarLabel.text = "無糖"
        iceSlide.value = 1
        iceLabel.text = "去冰"
        addBubble.isOn = false
    }
    // 清除按鈕
    @IBAction func reset(_ sender: UIButton) {
        order = ""
        orderList.text = order
    }
}

