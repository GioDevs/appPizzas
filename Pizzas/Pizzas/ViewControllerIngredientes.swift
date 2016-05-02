//
//  ViewControllerIngredientes.swift
//  Pizzas
//
//  Created by Giovanni Launizar Ortiz on 01/05/16.
//  Copyright © 2016 GioIOS. All rights reserved.
//

import UIKit

class ViewControllerIngredientes: UIViewController {
    
    
    @IBOutlet weak var swJamon: UISwitch!
    @IBOutlet weak var swPepperoni: UISwitch!
    @IBOutlet weak var swPavo: UISwitch!
    @IBOutlet weak var swSalchicha: UISwitch!
    @IBOutlet weak var swCebolla: UISwitch!
    @IBOutlet weak var swAceituna: UISwitch!
    @IBOutlet weak var swPimiento: UISwitch!
    @IBOutlet weak var swPina: UISwitch!
    @IBOutlet weak var swAnchoa: UISwitch!
    
    var ingredientes = [String : String]()
    
    var cantidadIngredientes : Int = 0
    
    var seleccionQueso = ""
    var seleccionMasa = ""
    var seleccionTamanio = ""
    
    var tamanoPizzaSeleccionado = ""
    var masaSeleccionado = ""
    var quesoSeleccionado = ""
    
    
    
