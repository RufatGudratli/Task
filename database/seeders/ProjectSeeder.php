<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Project;
use App\Models\User;

class ProjectSeeder extends Seeder
{
    public function run()
    {
		// Get all user ID (default user will be assigned separately)
        $userIds = User::where('id', '!=', 1)->pluck('id')->toArray();

        // Generate 15 projects with random parameters
        for ($i = 1; $i <= 15; $i++) {
            $project = Project::create([
                'name' => fake()->sentence(rand(4, 8)),
                'description' => fake()->paragraph,
                'owner_id' => 1,	// assign to default user
                'category_id' => rand(1, 9),
                'start_date' => now()->subDays(rand(0, 7)), // Random start date in the last week
                'end_date' => now()->addDays(rand(7, 30)), // Random end date between next week and next month
            ]);

            // Randomly assign between 3-11 users (excluding ID 1), then add user ID 1
            $assignedUsers = fake()->randomElements($userIds, rand(2, 7));
            $assignedUsers[] = 1; // Always include default user

            // Attach users to the project
            $project->users()->attach($assignedUsers);
        }
    }
}
