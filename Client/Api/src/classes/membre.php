<?php
/**
 * Class Membre
 * 
 * 
 * @author Philippe Germain
 * @version 1.0
 * @update 2016-09-08
 * @license MIT
 * 
 * 
 */
class Membre  {	

	
	/**
	 * Retourne la liste des membres
	 * @access public
	 * @return Array
	 */
	public function getListe() 
	{ 
        require_once('dbconnect.php');
		$res = Array();
		$query = "select  id,  nom_m, prenom_m, courriel_m, image_m, mp_membre, role_m from membre GROUP by id " ;
       
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
	 * Récupère  un participant
	 * @access public
	 * @param int $request Identifiant du partcipant
	 * @return Array
	 */
	public function getMembre($request) 
	{  $id = $request->getAttribute('id');
        require_once('dbconnect.php');
		$res = Array();
		if($mrResultat =  $mysqli->query("select membre.id, nom_m, prenom_m, courriel_m, image_m, mp_membre, description_m, membre.id_Liens, role_m, equipe.nom_e, equipe.image_e, specialite.*  from membre JOIN font_partie on membre.id = font_partie.id join  equipe on font_partie.id_equipe = equipe.id join specialite on membre.id = specialite.id where id_equipe IS NOT NULL and  membre.id=". $id))
		{
			$res = $mrResultat->fetch_assoc();
		}
		header('Content-Type: application/json');
		echo json_encode($res, JSON_PRETTY_PRINT);
             exit;
	}
	
		/**
	 * Récupère les jeux d'un membre
	 * @access public
	 * @return Array
	 */
	public function getMembreJeux($request) 
	{     $id = $request->getAttribute('id');
        require_once('dbconnect.php');   
		$res = Array();
		$query = "select  * from jeu join cree on jeu.id = cree.id_Jeu join membre on cree.id= membre.id join role on cree.id_Role = role.id  join gamejam on jeu.id_Gamejam = gamejam.id WHERE membre.id=".$id ;
       
		if($mrResultat =  $mysqli->query($query))
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
	 * Récupère des stats comme lenombre de Gamejam auquel membre à participer
	 * @access public
	 * @return Array
	 */
	public function getMembreGamejamNombre($request) 
	{    $id = $request->getAttribute('id');
        require_once('dbconnect.php');  
      
		$res = Array();
		$query = "select  COUNT(gamejam.id)  as nombreJam,COUNT(gamejam.id)*48 as nuitBlanche from gamejam join jeu on gamejam.id = jeu.id_Gamejam  join cree on jeu.id = cree.id_Jeu join membre on cree.id= membre.id  WHERE membre.id=".$id ;
       
		if($mrResultat =  $mysqli->query($query))
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
