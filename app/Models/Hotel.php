<?php

namespace App\Models;

use App\Models\FacilityHotel;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Room;


class Hotel extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'description',
        'poster_url',
        'address',
    ];

    public function facilities()
    {
        return $this->hasManyThrough(Facility::class, FacilityHotel::class, 'hotel_id', 'id', 'id', 'facility_id');
    }


    public function rooms()
    {
        return $this->hasMany(Room::class, 'hotel_id', 'id');
    }
}
