//
//  ViewControllerTipoQueso.swift
//  Pizzas
//
//  Created by Giovanni Launizar Ortiz on 01/05/16.
//  Copyright © 2016 GioIOS. All rights reserved.
//

import UIKit

class ViewControllerTipoQueso: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate  {

    @IBOutlet weak var pickerQueso: UIPickerView!
    
    var picketDataSourceQueso = ["","Mozarela", "Cheddar", "Parmesano", "Sin queso"];
    var seleccionQueso = ""
    var seleccionMasa = ""
    var seleccionTamanio = ""
    
   
    var tamanoPizzaSeleccionado = ""
    var masaSeleccionado = ""
    
    override func viewWillAppear(animated: Bool) {
        seleccionMasa = masaSeleccionado
        seleccionTamanio = tamanoPizzaSeleccionado
        print("Masa Seleccionada: " + seleccionMasa)
        print("Tamano seleccionada : " + seleccionTamanio)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerQueso.delegate = self
        pickerQueso.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let sigVista = segue.destinationViewController as! ViewControllerIngredientes
        sigVista.tamanoPizzaSeleccionado = seleccionTamanio
        sigVista.masaSeleccionado = seleccionMasa
        sigVista.quesoSeleccionado = seleccionQueso
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picketDataSourceQueso.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return picketDataSourceQueso[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
        self.seleccionQueso = picketDataSourceQueso[row]
        print(seleccionQueso);
    
    }
    
    @IBAction func continuarIngredientes(sender: AnyObject) {
        print(self.seleccionQueso)
        if self.seleccionQueso == "" {
            let alertController = UIAlertController(title: "Tipo de queso", message: "Debe seleccionar un tipo de queso", preferredStyle: UIAlertControllerStyle.Alert)
            let okayButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:  nil )
    
            alertController.addAction(okayButton)
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    
    }
    

}
