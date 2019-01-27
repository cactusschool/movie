<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\MovieMaster;
use App\Model\MovieDetail;
use App\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Input;
use Zizaco\Entrust\Entrust;
use Validator;

class MovieController extends Controller
{
    public $successStatus = 200;
    public $failedStatus = 500;

    public function getmovie(Request $request)
    {
        $input = $request->all();
        $movieName = strtoupper($input['movie_name']);
        $movieId = $input['id'];
        $movie1 = MovieMaster::where('movie_name', $movieName)->first();
        $movie = MovieMaster::with('movieDetail')->where('id', $movie1->id)->get();
        return response()->json(['success'=>$movie], $this->successStatus);
    }
    //
    /**
     * details api
     *
     * @return \Illuminate\Http\Response
     */
    public function addmovie(Request $request)
    {
        $user = Auth::user();
        $isAdmin = $user->hasRole('admin');

        if(Auth::check()) {
            $rules = array(
                'movie_name'       => 'required',
                'movie_duration'   => 'required',
                'release_date' => 'required'
            );

            $validator = Validator::make(Input::all(), $rules);
            if ($validator->fails()) {
                return response()->json(['error'=>$validator->errors()], $this->failedStatus);
            }
        
            
            $input = $request->all();
            $input['created_by'] = $user->email;
            $input['movie_name'] = strtoupper($input['movie_name']);
            $movieDetails = [];
            if( isset( $input['details'] ) ){
                $movieDetails = $input['details'];
            }
            // Check if movie exists
            $movie = MovieMaster::where('movie_name', $input['movie_name'])->first();
            //try{
                \DB::beginTransaction();
                if($movie == null) {
                    //return response()->json(['error'=> "Movie already exists"], $this->failedStatus);
                    //return response()->json(['error'=> $movie], $this->failedStatus);
                    $movie = MovieMaster::create($input);
                }
                $elementCount  = count($movieDetails);
                if($elementCount > 0) {
                    foreach($movieDetails as $item) { //foreach element in $arr
                        $item['created_by'] = $user->email;
                        $item['movie_id'] = $movie->id;
                        
                        if( !isset( $input['id'] ) ){
                            $movieDetail = MovieDetail::create($item);
                            $movieDetail->movie()->associate($movie);
                            return response()->json(['error'=> $input['id']], $this->failedStatus);
                        } else {
                            $item = MovieDetail::where('id', $item['id'])->first();
                            //return response()->json(['error1'=> $input['id']], $this->failedStatus);
                        }
                        $movieDetail->save();
                    }
                }
                
                //$movieDetails
                \DB::commit();
            //} catch(\Exception $e){
            //    \DB::rollback();
            //}
            $movie = MovieMaster::with('movieDetail')->where('id', $movie->id)->get();
            return response()->json(['success' => $movie], $this->successStatus);
            //return getmovie($movie);
        }
    }
}
