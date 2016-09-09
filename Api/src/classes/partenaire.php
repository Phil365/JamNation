<?php

class Partenaire {	
/**
 * Class Partenaire
 * 
 * 
 * @author Philippe Germain
 * @version 1.0
 * @update 2016-09-08
 * @license MIT
 * 
 * 
 */
		
	/**
	 * Retourne la liste des des partenaires qui commandite la saison en cours
	 * @access public
	 * @return Array
	 */
	public function getListePartenaire() 
	{      require_once('dbconnect.php');
     
		$res = Array();
		$query = "select * from partenaire JOIN commanditesaison on partenaire.id = commanditesaison.id where commanditesaison.id_saison = 1  " ;
       
		if($mrResultat = $mysqli->query($query))
		{  
			while($result = $mrResultat->fetch_assoc())
			{ 
                
                   
				foreach( $result as $cle=> $valeur)
				{
					$result[$cle] = utf8_encode($valeur);
                   
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
