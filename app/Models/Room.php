<?php

namespace App\Models;

//use http\Env\Request;
use Illuminate\Http\Client\Request;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Room extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'description',
        'poster_url',
        'floor_area',
        'type',
        'price',
        'hotel_id',
    ];

    public function hotel()
    {
        return $this->belongsTo(Hotel::class, 'hotels_id', 'id');
    }

    public function booking()
    {
        return $this->belongsToMany(Booking::class, 'bookings','room_id', 'id');
    }

    public function fasilities()
    {
        return $this->hasManyThrough(Facility::class, FacilityRoom::class, 'room_id', 'id', 'id', 'facility_id');
    }

    public function total_price(): int
    {
        $fdate = request()->get('start_date');
        $tdate = request()->get('end_date');
        $datetime1 = new \DateTime($fdate);
        $datetime2 = new \DateTime($tdate);
        $interval = $datetime1->diff($datetime2);
        $days = $interval->format('%a');
        $totalPrice = $days * $this->price;
        return $totalPrice;

    }

    public function total_days(): int
    {
        $fdate = request()->get('start_date');
        $tdate = request()->get('end_date');
        $datetime1 = new \DateTime($fdate);
        $datetime2 = new \DateTime($tdate);
        $interval = $datetime1->diff($datetime2);
        $days = $interval->format('%a');
        return $days;
    }

}
