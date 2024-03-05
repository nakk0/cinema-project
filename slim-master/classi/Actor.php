<?php

class Actor {
    private $id;
    private $name;
    private $surname;
    private $birthday;  // Fix the property name
    private $nationality;
    private $photo;


    public function __construct($id, $name, $surname, $birthday, $nationality, $photo) {
        $this->id = $id;
        $this->name = $name;
        $this->surname = $surname;
        $this->birthday = $birthday;
        $this->nationality = $nationality;
        $this->photo = $photo;
    }

    // Getter methods
    public function getId() {
        return $this->id;
    }

    public function getName() {
        return $this->name;
    }

    public function getSurname() {
        return $this->surname;
    }

    public function getBirthday() {
        return $this->birthday;
    }

    public function getNationality() {
        return $this->nationality;
    }

    public function getPhoto() {
        return $this->photo;
    }

    public function toArray() {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'surname' => $this->surname,
            'birthday' => $this->birthday,
            'nationality' => $this->nationality,
            'photo' => $this->photo,
        ];
    }
    

    
}

