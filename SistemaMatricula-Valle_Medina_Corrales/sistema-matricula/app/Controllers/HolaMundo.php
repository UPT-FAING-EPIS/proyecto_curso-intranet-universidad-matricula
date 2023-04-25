<?php

namespace App\Controllers;

class HolaMundo extends BaseController
{
    public function index()
    {
        return view('vista_hola_mundo');
    }
}
