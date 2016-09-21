<?php
/**
 * Class Équipe
 * 
 * 
 * @author Philippe Germain
 * @version 1.0
 * @update 2016-09-08
 * @license MIT
 * 
 * 
 */
class Equipe  {	
	/**
	 * Retourne la liste des équipes
	 * @access public
	 * @return Array
	 */
		public function getListeEquipe() 
	{     
		require_once('dbconnect.php');
 
		$res = Array();
		$query = "select nom_e  from equipe JOIN font_partie on equipe.id = font_partie.id_equipe join  membre on font_partie.id = membre.id where font_partie.id IS NOT NULL group by nom_E " ;
       
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
		}
    
	}
		
	/**
	 * Retourne la liste des membres et de leurs équipes
	 * @access public
	 * @return Array
	 */
	public function getListeEquipemembre() 
	{     
     
		require_once('dbconnect.php');
		$res = Array();
		$query = "select membre.id, nom_m, prenom_m, courriel_m, image_m, mp_membre, role_m,equipe.nom_e, equipe.image_e, specialite.*  from membre JOIN font_partie on membre.id = font_partie.id join  equipe on font_partie.id_equipe = equipe.id join specialite on membre.id = specialite.id where id_equipe IS NOT NULL   " ;
      
		if($mrResultat =  $mysqli->query($query) )
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
	 * Retourne la liste des équipes/gamejam
	 * @access public
	 * @return Array
	 */
		public function getListeEquipemembreGamejam($request) 
	{     $id = $request->getAttribute('id');
        require_once('dbconnect.php');
		$res = Array();
		$query = "select membre.id, nom_m, prenom_m, courriel_m, image_m, mp_membre, role_m,equipe.nom_e, equipe.image_e, specialite.*  from membre JOIN font_partie on membre.id = font_partie.id join  equipe on font_partie.id_equipe = equipe.id join specialite on membre.id = specialite.id  join cree on membre.id  = cree.id join jeu on cree.id_Jeu = jeu.id JOIN gamejam on jeu.id = gamejam.id where gamejam.id =".$id. " group by membre.id" ;
      
		if($mrResultat = $mysqli->query($query) )
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
	 * Ajoute les jeux produit par une équipe
	 * @access public
	 * @return Array
	 */
	public function equipeJeux($request) 
	{     
     $id = $request->getAttribute('id');
        require_once('dbconnect.php');
		$res = Array();
		$query = "select  * from jeu join equipe on jeu.id_Equipe = equipe.id WHERE equipe.id=".$id;
      
		if($mrResultat = $mysqli->query($query) )
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
    public function equipeCommandite($request) 
	{     
     $id = $request->getAttribute('id');
        require_once('dbconnect.php');
		$res = Array();
		$query = "SELECT partenaire.id,partenaire.nom_p,partenaire.urlpartenaire,partenaire.image, commanditeequipe.id, commanditeequipe.id_partenaire FROM partenaire Join commanditeequipe on partenaire.id = commanditeequipe.id_partenaire where commanditeequipe.id=".$id;
      
		if($mrResultat = $mysqli->query($query) )
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
