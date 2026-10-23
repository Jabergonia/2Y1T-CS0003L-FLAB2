BITS 32
GLOBAL _start

SECTION .data

title db "=======================================", 10
      db "       DUNGEON OF THE LOST KING", 10
      db "=======================================", 10
      db "             |>>>> |", 10
      db "          _ _|_ _ |", 10
      db "         |;|_|;|_|;|", 10
      db "         | \. . /", 10
      db "         \: . /", 10
      db "         ||: |", 10
      db "         ||:. |", 10
      db "         ||: .|", 10
      db "      ENTER IF YOU DARE!", 10
      db "=======================================", 10, 10, 0

hero_prompt db "Enter your hero name: ", 0

class_menu db "Choose your character:", 10
           db "[1] Warrior", 10
           db "[2] Mage", 10
           db "[3] Archer", 10
           db "Enter choice: ", 0

invalid_class db "Invalid selection. Please choose 1, 2, or 3.", 10, 0

welcome_player db "Welcome, ", 0
class_text db "! Your class is ", 0

warrior_name db "Warrior", 0
mage_name db "Mage", 0
archer_name db "Archer", 0

main_menu db 10
          db "=======================================", 10
          db "              MAIN MENU", 10
          db "=======================================", 10
          db "[1] Explore Dungeon", 10
          db "[2] View Character Status", 10
          db "[3] Use Health Potion", 10
          db "[4] View Inventory", 10
          db "[5] Exit Game", 10
          db "Enter choice: ", 0

invalid_menu db "Invalid selection. Please enter 1 to 5.", 10, 0

status_title db 10, "========== CHARACTER STATUS ==========", 10, 0
inventory_title db 10, "============ INVENTORY ============", 10, 0

name_label db "Name: ", 0
class_label db "Class: ", 0
health_label db "Health: ", 0
attack_label db "Attack: ", 0
potions_label db "Potions: ", 0
gold_label db "Gold: ", 0
room_label db "Room: ", 0
slash_text db " / ", 0
newline db 10, 0

no_potion db "Error: You have no health potions left. Health unchanged.", 10, 0
potion_used db "You used a health potion. Health restored by 20.", 10, 0
full_health db "Your health is already full. The potion was consumed.", 10, 0

room1_title db 10, "========== ROOM 1: GOBLIN CHAMBER ==========", 10, 0

goblin_art db "       , ,", 10
            db '     /(.-""-.)\', 10
            db "     |\ \/ \/ /|", 10
            db "     | \ / =. .= \ / |", 10
            db "      \ \   ^   / /", 10
            db "       \ '-----' /", 10
            db "   A GOBLIN APPEARS!", 10, 0

room2_title db 10, "========= ROOM 2: TREASURE CHAMBER =========", 10, 0

chest_art db "       __________", 10
          db "      /_________/|", 10
          db "      |  _____  | |", 10
          db "      | |  ?  | | |", 10
          db "      | |_____| | |", 10
          db "      |_________|/", 10
          db "[1] Open Chest", 10
          db "[2] Leave Chest", 10
          db "Enter choice: ", 0

gold_gained db "You opened the chest and gained 50 gold!", 10, 0
chest_left db "You left the chest behind.", 10, 0
invalid_chest db "Invalid choice. Please choose 1 or 2.", 10, 0

room3_title db 10, "========== ROOM 3: DRAGON'S LAIR ==========", 10, 0

dragon_art db "        / \\", 10
            db "       //\\", 10
            db "      |\___/|", 10
            db "      /0 0 \", 10
            db "     |  ^  |", 10
            db "      / \___/ \", 10
            db "     / \___________\/", 10
            db "   THE DRAGON AWAKENS!", 10, 0

combat_menu db 10, "[1] Attack", 10
            db "[2] Defend", 10
            db "[3] Use Potion", 10
            db "[4] Run", 10
            db "Enter choice: ", 0

invalid_combat db "Invalid combat selection. Please enter 1 to 4.", 10, 0
enemy_health_label db "Enemy Health: ", 0
your_health_label db "Your Health: ", 0

