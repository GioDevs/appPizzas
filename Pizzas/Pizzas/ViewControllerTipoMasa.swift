//
//  ViewControllerTipoMasa.swift
//  Pizzas
//
//  Created by Giovanni Launizar Ortiz on 01/05/16.
//  Copyright © 2016 GioIOS. All rights reserved.
//

import UIKit

class ViewControllerTipoMasa: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate  {

    @IBOutlet weak var pickerMasa: UIPickerView!
    
    var picketDataSourceMasa = ["","Delgada", "Crujiente", "Gruesa"];
    var seleccionMasa = ""
    var tamanoPizza : String  = ""
    
    var tamanoPizzaSeleccionado = ""
    var masaSeleccionado = ""
    
    override func viewWillAppear(animated: Bool) {
        tamanoPizza = tamanoPizzaSeleccionado
        print("seleccionada : " + tamanoPizza)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerMasa.delegate = self
        pickerMasa.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let sigVista = segue.destinationViewController as! ViewControllerTipoQueso
        sigVista.tamanoPizzaSeleccionado = self.tamanoPizza
        sigVista.masaSeleccionado = self.seleccionMasa
    }
 
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picketDataSourceMasa.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return picketDataSourceMasa[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.seleccionMasa = picketDataSourceMasa[row]
        print(seleccionMasa);
        
    }
    
    @IBAction func continuarIngredientes(sender: AnyObject) {
        print(self.seleccionMasa)
        if self.seleccionMasa == "" {
            let alertController = UIAlertController(title: "Tipo de masa", message: "Debe seleccionar un tipo de masa", preferredStyle: UIAlertControllerStyle.Alert)
            let okayButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:  nil )
            
            alertController.addAction(okayButton)
            self.presentViewController(alertController, animated: true, completion: nil)
        }

    }

}
