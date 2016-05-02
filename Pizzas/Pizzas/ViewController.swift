//
//  ViewController.swift
//  Pizzas
//
//  Created by Giovanni Launizar Ortiz on 01/05/16.
//  Copyright © 2016 GioIOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
   
    @IBOutlet weak var picketTamanio: UIPickerView!
    
    var picketDataSourceTamanios = ["","Chica", "Mediana", "Grande"];
    
    var seleccionTamanio = ""
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        picketTamanio.delegate = self
        picketTamanio.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picketDataSourceTamanios.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return picketDataSourceTamanios[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.seleccionTamanio = picketDataSourceTamanios[row]
        print(seleccionTamanio);
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let sigVista = segue.destinationViewController as! ViewControllerTipoMasa
        sigVista.tamanoPizzaSeleccionado = self.seleccionTamanio
    }
    
    @IBAction func continuar(sender: AnyObject) {
        print(self.seleccionTamanio)
        if self.seleccionTamanio == "" {
            let alertController = UIAlertController(title: "Tamaño pizza", message: "Debe seleccionar un tamaño", preferredStyle: UIAlertControllerStyle.Alert)
            let okayButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:  nil )

            alertController.addAction(okayButton)
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }


}

