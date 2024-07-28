<?php

namespace Tests\Feature\Http\Controllers;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class UserControllerTest extends TestCase
{
    use RefreshDatabase;

    public function test_can_display_list_screen(): void
    {
        // Arrange
        $users = User::factory()->create(['name' => 'テストユーザー']);
        // Act
        $response = $this->get('/users');
        // Assert
        $response
            ->assertOk()
            ->assertSee('テストユーザー');
    }
}
