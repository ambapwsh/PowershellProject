#Projet de déploiement de vms et de mise en place d'un AD, de la gestion des sessions utilisateurs et du moniroting
ETAPE 1:Clonez le projet et placez le dans un dossier de votre choix
{
    Partie de Freskim Creation de la vm
}
#This Project Require AD,DNS 
 
{

    Partie d'Alexandre 
}
ETAPE X:Les scripts de Monitoring se trouve sur le dossier "src", Celui ci contient les deux sous dossier "
/ABADManagement et /LogManagement"
Le dossier ABADManagement contient les scripts suivants:
- ADABRenameServer.ps1 {permet de renommer le nom de la machine hôte sur laquelle sera déployé l'AD vous devrez l'adapter en modifiant la propriété NewName }

- Le Script ABADReport.ps1 permet d'avoir un historique de l'ensemble des modifications ayant été faite sur le domaine par défaut il prend en compte les derniers changement sur 4 jours.
  Il fournit en sortie un fichier HTML nommé "ADChangeReport.html" contenant le rapport d'activité sur l'AD, le code source est fait de javascirpt ce qui lui donne un caractère dynamique et de CSS pour la mise en  forme, La page HTML viendra se placer sur le dossier courant sur lequel vous exécuterez le script
                    ##################################################                                                            ########################################################
- Le script ADUninstall.ps1 permet de désinstaller l'AD et les rôles qui lui sont associés ###################
ETAPE Y: La gestion des logs (Logon Logoff)
Cette partie nécessite le déploiement de machines clientes que vous devez joindre à l'AD 
######################################Le DC servira de log collector  
et les machines clientes, elles enverront leur logs de connection au server Windows 
                                                    #####################################################################################################
- Configurer un abonnement de type event Forwarding en pensant à cocher l'Evenement Sécurité 
une fois l'abonnement fonctionnel vous pourrez exécuter le script afin d'exploiter les logs de connexions de votre AD
Se reporter à la documentation officielle de windows pour la partie centralisation des logs sous Windows: WEF configuration https://docs.microsoft.com/fr-fr/defender-for-identity/configure-event-forwarding
                                                                    ###########################################################################
- Execution du script EventManager.ps1: L'exécution de ce script permet d'auditer les logs de connexions et les deconnexions des utilisateurs et des machines reliés à l'AD
  Il fournit en sortie un fichier HTML nommé "Management.html" contenant du CSS, il vient se placer par défaut sur le dossier courant.

########################################################################################################################################################################################    


