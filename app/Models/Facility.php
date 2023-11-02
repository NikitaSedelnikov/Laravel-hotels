<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Facility extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
    ];

    public function facilityHotels()
    {
        return $this->belongsToMany(FacilityHotel::class, 'facility_hotels', 'id','facility_id');
    }

    public function facilityRooms()
    {
        return $this->belongsTo(FacilityRoom::class);
    }
}
