<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Task;
use App\Models\Project;
use App\Models\User;

class TaskSeeder extends Seeder
{
    public function run()
    {
        // Get all projects
        $projects = Project::all();

        foreach ($projects as $project) {

            // Get users assigned to the current project
            $assignedUserIds = $project->users->pluck('id')->toArray();

            // Add 4-6 tasks for each status (0, 1, 2, 3) to each project
            foreach ([0, 1, 2, 3] as $status) {
                for ($i = 0; $i < rand(4, 6); $i++) {
                    Task::create([
                        'title' => fake()->sentence(rand(4, 8)),
                        'description' => fake()->paragraph(rand(3, 6)), // Descriptions 15-30 words
                        'status' => $status,
                        'priority' => fake()->randomElement(['low', 'medium', 'high']),
                        'project_id' => $project->id,
                        'assigned_id' => fake()->randomElement($assignedUserIds),
                        'start_date' => fake()->dateTimeBetween('-1 week', 'now'), // Start date between last week and now
                        'end_date' => fake()->dateTimeBetween('+1 week', '+1 month'), // End date between next week and next month
                    ]);
                }
            }
        }
    }
}
