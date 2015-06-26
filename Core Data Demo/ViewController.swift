//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Mario Sanchez on 28/5/15.
//  Copyright (c) 2015 Mario Sanchez. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as! NSManagedObject
        
//        SECCION DONDE SE REALIZA EL REGISTRO
        
//        newUser.setValue("Mario Jose", forKey: "username")
//        newUser.setValue("Pass1", forKey: "password")
//        context.save(nil)
        
//        FIN DE SECCION DONDE SE REALIZA REGISTRO
        
        
        
//        SECCION PARA IMPRIMIR EN PANTALL LOS REGISTROS
        
        var request  = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "username = %@", "Mario")
        var result = context.executeFetchRequest(request, error: nil)
        

        if result?.count > 0 {
            println(result)
            for result: AnyObject in result!{
                if let user = result.valueForKey("username") as? String{
//                    print(user)
                    //        SECCION DONDE SE ELIMINARA UN REGISTRO
                        if user == "Mario"
                        {
                            
//                            context.deleteObject(result as! NSManagedObject)
//                            print(user + " has been delete")
                            result.setValue("pass6", forKey: "password")
                        }
                    //        FIN DE LA ELIMNACION DEL REGISTRO
                }
                context.save(nil)
            }
        }
        else
        {
            print("No results")
        }
//        FINAL DE LA IMPRESION EN PATALLA
        
        

        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


