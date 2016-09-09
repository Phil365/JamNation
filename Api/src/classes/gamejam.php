<?php
/**
 * Class Gamejam
 * 
 * 
 * @author Philippe Germain
 * @version 1.0
 * @update 2016-09-08
 * @license MIT
 * 
 * 
 */
class Gamejam {	
	
		
	/**
	 * Retourne la liste des gamejams
	 * @access public
	 * @return Array
	 */
	public function getListeGamejam() 
	{      require_once('dbconnect.php');
   
		$res = Array();
     
		$query = "SELECT * FROM gamejam " ;
       
		if($mrResultat =$mysqli->query($query))
		{  
			while($result = $mrResultat->fetch_assoc())
			{ 
                
                   
				foreach( $result as $cle=> $valeur)
				{
					$result[$cle] = $valeur;
                   
				}
             
				$res[] = $result;
                              
             
			}
                   header('Content-Type: application/json;  charset=utf-8');
		echo json_encode($res, JSON_PRETTY_PRINT);
            exit;
		}
    
	}
    /**
	 * Retourne la liste des partenaires/gamejam
	 * @access public
	 * @return Array
	 */
		public function getListeSponsorGamejam($request) 
	{       $id = $request->getAttribute('id');
        require_once('dbconnect.php');
    
		$res = Array();
		$query = "SELECT partenaire.id,partenaire.nom_p,partenaire.urlpartenaire,partenaire.image, commanditegamejam.id, commanditegamejam.id_partenaire, commanditegamejam.commanditaireprincipal FROM partenaire Join commanditegamejam on partenaire.id = commanditegamejam.id_partenaire where commanditaireprincipal = false and commanditegamejam.id=".$id ;
       
		if($mrResultat =  $mysqli->query($query))
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
    /**
	 * Retourne le partenaire principal/gamejam
	 * @access public
	 * @return Array
	 */
		public function getListeSponsorPrincipalGamejam($request) 
	{   $id = $request->getAttribute('id');
        require_once('dbconnect.php');

		$res = Array();
		$query = "SELECT partenaire.id,partenaire.nom_p,partenaire.urlpartenaire,partenaire.image, commanditegamejam.id, commanditegamejam.id_partenaire, commanditegamejam.commanditaireprincipal FROM partenaire Join commanditegamejam on partenaire.id = commanditegamejam.id_partenaire where commanditaireprincipal = true and commanditegamejam.id=".$id ;
       
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
    /**
	 * Retourne les info d'un gamejam
	 * @access public
	 * @return Array
	 */
			public function getListeGamejamInfo($request) 
	{     
        $id = $request->getAttribute('id');
        require_once('dbconnect.php');
		$res = Array();
		$query = "SELECT * FROM gamejam where gamejam.id=".$id ;
       
		if($mrResultat =$mysqli->query($query))
		{  
			while($result = $mrResultat->fetch_assoc())
			{ 
                
                   
				foreach( $result as $cle=> $valeur)
				{
					$result[$cle] = $valeur;
                   
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