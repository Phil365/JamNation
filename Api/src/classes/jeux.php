<?php
/**
 * Class Jeux
 * 
 * 
 * @author Philippe Germain
 * @version 1.0
 * @update 2016-09-08
 * @license MIT
 * 
 * 
 */
class Jeux {	
	
     /**
	 * Retourne les info d'un gamejam
	 * @access public
	 * @return Array
	 */
	public function getListeJeuxGamejam($request) 
	{      $id = $request->getAttribute('id');
        require_once('dbconnect.php');
		$res = Array();
		$query = "select  * from jeu join gamejam on jeu.id_Gamejam = gamejam.id WHERE gamejam.id=".$id;
       
		if($mrResultat = $mysqli->query($query))
		{  
			while($result = $mrResultat->fetch_assoc())
			{ 
                
                   
				foreach( $result as $cle=> $valeur)
				{
					$result[$cle] =$valeur;
                   
				}
             
				$res[] = $result;
                              
             
			}
            header('Content-Type: application/json');
		echo json_encode($res, JSON_PRETTY_PRINT);
            exit;
		}
    
	}
}




?>