<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class MovieDetail extends Model
{
    //

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'movie_id', 'key', 'value','created_by','updated_by',
    ];

    public function movie() {
        return $this->belongsTo(MovieMaster::class);
    }
}
