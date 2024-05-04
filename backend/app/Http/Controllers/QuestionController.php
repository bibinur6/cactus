<?php

namespace App\Http\Controllers;

use App\Models\Question;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;

class QuestionController extends Controller
{
    public function get(Request $request) {
        $questions = Question::all();

        return response($questions->toJson(), 200)
                    ->header('Content-Type', 'application/json');
    }
}
