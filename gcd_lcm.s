.org 0x80020000
.set noreorder
.ent _start
.text
.globl __start
__start: 
 
   la $s3, src  //load addresses of arrays
   la $s4,tar
   la $s5,tar_1

   addi $sp, $sp,-4
   sw $ra,0($sp)

   addi $a2,$zero,66 // initialize help registerss
   addi $a3,$zero,0
   addi $t1,$zero,2

   addi $a1,$zero,0
   lw $t0,0($s3) // load to register first value for lcm and gcd 

loop:
  
   addi $s3,$s3,4
   lw $t5,0($s3) // load to register first value for lcm and gcd

   jal lcm  // call lcm

   addi $a1,$a1,1

   jal gcd  // call gcd

   bne $a1,$t1,loop  // main loop

   addi $s3,$s3,4
   addi $a3,$a3,1

   lw $t0,0($s3)
   addi $a1,$zero,0

   sw $s2,0($s5)  // write data to gcd and lcm arrays
   sw $s0,0($s4)  // $s2 contain lcd result and $s0 contain gcd result

   addi $s5,$s5,4 // indexing of arrays
   addi $s4,$s4,4

   bne $a3,$a2,loop

   nop

l1: break

lcm:

   addi $sp,$sp,-12  // pass arguments
   sw $t5,8($sp)     // pass retrun address and two values every time 
   sw $t0,4($sp)
   sw $ra,0($sp)

   lw $s0,4($sp)
   lw $s1,8($sp)

lcm_loop:

   //mult $s0,$s1
   //mflo $a0
 
   jal gcd  // find gcd value

   nop

   div $t0,$s0 // div gcd value and first argument
   mflo $s7
   mul $s2,$s7,$t5 // multiply result from div with second argument

   lw $ra,0($sp)
   addi $sp,$sp,12
   nop
   jr $ra

gcd:
   addi $sp,$sp,-12  // pass arguments
   sw $t5,8($sp)     // pass retrun address and two nums every time 
   sw $t0,4($sp)
   sw $ra,0($sp)

   lw $s0,4($sp)
   lw $s1,8($sp)
   //nop

gcd_loop:    

   div $s0,$s1  // divide tow nums 
   mflo $a0

   add $s0,$zero,$s1 // copy second num to first while $s1 get value 0

   mfhi $s1

   bne $s1,$zero,gcd_loop

cont:
   lw $ra,0($sp)
   addi $sp,$sp,12
   nop
   jr $ra
   
l:

.data
.org 0x10000000
src: .word 3, 6, 5, 7, 8, 9, 28, 32, 64, 10 , 11 , 12 , 13 , 14 , 15 , 16 , 17 , 18 , 19 , 20 , 21 , 22 , 23 , 24 , 25 , 26 , 27 , 28 , 29 , 30 , 31 , 32 , 33 , 34 , 35 , 36 , 37 , 38 , 39 , 40 , 41 , 42 , 43 , 44 , 45 , 46 , 47 , 48 , 49 , 50 , 51 , 52 , 53 , 54 , 55 , 56 , 57 , 58 , 59 , 60 , 61 , 62 , 63 , 64 , 65 , 66 , 67 , 68 , 69 , 70 , 71 , 72 , 73 , 74 , 75 , 76 , 77 , 78 , 79 , 80 , 81 , 82 , 83 , 84 , 85 , 86 , 87 , 88 , 89 , 90 , 91 , 92 , 93 , 94 , 95 , 96 , 97 , 98 , 99 , 100 , 101 , 102 , 103 , 104 , 105 , 106 , 107 , 108 , 109 , 110 , 111 , 112 , 113 , 114 , 115 , 116 , 117 , 118 , 119 , 120 , 121 , 122 , 123 , 124 , 125 , 126 , 127 , 128 , 129 , 130 , 131 , 132 , 133 , 134 , 135 , 136 , 137 , 138 , 139 , 140 , 141 , 142 , 143 , 144 , 145 , 146 , 147 , 148 , 149 , 150 , 151 , 152 , 153 , 154 , 155 , 156 , 157 , 158 , 159 , 160 , 161 , 162 , 163 , 164 , 165 , 166 , 167 , 168 , 169 , 170 , 171 , 172 , 173 , 174 , 175 , 176 , 177 , 178 , 179 , 180 , 181 , 182 , 183 , 184 , 185 , 186 , 187 , 188 , 189 , 190 , 191 , 192 , 193 , 194 , 195 , 196 , 197 , 198
tar: .word 66
tar_1: .word 66