attack_message db 10, "You attacked the enemy!", 10, 0
defend_message db 10, "You defended and reduced the next enemy attack by 5.", 10, 0
run_message db 10, "You ran away and returned to the main menu.", 10, 0
enemy_attack_message db 10, "The enemy attacked you!", 10, 0
enemy_defeated_message db 10, "You defeated the enemy!", 10, 0

victory_message db 10, "VICTORY!", 10, 0
congratulations db "CONGRATULATIONS, ", 0
victory_end db "!", 10
             db "You defeated the dragon and escaped!", 10, 0
final_gold db "Final Gold: ", 0
remaining_health db "Remaining Health: ", 0
hero_message db 10, "YOU ARE A HERO!", 10, 0

game_over_message db 10, "GAME OVER", 10
                  db "Your hero has fallen.", 10
                  db "The dungeon remains undefeated.", 10
                  db "BETTER LUCK NEXT TIME!", 10, 0

exit_message db 10, "Thank you for playing.", 10, 0
input_buffer times 64 db 0

SECTION .bss

hero_name resb 32
class_choice resd 1
health resd 1
max_health resd 1
attack resd 1
potions resd 1
gold resd 1
current_room resd 1
enemy_health resd 1
enemy_damage resd 1
defend_bonus resd 1
game_over resd 1
game_won resd 1

SECTION .text

_start:
    call display_welcome
    call get_player_info
    call initialize_character

main_loop:
    cmp dword [game_over], 1
    je finish_game

    cmp dword [game_won], 1
    je finish_game

    call display_main_menu
    call read_number

    cmp eax, 1
    je menu_explore

    cmp eax, 2
    je menu_status

    cmp eax, 3
    je menu_potion

    cmp eax, 4
    je menu_inventory

    cmp eax, 5
    je menu_exit

    mov ecx, invalid_menu
    call print_string
    jmp main_loop

menu_explore:
    call explore_dungeon
    jmp main_loop

menu_status:
    call display_status
    jmp main_loop

menu_potion:
    call use_potion
    jmp main_loop

menu_inventory:
    call display_inventory
    jmp main_loop

menu_exit:
    call exit_program

finish_game:
    call display_game_result
    call exit_program

display_welcome:
    mov ecx, title
    call print_string
    ret

get_player_info:
    mov ecx, hero_prompt
    call print_string

    mov edi, hero_name
    call read_line

ask_class:
    mov ecx, class_menu
    call print_string

    call read_number

    cmp eax, 1
    je choose_warrior

    cmp eax, 2
    je choose_mage

    cmp eax, 3
    je choose_archer

    mov ecx, invalid_class
    call print_string
    jmp ask_class

choose_warrior:
    mov dword [class_choice], 1
    jmp show_welcome

choose_mage:
    mov dword [class_choice], 2
    jmp show_welcome

choose_archer:
    mov dword [class_choice], 3

show_welcome:
    mov ecx, welcome_player
    call print_string

    mov ecx, hero_name
    call print_string

    mov ecx, class_text
    call print_string

    call display_class_name
    call print_newline
    ret

initialize_character:
    mov dword [gold], 0
    mov dword [current_room], 1
    mov dword [game_over], 0
    mov dword [game_won], 0
    mov dword [defend_bonus], 0

    cmp dword [class_choice], 1
    je initialize_warrior

    cmp dword [class_choice], 2
    je initialize_mage

    jmp initialize_archer

initialize_warrior:
    mov dword [health], 100
    mov dword [max_health], 100
    mov dword [attack], 20
    mov dword [potions], 2
    ret

initialize_mage:
    mov dword [health], 70
    mov dword [max_health], 70
    mov dword [attack], 30
    mov dword [potions], 3
    ret

initialize_archer:
    mov dword [health], 85
    mov dword [max_health], 85
    mov dword [attack], 25
    mov dword [potions], 2
    ret

display_main_menu:
    mov ecx, main_menu
    call print_string
    ret

