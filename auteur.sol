// version du compilateur
pragma solidity >= 0.4.24 < 0.7.0;

/**
 * @title (titre du contrat) Auteur
 * @dev Set(mettre) & change(changer) l'Auteur
 */

contract Auteur {
    
    address private auteur;
    
    //évènement écrit dans la machine virtuelle set=placer ou écrire dans ce cas précis. 
    //Quand un nouvel auteur remplace l'ancien, il devient le nouveau possesseur du contrat
    
    event AuteurSet(address indexed ancienAuteur, address indexed nouvelAuteur);
    
    // la valeur "modifier" permet de vérifier si celui qui invoque certaines fonctions du contrat est bien l'auteur 
    modifier isAuteur() {
    require(msg.sender == auteur, " Vous n'êtes pas l'auteur!");
    _;
    
    }
    
    /**
     * @dev Set contract deployer as owner
     */
     
     constructor() public {
         auteur = msg.sender; // 'msg.sender' est l'invocateur de contrat
         emit AuteurSet(address(0), auteur);
     }
     
     /**
      * @dev change (changement) auteur 
      * @param nouvelAuteur address of nouvel Auteur
      */
      
      function changeAuteur(address nouvelAuteur) public isAuteur{
          emit AuteurSet(auteur, nouvelAuteur);
          auteur = nouvelAuteur;
      }
      
      /**
       * @dev Return owner address 
       * @return address of owner
       */
       
       function getAuteur() external view returns (address) {
           return auteur;
       }
    
}
