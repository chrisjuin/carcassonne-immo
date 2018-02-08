<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Annonce
 *
 * @ORM\Table(name="ann_annonce")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\AnnonceRepository")
 */
class Annonce
{   
    /**
     * @var int
     *
     * @ORM\Column(name="ann_id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="ann_titre", type="string", length=50, unique=false)
     */
    private $titre;

    /**
     * @var int
     *
     * @ORM\Column(name="ann_nb_pieces", type="integer")
     */
    private $nbPieces;

    /**
     * @var string
     *
     * @ORM\Column(name="ann_description", type="string", length=255, unique=false)
     */
    private $description;

    /**
     * @var float
     *
     * @ORM\Column(name="ann_prix", type="float")
     */
    private $prix;

    /**
     * @var string
     *
     * @ORM\Column(name="ann_photo", type="string", length=255)
     */
    private $photo;

    /**
     * @ORM\ManyToOne(targetEntity="Type", inversedBy="annonces")
     * @ORM\JoinColumn(name="typ_id", referencedColumnName="typ_id")
     */
    private $type;

    /**
     * @ORM\ManyToOne(targetEntity="Client", inversedBy="annonces")
     * @ORM\JoinColumn(name="cli_id", referencedColumnName="cli_id")
     */
    private $client;

    /**
     * @ORM\ManyToOne(targetEntity="Admin", inversedBy="annonces")
     * @ORM\JoinColumn(name="adm_id", referencedColumnName="adm_id")
     */
    private $admin;

    
    public function __toString()
    {    
    return $this->getprix()." ".$this->getTitre(). " ".$this->getDescription()
    . " ".$this->getNbPieces(). " ". $this->getPhoto(). " ". (string) $this->getType() ." ". (string) $this->getClient() . " ". $this->getUser(). " ". $this->getAdmin();
    }   

    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set titre
     *
     * @param string $titre
     *
     * @return Annonce
     */
    public function setTitre($titre)
    {
        $this->titre = $titre;

        return $this;
    }

    /**
     * Get titre
     *
     * @return string
     */
    public function getTitre()
    {
        return $this->titre;
    }

    /**
     * Set nbPieces
     *
     * @param integer $nbPieces
     *
     * @return Annonce
     */
    public function setNbPieces($nbPieces)
    {
        $this->nbPieces = $nbPieces;

        return $this;
    }

    /**
     * Get nbPieces
     *
     * @return int
     */
    public function getNbPieces()
    {
        return $this->nbPieces;
    }

    /**
     * Set description
     *
     * @param string $description
     *
     * @return Annonce
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set prix
     *
     * @param float $prix
     *
     * @return Annonce
     */
    public function setPrix($prix)
    {
        $this->prix = $prix;

        return $this;
    }

    /**
     * Get prix
     *
     * @return float
     */
    public function getPrix()
    {
        return $this->prix;
    }

    /**
     * Set photo
     *
     * @param string $photo
     *
     * @return Annonce
     */
    public function setPhoto($photo)
    {
        $this->photo = $photo;

        return $this;
    }

    /**
     * Get photo
     *
     * @return string
     */
    public function getPhoto()
    {
        return $this->photo;
    }

    /**
     * Set type
     * @param string $type
     *
     * @return Annonce
     */
    public function setType($type)
    {
        $this->type = $type;

        return $this;
    }

    /**
     * Get type
     *
     * @return string
     */
    public function getType()
    {
        return $this->type;
    }
    
    /**
     * Set client
     *
     * @param string $client
     *
     * @return Annonce
     */
    public function setClient($client)
    {
        $this->client = $client;
        
        return $this;
    }
    
    /**
     * Get client
     *
     * @return string
     */
    public function getClient()
    {
        return $this->client;
    }
    
    /**
     * Set admin
     *
     * @param string $admin
     *
     * @return Annonce
     */
    public function setAdmin($admin)
    {
        $this->admin = $admin;
        
        return $this;
    }
    
    /**
     * Get admin
     *
     * @return string
     */
    public function getAdmin()
    {
        return $this->admin;
    }
    
}



