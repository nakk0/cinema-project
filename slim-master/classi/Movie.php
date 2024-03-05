<?php

class Movie {
    private $id;
    private $title;
    private $release_date;
    private $original_language;
    private $description;
    private $director;
    private $poster;

    // Constructor
    public function __construct($id, $title, $release_date, $original_language, $description, $director, $poster) {
        $this->id = $id;
        $this->title = $title;
        $this->release_date = $release_date;
        $this->original_language = $original_language;
        $this->description = $description;
        $this->director = $director;
        $this->poster = $poster;
    }

    public function addLanguage(string $language) {
        $this->languages[] = $language;
    }

    

    public function getId() {
        return $this->id;
    }
    
    public function getTitle() {
        return $this->title;
    }
    
    public function getReleaseDate() {
        return $this->release_date;
    }
    
    public function getOriginalLanguage() {
        return $this->original_language;
    }
    
    public function getDescription() {
        return $this->description;
    }
    
    public function getDirector() {
        return $this->director;
    }
    
    public function getPoster() {
        return $this->poster;
    }


    public function toArray() {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'release_date' => $this->release_date,
            'original_language' => $this->original_language,
            'description' => $this->description,
            'director' => $this->director,
            'poster' => $this->poster,
        ];
    }
    

    
}

