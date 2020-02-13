/*
Copyright 2020 VegaASM

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0
    
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

cmpwi r3, 0
bne+ move_to_ctr

li r3, 4 #If user sets r3 arg to 0, adjust it to 4.

move_to_ctr:
mtctr r3 #LR doesn't need to be backed up for this subroutine
mftbl r4 #Seed register

li r3, 0 #Square-value register, start at 0
li r5, 0 #Starting Weyl variable, start at 0

clrlwi. r0, r4, 31 #Seed needs to be an odd number
bne- loop

addi r4, r4, 1 #Make seed odd

loop:
mullw r3, r3, r3 #Square the Value

add r5, r4, r5 #Add the constant seed to Weyl variable. Result is new Weyl variable
add r3, r3, r5 #Add Weyl variable to squared value

srwi r3, r3, 16 #Place upper 16 bits into lower 16 bits, upper 16 bits are now cleared
bdnz+ loop

blr #r3 contains random halfword result
