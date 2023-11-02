<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FacilityRoom extends Model
{
    use HasFactory;

    protected $fillable = [
        'facility_id',
        'room_id'
    ];
    public function facilities()
    {
        return $this->hasMany(Facility::class, 'id', 'facility_id');
    }
    public function room()
    {
        return $this->belongsToMany(Room::class, 'rooms','room_id', 'id');
    }
}
