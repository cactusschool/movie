<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class MovieMaster extends Model
{
    //

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'movie_name', 'movie_duration', 'release_date','created_by','updated_by',
    ];

    public function movieDetail() {
        return $this->hasMany(MovieDetail::class, 'movie_id');
    }
}
