<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FacilityHotel extends Model
{
    use HasFactory;

    protected $fillable = [
        'facility_id',
        'hotel_id'
    ];

    public function facilitiy()
    {
        return $this->hasMany(Facility::class, 'id', 'facility_id');
    }
    public function hotel()
    {
        return $this->belongsToMany(Hotel::class, 'hotels','hotel_id', 'id');
    }
}
