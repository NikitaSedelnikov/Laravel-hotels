<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Hotels;
use App\Http\Controllers\Bookings;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/



Route::middleware('auth')->group(function () {
    Route::get('/', [Hotels::class, 'index'])->name('index');
    Route::get('/hotels', [Hotels::class, 'allHotels'])->name('hotels.index');
    Route::get('/hotels/{id}', [Hotels::class, 'getHotel'])->name('hotels.show');

    Route::get('/bookings', [Bookings::class, 'bookings'])->name('bookings.index');
    Route::get('/booking/{id}', [Bookings::class, 'getBooking'])->name('bookings.show');
    Route::delete('/booking/{id}', [Bookings::class, 'deleteBooking'])->name('bookings.delete');
    Route::post('/bookings-store', [Bookings::class, 'book'])->name('bookings.store');
});

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth'])->name('dashboard');

require __DIR__.'/auth.php';





Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