explore_dungeon:
    cmp dword [current_room], 1
    je room_one

    cmp dword [current_room], 2
    je room_two

    cmp dword [current_room], 3
    je room_three

    ret

room_one:
    mov ecx, room1_title
    call print_string

    mov ecx, goblin_art
    call print_string

    mov dword [enemy_health], 30
    mov dword [enemy_damage], 10
    mov dword [defend_bonus], 0

    call battle_enemy

    cmp eax, 1
    je proceed_room_two

    cmp eax, 2
    je player_lost

    ret

proceed_room_two:
    mov dword [current_room], 2
    jmp room_two

room_two:
    mov ecx, room2_title
    call print_string

    mov ecx, chest_art
    call print_string

treasure_choice:
    call read_number

    cmp eax, 1
    je open_chest

    cmp eax, 2
    je leave_chest

    mov ecx, invalid_chest
    call print_string
    jmp treasure_choice

open_chest:
    add dword [gold], 50

    mov ecx, gold_gained
    call print_string

    mov dword [current_room], 3
    jmp room_three

leave_chest:
    mov ecx, chest_left
    call print_string

    mov dword [current_room], 3
    jmp room_three

room_three:
    mov ecx, room3_title
    call print_string

    mov ecx, dragon_art
    call print_string

    mov dword [enemy_health], 60
    mov dword [enemy_damage], 15
    mov dword [defend_bonus], 0

    call battle_enemy

    cmp eax, 1
    je player_won

    cmp eax, 2
    je player_lost

    ret

player_won:
    mov dword [game_won], 1
    ret

player_lost:
    mov dword [game_over], 1
    ret

battle_enemy:
battle_loop:
    mov ecx, enemy_health_label
    call print_string

    mov eax, [enemy_health]
    call print_number
    call print_newline

    mov ecx, your_health_label
    call print_string

    mov eax, [health]
    call print_number
    call print_newline

    mov ecx, combat_menu
    call print_string

    call read_number

    cmp eax, 1
    je attack_enemy

    cmp eax, 2
    je defend_enemy

    cmp eax, 3
    je combat_use_potion

    cmp eax, 4
    je run_from_enemy

    mov ecx, invalid_combat
    call print_string
    jmp battle_loop

attack_enemy:
    mov ecx, attack_message
    call print_string

    mov eax, [enemy_health]
    sub eax, [attack]
    mov [enemy_health], eax

    cmp dword [enemy_health], 0
    jle enemy_defeated

    call enemy_turn

    cmp eax, 2
    je battle_lost

    jmp battle_loop

defend_enemy:
    mov ecx, defend_message
    call print_string

    mov dword [defend_bonus], 5

    call enemy_turn

    cmp eax, 2
    je battle_lost

    jmp battle_loop

combat_use_potion:
    call use_potion
    jmp battle_loop

run_from_enemy:
    mov ecx, run_message
    call print_string

    mov eax, 0
    ret

enemy_defeated:
    mov dword [enemy_health], 0

    mov ecx, enemy_defeated_message
    call print_string

    mov eax, 1
    ret

battle_lost:
    mov eax, 2
    ret

enemy_turn:
    mov ecx, enemy_attack_message
    call print_string

    mov eax, [enemy_damage]
    sub eax, [defend_bonus]

    cmp eax, 0
    jge valid_damage

    xor eax, eax

valid_damage:
    mov dword [defend_bonus], 0
    sub dword [health], eax

    cmp dword [health], 0
    jg player_alive

    mov dword [health], 0
    mov eax, 2
    ret

player_alive:
    mov eax, 1
    ret

use_potion:
    mov eax, [potions]

    cmp eax, 0
    je no_potions

    dec dword [potions]

    mov eax, [health]

    cmp eax, [max_health]
    jge health_already_full

    add eax, 20

    cmp eax, [max_health]
    jle save_potion_health

    mov eax, [max_health]

save_potion_health:
    mov [health], eax

    mov ecx, potion_used
    call print_string
    ret

health_already_full:
    mov ecx, full_health
    call print_string
    ret

