//
//  ResistenciaVC.swift
//  Resistencias
//
//  Created by FabVinco on 11/29/16.
//  Copyright © 2016 FabVinco. All rights reserved.
//

import UIKit

class ResistenciaVC: UIViewController {

    @IBOutlet weak var ivwResistencia: UIImageView!
    @IBOutlet weak var btnChangeResis: UIButton!
    @IBOutlet weak var pkList: UIPickerView!
    @IBOutlet weak var btnCifra1: UIButton!
    @IBOutlet weak var vwListView: UIView!
    @IBOutlet weak var vwContenedor: UIView!
    @IBOutlet weak var btnAceptarColor: UIButton!
    @IBOutlet weak var btnCifra2: UIButton!
    @IBOutlet weak var btnCifra3: UIButton!
    @IBOutlet weak var btnToler: UIButton!
    @IBOutlet weak var lblCifra1: UILabel!
    @IBOutlet weak var lblCifra2: UILabel!
    @IBOutlet weak var lblCifra3: UILabel!
    @IBOutlet weak var lblToler: UILabel!
    @IBOutlet weak var txtResistencia: UITextField!
    
    var valueCifra1:Int?
    var valueCifra2:Int?
    var valueCifra3:Int?
    var valueToler:Float?
    
    let dicResistencia = ["AquaResistance","BlueResistance","PinkResistance"]
    let dicColors =
        ["Negro":UIColor(red: 16/255, green: 14/255, blue: 24/255, alpha: 1),
         "Marrón":UIColor(red: 118/255, green: 76/255, blue: 60/255, alpha: 1),
         "Rojo":UIColor(red: 193/255, green: 0/255, blue: 67/255, alpha: 1),
         "Naranja":UIColor(red: 252/255, green: 130/255, blue: 7/255, alpha: 1),
         "Amarillo":UIColor(red: 252/255, green: 212/255, blue: 47/255, alpha: 1),
         "Verde":UIColor(red: 119/255, green: 169/255, blue: 75/255, alpha: 1),
         "Azul":UIColor(red: 57/255, green: 123/255, blue: 199/255, alpha: 1),
         "Violeta":UIColor(red: 144/255, green: 67/255, blue: 153, alpha: 1),
         "Gris":UIColor(red: 120/255, green: 130/255, blue: 131/255, alpha: 1),
         "Blanco":UIColor(red: 254/255, green: 255/255, blue: 254/255, alpha: 1),
         "Oro":UIColor(red:250/255, green:202/255, blue:48/255, alpha:1),
         "Plata":UIColor(red: 59/255, green: 60/255, blue: 60/255, alpha: 1)]
    var potisionDicRes:Int!
    var positionActual:String!
    let datos = ["cifra1":["Negro", "Marrón", "Rojo", "Naranja", "Amarillo", "Verde", "Azul", "Violeta", "Gris", "Blanco"],
                 "cifra2": ["Negro", "Marrón", "Rojo", "Naranja", "Amarillo", "Verde", "Azul", "Violeta", "Gris", "Blanco"],
                 "cifra3":["Negro", "Marrón", "Rojo", "Naranja", "Amarillo", "Verde", "Azul", "Violeta", "Gris", "Blanco", "Oro", "Plata"],
                 "toler":["Marrón", "Rojo", "Verde", "Oro", "Plata", "Sin Color"]]
    
