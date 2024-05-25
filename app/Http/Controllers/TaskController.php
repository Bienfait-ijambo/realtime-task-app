<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use App\Models\Task;
use App\Models\Member;
use App\Models\TaskMember;

class TaskController extends Controller
{
    public function createTask(Request $request){

     return DB::transaction(function() use ($request){
        $fields = $request->all();

        $errors = Validator::make($fields, [
            'name' => 'required',
            'projectId' => 'required|numeric',
            'memberIds' => 'required|array',
            'memberIds.*'=>'numeric'
        ]);

        if ($errors->fails()) {
            return response($errors->errors()->all(), 422);
        }

        $task=Task::create([
            'projectId' => $fields['projectId'],
            'name' => $fields['name'],
            'status' => Task::NOT_STARTED,
        ]);

        $members=$fields['memberIds'];
        for($i=0; $i<count($members);$i++){

            TaskMember::create([
                'projectId' => $fields['projectId'],
                'taskId' => $task->id,
                'memberId' => $members[$i]
            ]);

        }

        return response(['message'=>'Task created successfully !']);
     });


    }
}
