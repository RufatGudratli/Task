<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
		'name', 
		'description', 
		'owner_id', 
		'category_id', 
		'start_date', 
		'end_date'
	];
	
    protected $casts = [
        'start_date' => 'datetime',
        'end_date' => 'datetime',
    ];
	
    public function owner()
    {
        return $this->belongsTo(User::class, 'owner_id');
    }

    public function users()
    {
        return $this->belongsToMany(User::class, 'project_user');
    }

    public function tasks()
    {
        return $this->hasMany(Task::class);
    }
	
	public function category()
	{
		return $this->belongsTo(ProjectCategory::class, 'category_id');
	}
}