    let datosNumericos = ["cifra1":[0,1,2,3,4,5,6,7,8,9],
                          "cifra2":[0,1,2,3,4,5,6,7,8,9],
                          "cifra3":[0,1,2,3,4,5,6,7,8,9,-1,-2],
                          "toler":[1.0,2.0,0.5,5.0,10.0,20.0]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        potisionDicRes = 0
        valueToler = 0
        ivwResistencia.image = UIImage(named: dicResistencia[potisionDicRes])

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: ACTIONS
    func initcomponentList(){
        if vwListView == nil{
            Bundle.main.loadNibNamed("SelectElement", owner: self, options: [:])
            pkList.layer.cornerRadius = 10
            vwContenedor.layer.cornerRadius = 15
            pkList.dataSource = self
            pkList.delegate = self
            let frame = self.view.bounds
            vwListView.frame = frame
            view.addSubview(vwListView)
        }else if vwListView.superview == nil{
            view.addSubview(vwListView)
        }

    }
    
    @IBAction func listCifra1(_ sender: Any) {
        positionActual = "cifra1"
        initcomponentList()
    }
    @IBAction func listCifra2(_ sender: Any) {
        positionActual = "cifra2"
        initcomponentList()
    }
    @IBAction func listCifra3(_ sender: Any) {
        positionActual = "cifra3"
        initcomponentList()
    }
    @IBAction func listTolerancia(_ sender: Any) {
        positionActual = "toler"
        initcomponentList()
    }
    
    @IBAction func changeImageResistencia(_ sender: Any) {
        if (potisionDicRes + 1 ) < dicResistencia.count {
            potisionDicRes = potisionDicRes +  1
        }else{
            potisionDicRes = 0
        }
        ivwResistencia.image = UIImage(named: dicResistencia[potisionDicRes])
    }
    @IBAction func aceptColor(_ sender: Any) {
        let colorSelect = dicColors[datos[positionActual]![pkList.selectedRow(inComponent: 0)]]
        
        let valueSelect = datosNumericos[positionActual]![pkList.selectedRow(inComponent: 0)]
        switch(positionActual){
        case "cifra1":
            btnCifra1.backgroundColor = colorSelect
            btnCifra1.setTitle("\(valueSelect)", for: .normal)
            valueCifra1 = valueSelect as? Int
            lblCifra1.backgroundColor = colorSelect
            break
        case "cifra2":
            btnCifra2.backgroundColor = colorSelect
            btnCifra2.setTitle("\(valueSelect)", for: .normal)
            valueCifra2 = valueSelect as? Int
            lblCifra2.backgroundColor = colorSelect
            break
        case "cifra3":
            btnCifra3.backgroundColor = colorSelect
            btnCifra3.setTitle("x10^\(valueSelect)", for: .normal)
            valueCifra3 = valueSelect as? Int
            lblCifra3.backgroundColor = colorSelect
            break
        case "toler":
            btnToler.backgroundColor = colorSelect
            btnToler.setTitle("+/-\(valueSelect)", for: .normal)
            valueToler = Float(valueSelect as! Double)
            lblToler.backgroundColor = colorSelect
            break
        default:
            break
        }
        calcularResistencia(cifra1: valueCifra1, cifra2: valueCifra2, cifra3: valueCifra3, toler: valueToler)
        pkList.dataSource = nil
        pkList.delegate = nil
        vwListView.removeFromSuperview()
        vwListView = nil
    }
    
    func calcularResistencia(cifra1:Int?, cifra2:Int?, cifra3:Int?, toler:Float?){
        if cifra1 != nil, cifra2 != nil, cifra3 != nil, toler != nil {
            let valor = ((cifra1! * 10) + cifra2!)
            let potencia = pow(10, cifra3!)
            let valorFinal = valor * Int(NSDecimalNumber(decimal:potencia))
            txtResistencia.text = "\(valorFinal/1000) Kohms" + ( toler != 0 ? ", +/-\(toler!)" : "" )
        }else{
            print("faltan valores")
        }
    }
    
}


extension ResistenciaVC:UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.datos[self.positionActual]!.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.datos[self.positionActual]![row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row)
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel = view as! UILabel!
        if view == nil {
            pickerLabel = UILabel()
            let hue = CGFloat(row)/CGFloat(self.datos[self.positionActual]!.count)
            if let color = dicColors[self.datos[self.positionActual]![row]] {
                pickerLabel?.backgroundColor = color
            }else {
            pickerLabel?.backgroundColor = UIColor(hue: hue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
            }
        }
        
        let titleData = self.datos[self.positionActual]![row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 26.0)!,NSForegroundColorAttributeName:UIColor.black])
        pickerLabel!.attributedText = myTitle
        pickerLabel!.textColor = UIColor.white
        pickerLabel!.textAlignment = .center
        return pickerLabel!
    }
}
