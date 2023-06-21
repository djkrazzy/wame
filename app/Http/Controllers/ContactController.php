<?php

namespace App\Http\Controllers;

use App\Imports\ContactsImport;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;

class ContactController extends Controller
{
    public function store(Request $request)
    {

        $file = $request->file('import_file');

        Excel::import(new ContactsImport, $file);

       return  view('user.contact.index')->with('success', 'Contactos impolrtados con exito');
    }


    public function index()
    {

      
        // return 'contactos';
       return  view('contacts.import-excel');
    }






    
}
