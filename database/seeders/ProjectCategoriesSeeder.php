<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProjectCategoriesSeeder extends Seeder
{
    public function run()
    {
        $categories = [
            [
                'name' => 'UI/UX Design',
                'icon' => 'icofont-designfloat',
                'color' => 'light-info-bg',
            ],
            [
                'name' => 'Website Design',
                'icon' => 'icofont-web',
                'color' => 'bg-lightgreen',
            ],
            [
                'name' => 'App Development',
                'icon' => 'icofont-stock-mobile',
                'color' => 'bg-lightyellow',
            ],
            [
                'name' => 'Quality Assurance',
                'icon' => 'icofont-star',
                'color' => 'light-success-bg',
            ],
            [
                'name' => 'Development',
                'icon' => 'icofont-code-alt',
                'color' => 'light-orange-bg',
            ],
            [
                'name' => 'Backend Development',
                'icon' => 'icofont-code',
                'color' => 'bg-careys-pink',
            ],
            [
                'name' => 'Software Testing',
                'icon' => 'icofont-test-tube-alt',
                'color' => 'bg-lightblue',
            ],
            [
                'name' => 'Marketing',
                'icon' => 'icofont-brand-hallmark',
                'color' => 'light-danger-bg',
            ],
            [
                'name' => 'SEO',
                'icon' => 'icofont-search-document',
                'color' => 'bg-santa-fe',
            ],
        ];

        DB::table('project_categories')->insert($categories);
    }
}
