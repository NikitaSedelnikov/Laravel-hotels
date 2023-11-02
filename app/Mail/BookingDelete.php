<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Auth;

class BookingDelete extends Mailable
{
    use Queueable, SerializesModels;

    private $hotel;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($hotel)
    {
        $this->hotel = $hotel;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        $name = Auth::user()->name;
        $subject = 'Вы отменили бронирование в отеле' . $this->hotel;
        return $this->subject($subject)->view('emails.delete-book', ['name' => $name, 'hotel' => $this->hotel]);
    }
}
