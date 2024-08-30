<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProjectCategory extends Model
{
    protected $table = 'project_categories';

    protected $fillable = ['name', 'icon', 'color'];

    public function projects()
    {
        return $this->hasMany(Project::class, 'category_id');
    }
}