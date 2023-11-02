<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use App\Models\Booking;
use App\Models\User;
use App\Models\Hotel;
use Illuminate\Support\Facades\Auth;

class BookingCreate extends Mailable
{
    use Queueable, SerializesModels;

    private $hotel, $bookId;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($hotel, $bookId)
    {
        $this->hotel = $hotel;
        $this->bookId = $bookId;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        $name = Auth::user()->name;
        $subject = 'Вы забранировали номер в отеле ' . $this->hotel . '.';
        return $this->subject($subject)->view('emails.create-book', ['name' => $name, 'hotel' => $this->hotel, 'book' => $this->bookId]);
    }
}
