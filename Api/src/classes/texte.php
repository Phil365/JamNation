<?php
/**
 * Class Texte
 * 
 * 
 * @author Philippe Germain
 * @version 1.0
 * @update 2016-09-08
 * @license MIT
 * 
 * 
 */
class Texte {	
	
		
	/**
	 * Retourne la liste des textes
	 * @access public
	 * @return Array
	 */
	public function getListetextes() 
	{     
       require_once('dbconnect.php');
		$res = Array();
		$query = "SELECT * FROM contenusite WHERE id IN ((SELECT min(id) FROM contenusite b), (SELECT max(id) FROM contenusite c))" ;
       
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
        header('Content-Type: application/json; charset=utf8 ');
		echo json_encode($res, JSON_PRETTY_PRINT);
            exit;
		}
    
	}
    /**
	 * Retourne la liste des textes archivés
	 * @access public
	 * @return Array
	 */
	public function getListetextesArchives() 
	{     
        require_once('dbconnect.php');  
		$res = Array();
		$query = "SELECT * FROM contenusite" ;
       
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
             header('Content-Type: application/json; charset=utf8 ');
		echo json_encode($res, JSON_PRETTY_PRINT);
            exit;
		}
    
	}
	

  
}





?>
