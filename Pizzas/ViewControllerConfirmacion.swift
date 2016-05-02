//
//  ViewControllerConfirmacion.swift
//  Pizzas
//
//  Created by Giovanni Launizar Ortiz on 02/05/16.
//  Copyright © 2016 GioIOS. All rights reserved.
//

import UIKit

class ViewControllerConfirmacion: UIViewController {

    
    @IBOutlet weak var tamanoLabel: UILabel!
    @IBOutlet weak var masaLabel: UILabel!
    @IBOutlet weak var quesoLabel: UILabel!
    @IBOutlet weak var ingrediente1: UILabel!
    @IBOutlet weak var ingrediente2: UILabel!
    @IBOutlet weak var ingrediente3: UILabel!
    @IBOutlet weak var ingrediente4: UILabel!
    @IBOutlet weak var ingrediente5: UILabel!
    
    var seleccionQueso = ""
    var seleccionMasa = ""
    var seleccionTamanio = ""
    var seleccionIngredientes = [String : String]()
    
    var ingredienteCount = 1

    
    var tamanoPizzaSeleccionado = ""
    var masaSeleccionado = ""
    var quesoSeleccionado = ""
    var ingredientesSeleccionados = [String : String]()

    
    override func viewWillAppear(animated: Bool) {
        ingredienteCount = 1
        
        seleccionMasa = masaSeleccionado
        seleccionTamanio = tamanoPizzaSeleccionado
        seleccionQueso = quesoSeleccionado
        seleccionIngredientes = ingredientesSeleccionados
        print("Masa Seleccionada: " + seleccionMasa)
        print("Tamano seleccionada : " + seleccionTamanio)
        print("Queso Seleccionado: " + quesoSeleccionado)
        print("Ingredientes: \(seleccionIngredientes)")
        
        tamanoLabel.text = seleccionTamanio
        masaLabel.text = masaSeleccionado
        quesoLabel.text = seleccionQueso
        
        for ingrediente in seleccionIngredientes.values{
            print(ingredienteCount)
            print(ingrediente)
            
            if ingredienteCount == 1 {
                ingrediente1.text = ingrediente
            }
            if ingredienteCount == 2 {
                ingrediente2.text = ingrediente
            }
            if ingredienteCount == 3 {
                ingrediente3.text = ingrediente
            }
            if ingredienteCount == 4 {
                ingrediente4.text = ingrediente
            }
            if ingredienteCount == 5 {
                ingrediente5.text = ingrediente
            }
            
            ingredienteCount += 1
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
