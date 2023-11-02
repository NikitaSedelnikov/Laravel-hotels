<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Hotel;
use App\Models\Room;
use App\Models\Facility;
use App\Models\FacilityHotel;

class Hotels extends Controller
{
    public function index(): mixed
    {
        return view('index');
    }

    public function allHotels(Request $request): mixed
    {
        if ($request->get('hotels-filter') !== '' || $request->get('min-price') > 0) {
            $price = $request->get('min-price');
            $facilityId = intval($request->get('hotels-filter'));
            $count = 0;
            return view('hotels.index', [
                'hotels' => Hotel::all(),
                'facilities' => Facility::all(),
                'facilityId' => $facilityId,
                'price' => $price,
                'hotelsCount' => $count,
            ]);
        }
        return view('hotels.index', ['hotels' => Hotel::all(), 'facilities' => Facility::all()]);
    }

    public function getHotel(int $id, Request $request): mixed
    {
        return view('hotels.show', [
            'hotel' => Hotel::find($id),
            'rooms' => Room::where('hotel_id', $id)->get(),
            ]);
    }
}
