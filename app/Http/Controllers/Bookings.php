<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Booking;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use App\Mail\BookingCreate;
use App\Mail\BookingDelete;


class Bookings extends Controller
{
    public function book(Request $request): mixed
    {
        $book = new Booking();
        $book->room_id = $request->room_id;
        $book->user_id = Auth::user()->id;
        $book->started_at = $request->started_at;
        $book->finished_at = $request->finished_at;
        $book->days = $request->days;
        $book->price = $request->price;
        $id = $book->id;
        $book->save();

        $hotel = $book->hotel->name;
        $email = Auth::user()->email;
        Mail::to($email)->send(new BookingCreate($hotel, $id));

        return redirect()->route('bookings.index');
    }

    public function bookings (): mixed
    {
        return view('bookings.index', ['bookings' => Booking::where('user_id', Auth::user()->id)->get()]);
    }

    public function getBooking(int $id, Request $request)
    {
        return view('bookings.show', ['booking' => Booking::find($id),]);
    }

    public function deleteBooking(int $id): mixed
    {
        $book = Booking::find($id);
        $hotel = $book->hotel->name;
        $book->delete();


        $email = Auth::user()->email;
        Mail::to($email)->send(new BookingDelete($hotel));

        return redirect()->route('bookings.index');
    }
}