no_potions:
    mov ecx, no_potion
    call print_string
    ret

display_status:
    mov ecx, status_title
    call print_string

    mov ecx, name_label
    call print_string

    mov ecx, hero_name
    call print_string
    call print_newline

    mov ecx, class_label
    call print_string

    call display_class_name
    call print_newline

    mov ecx, health_label
    call print_string

    mov eax, [health]
    call print_number

    mov ecx, slash_text
    call print_string

    mov eax, [max_health]
    call print_number
    call print_newline

    mov ecx, attack_label
    call print_string

    mov eax, [attack]
    call print_number
    call print_newline

    mov ecx, potions_label
    call print_string

    mov eax, [potions]
    call print_number
    call print_newline

    mov ecx, gold_label
    call print_string

    mov eax, [gold]
    call print_number
    call print_newline

    mov ecx, room_label
    call print_string

    mov eax, [current_room]
    call print_number
    call print_newline

    ret

display_inventory:
    mov ecx, inventory_title
    call print_string

    mov ecx, potions_label
    call print_string

    mov eax, [potions]
    call print_number
    call print_newline

    mov ecx, gold_label
    call print_string

    mov eax, [gold]
    call print_number
    call print_newline

    ret

display_class_name:
    cmp dword [class_choice], 1
    je show_warrior

    cmp dword [class_choice], 2
    je show_mage

    mov ecx, archer_name
    call print_string
    ret

show_warrior:
    mov ecx, warrior_name
    call print_string
    ret

show_mage:
    mov ecx, mage_name
    call print_string
    ret

display_game_result:
    cmp dword [game_won], 1
    je display_victory

    mov ecx, game_over_message
    call print_string
    ret

display_victory:
    mov ecx, victory_message
    call print_string

    mov ecx, congratulations
    call print_string

    mov ecx, hero_name
    call print_string

    mov ecx, victory_end
    call print_string

    mov ecx, final_gold
    call print_string

    mov eax, [gold]
    call print_number
    call print_newline

    mov ecx, remaining_health
    call print_string

    mov eax, [health]
    call print_number
    call print_newline

    mov ecx, hero_message
    call print_string
    ret

read_line:
    mov eax, 3
    mov ebx, 0
    mov ecx, edi
    mov edx, 31
    int 0x80

    cmp eax, 0
    jle read_line_done

    dec eax
    mov byte [edi + eax], 0

read_line_done:
    ret

read_number:
    mov edi, input_buffer
    call read_line

    mov esi, input_buffer
    xor eax, eax

convert_input:
    movzx ebx, byte [esi]

    cmp ebx, 0
    je number_done

    cmp ebx, '0'
    jl number_done

    cmp ebx, '9'
    jg number_done

    sub ebx, '0'

    imul eax, eax, 10
    add eax, ebx

    inc esi
    jmp convert_input

number_done:
    ret

print_string:
    push eax
    push ebx
    push ecx
    push edx
    push esi

    mov esi, ecx
    xor edx, edx

count_characters:
    cmp byte [esi + edx], 0
    je print_string_now

    inc edx
    jmp count_characters

print_string_now:
    mov eax, 4
    mov ebx, 1
    mov ecx, esi
    int 0x80

    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret

print_newline:
    mov ecx, newline
    call print_string
    ret

print_number:
    push eax
    push ebx
    push ecx
    push edx
    push esi
    push edi

    cmp eax, 0
    jne convert_number

    mov byte [input_buffer], '0'
    mov byte [input_buffer + 1], 0

    mov ecx, input_buffer
    call print_string
    jmp number_printed

convert_number:
    mov edi, input_buffer + 31
    mov byte [edi], 0
    mov ebx, 10

divide_number:
    dec edi
    xor edx, edx
    div ebx

    add dl, '0'
    mov [edi], dl

    cmp eax, 0
    jne divide_number

    mov ecx, edi
    call print_string

number_printed:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret

exit_program:
    mov ecx, exit_message
    call print_string

    mov eax, 1
    xor ebx, ebx
    int 0x80