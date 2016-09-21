<?php
/**
 * Class Studio
 * 
 * 
 * @author Philippe Germain
 * @version 1.0
 * @update 2016-09-08
 * @license MIT
 * 
 * 
 */
class Studio  {	
	
		
	/**
	 * Retourne la liste des studios Profesionnels seulement et qui ont des membres
	 * @access public
	 * @return Array
	 */

	public function getListeStudio() 
	{     
     require_once('dbconnect.php');
		$res = Array();
		$query = "SELECT equipe.id,image_e, liens.lien FROM equipe join etatprof on equipe.idetatprof = etatprof.id join liens on equipe.id_liens = liens.id join jeu on equipe.id = jeu.id_Equipe join gamejam on jeu.id_Gamejam = gamejam.id " ;
       
		if($mrResultat = $mysqli->query($query))
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
    	/**
	 * Récupère la liste des studios membres
	 * @access public
	 * @return Array
	 */
	public function getListeStudioMembres($request) 
	{     
        $id = $request->getAttribute('id');
        require_once('dbconnect.php');
		$res = Array();
		$query = "select membre.id, nom_m, prenom_m, courriel_m, image_m, mp_membre, role_m,equipe.nom_e, equipe.image_e, specialite.*, liens.lien from membre JOIN font_partie on membre.id = font_partie.id join equipe on font_partie.id_equipe = equipe.id join specialite on membre.id = specialite.id join liens on equipe.id_liens = liens.id  where equipe.id =".$id ;
       
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