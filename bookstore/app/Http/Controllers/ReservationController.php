<?php

namespace App\Http\Controllers;

use App\Models\Reservation;
use Illuminate\Http\Request;

class ReservationController extends Controller
{
    //
    public function index()
    {
        $reservation = response()->json(Reservation::all());
        return $reservation;
    }
    public function show ($user_id, $copy_id, $start)
    {
        $reservation = Reservation::where('user_id', $user_id)->where('copy_id', $copy_id)->where('start', $start)->get();
        return $reservation[0];
    }
    public function store(Request $request)
    {
        $reservation = new Reservation();
        $reservation->book_id = $request->book_id;
        $reservation->user_id = $request->user_id;
        $reservation->start = $request->start;
        $reservation->message = $request->message;
        $reservation->created_at = $request->created_at;
        $reservation->updated_at = $request->updated_at;
        $reservation->save();
    }
    public function update($id, Request $request)
    {
        $reservation = Reservation::find($id);
        $reservation->book_id = $request->book_id;
        $reservation->user_id = $request->user_id;
        $reservation->start = $request->start;
        $reservation->message = $request->message;
        $reservation->created_at = $request->created_at;
        $reservation->updated_at = $request->updated_at;
        $reservation->save();
    }
    public function destroy($id)
    {
        $reservation = Reservation::find($id);
        $reservation->delete();
    }
}