    override func viewWillAppear(animated: Bool) {
        seleccionMasa = masaSeleccionado
        seleccionTamanio = tamanoPizzaSeleccionado
        seleccionQueso = quesoSeleccionado
        print("Masa Seleccionada: " + seleccionMasa)
        print("Tamano seleccionada : " + seleccionTamanio)
        print("Queso Seleccionado: " + quesoSeleccionado)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        swJamon.addTarget(self, action: #selector(ViewControllerIngredientes.switchJamonIsChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        swPepperoni.addTarget(self, action: #selector(ViewControllerIngredientes.switchPeperoniIsChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        swPavo.addTarget(self, action: #selector(ViewControllerIngredientes.switchPavoiIsChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        swSalchicha.addTarget(self, action: #selector(ViewControllerIngredientes.switchSalchiIsChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)

        swCebolla.addTarget(self, action: #selector(ViewControllerIngredientes.switchAceitunaIsChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        swAceituna.addTarget(self, action: #selector(ViewControllerIngredientes.switchCebollaIsChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        swPimiento.addTarget(self, action: #selector(ViewControllerIngredientes.switchPimientoIsChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        swPina.addTarget(self, action: #selector(ViewControllerIngredientes.switchPinaIsChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        swAnchoa.addTarget(self, action: #selector(ViewControllerIngredientes.switchAnchoaIsChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let sigVista = segue.destinationViewController as! ViewControllerConfirmacion
        sigVista.tamanoPizzaSeleccionado = seleccionTamanio
        sigVista.masaSeleccionado = seleccionMasa
        sigVista.quesoSeleccionado = seleccionQueso
        sigVista.ingredientesSeleccionados = ingredientes
    }
 
    

    @IBAction func continuarIngredientes(sender: AnyObject) {
        print(ingredientes)
        
        if ingredientes.count == 0 {
            let alertController = UIAlertController(title: "Ingredientes", message: "Debe seleccionar al menos un ingrediente", preferredStyle: UIAlertControllerStyle.Alert)
            let okayButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:  nil )
            
            alertController.addAction(okayButton)
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
    }
    
    func enableSwitch(seleccionados : Int){
    
        
        if seleccionados >= 5 {
            if (!swJamon.on){
                swJamon.enabled = false
            }
            if (!swPepperoni.on){
                swPepperoni.enabled = false
            }
            if (!swPavo.on){
                swPavo.enabled = false
            }
            if (!swSalchicha.on){
                swSalchicha.enabled = false
            }
            if (!swCebolla.on){
                swCebolla.enabled = false
            }
            if (!swAceituna.on){
                swAceituna.enabled = false
            }
            if (!swPimiento.on){
                swPimiento.enabled = false
            }
            if (!swPina.on){
                swPina.enabled = false
            }
            if (!swAnchoa.on){
                swAnchoa.enabled = false
            }
        }
        
        if(seleccionados < 5){
            swJamon.enabled = true
            swPepperoni.enabled = true
            swPavo.enabled = true
            swSalchicha.enabled = true
            swCebolla.enabled = true
            swAceituna.enabled = true
            swPimiento.enabled = true
            swPina.enabled = true
            swAnchoa.enabled = true

        }
        
        
    }
    
    func switchJamonIsChanged(mySwitch: UISwitch) {
        print("Jamon")
        
        if mySwitch.on {
            cantidadIngredientes += 1;
            ingredientes["ja"] = "Jamón"
            print("on")
        } else {
            print("of")
            if (cantidadIngredientes > 0 ){
                cantidadIngredientes -= 1;
            }
            ingredientes.removeValueForKey("ja")
        }
        print ("\(ingredientes)")
        print(cantidadIngredientes)
        enableSwitch(cantidadIngredientes)
    }
    
    func switchPeperoniIsChanged(mySwitch: UISwitch) {
        print("Peperoni")
        if mySwitch.on {
            print("on")
            cantidadIngredientes += 1;
            ingredientes["pe"] = "Pepperoni"
        } else {
            print("of")
            if (cantidadIngredientes > 0 ){
                cantidadIngredientes -= 1;
            }
            ingredientes.removeValueForKey("pe")

        }
        
        print ("\(ingredientes)")
        print(cantidadIngredientes)
        enableSwitch(cantidadIngredientes)
    }
    
    func switchPavoiIsChanged(mySwitch: UISwitch) {
        print("Pavo")
        if mySwitch.on {
            print("on")
            cantidadIngredientes += 1;
            ingredientes["pa"] = "Pavo"
        } else {
            print("of")
            if (cantidadIngredientes > 0 ){
                cantidadIngredientes -= 1;
            }
             ingredientes.removeValueForKey("pa")
                
        }
        print ("\(ingredientes)")
        print(cantidadIngredientes)
        enableSwitch(cantidadIngredientes)
    }
    
    func switchSalchiIsChanged(mySwitch: UISwitch) {
        print("Salchica")
        if mySwitch.on {
            print("on")
            cantidadIngredientes += 1;
            ingredientes["salc"] = "Salchichas"
        } else {
            print("of")
            if (cantidadIngredientes > 0 ){
                cantidadIngredientes -= 1;
            }
            ingredientes.removeValueForKey("salc")

        }
        print ("\(ingredientes)")
        print(cantidadIngredientes)
        enableSwitch(cantidadIngredientes)
    }
    
    func switchAceitunaIsChanged(mySwitch: UISwitch) {
        print("Aceitunia")
        if mySwitch.on {
            print("on")
            cantidadIngredientes += 1;
            ingredientes["ac"] = "Aceitunas"
            
        } else {
            print("of")
            if (cantidadIngredientes > 0 ){
                cantidadIngredientes -= 1;
            }
            ingredientes.removeValueForKey("ac")
        }
        print ("\(ingredientes)")
        print(cantidadIngredientes)
        enableSwitch(cantidadIngredientes)
    }
    
    func switchCebollaIsChanged(mySwitch: UISwitch) {
        print("Cebolla")
        if mySwitch.on {
            print("on")
            cantidadIngredientes += 1;
            ingredientes["ceb"] = "Cebollas"
        } else {
            print("of")
            if (cantidadIngredientes > 0 ){
                cantidadIngredientes -= 1;
            }
            ingredientes.removeValueForKey("ceb")
        }
        print ("\(ingredientes)")
        print(cantidadIngredientes)
        enableSwitch(cantidadIngredientes)
    }
    
    func switchPimientoIsChanged(mySwitch: UISwitch) {
        print("Pimiento")
        if mySwitch.on {
            print("on")
            cantidadIngredientes += 1;
            ingredientes["pim"] = "Pimientos"
        } else {
            print("of")
            if (cantidadIngredientes > 0 ){
                cantidadIngredientes -= 1;
            }
            ingredientes.removeValueForKey("pim")
        }
        print ("\(ingredientes)")
        print(cantidadIngredientes)
        enableSwitch(cantidadIngredientes)
    }
    
    func switchPinaIsChanged(mySwitch: UISwitch) {
        print("Pina")
        if mySwitch.on {
            print("on ")
            cantidadIngredientes += 1;
            ingredientes["pin"] = "Piña"
        } else {
            print("of")
            if (cantidadIngredientes > 0 ){
                cantidadIngredientes -= 1;
            }
            ingredientes.removeValueForKey("pin")
        }
        print ("\(ingredientes)")

        print(cantidadIngredientes)
        enableSwitch(cantidadIngredientes)
    }
    
    func switchAnchoaIsChanged(mySwitch: UISwitch) {
        print("Anchoa")
        if mySwitch.on {
            print("on")
            cantidadIngredientes += 1;
            ingredientes["anc"] = "Anchoa"
        } else {
            print("of")
            if (cantidadIngredientes > 0 ){
                cantidadIngredientes -= 1;
            }
            ingredientes.removeValueForKey("anc")
        }
        print ("\(ingredientes)")
        print(cantidadIngredientes)
        enableSwitch(cantidadIngredientes)
    }
    

}
