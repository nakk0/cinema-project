<?php

class review {
    private $id;
    private $rating;
    private $movie_id;
    private $account_id;
    private $content;

    //finisci da qui

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

