<?php
/**
 * Routes
 * 
 * 
 * @author Philippe Germain
 * @version 1.0
 * @update 2016-09-08
 * @license MIT
 * 
 * 
 */


$app->get('/membre', '\Membre:getListe');
$app->get('/membre/{id}', '\Membre:getMembre');
$app->get('/membre/{id}/jeux', '\Membre:getMembreJeux');
$app->get('/membre/{id}/gamejam', '\Membre:getMembreGamejamNombre');
$app->get('/textes', '\Texte:getListetextes');
$app->get('/textes/archives', '\Texte:getListetextesArchives');
$app->get('/studioInscris', '\Studio:getListeStudio');
$app->get('/studioInscris/{id}', '\Studio:getListeStudioMembres');
$app->get('/gamejam', '\Gamejam:getListeGamejam');
$app->get('/gamejam/{id}', '\Gamejam:getListeSponsorGamejam');
$app->get('/gamejam/{id}/principal', '\Gamejam:getListeSponsorPrincipalGamejam');
$app->get('/gamejam/{id}/info', '\Gamejam:getListeGamejamInfo');
$app->get('/jeux/{id}', '\Jeux:getListeJeuxGamejam');
$app->get('/font_partie', '\Equipe:getListeEquipemembre');
$app->get('/font_partie/{id}', '\Equipe:getListeEquipemembreGamejam');
$app->get('/equipe', '\Equipe:getListeEquipe');
$app->get('/equipe/{id}/jeux', '\Equipe:equipeJeux');
$app->get('/equipe/{id}/commandite', '\Equipe:equipeCommandite');
$app->get('/partenaire', '\Partenaire:getListePartenaire');
