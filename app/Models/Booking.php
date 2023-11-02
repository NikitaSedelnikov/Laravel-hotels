<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    use HasFactory;

    protected $fillable = [
        'room_id',
        'user_id',
        'started_at',
        'finished_at',
        'days',
        'price',
    ];

    public function room()
    {
        return $this->hasOne(Room::class, 'id','room_id');
    }

    public function user()
    {
        return $this->hasOne(User::class, 'id','user_id');
    }

    public function hotel()
    {
        return $this->hasOneThrough(Hotel::class, Room::class, 'id', 'id', 'room_id', 'hotel_id');
    }
}
