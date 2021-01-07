#!/bin/bash

initializeANSI() {
    esc=""

    redf="${esc}[31m"
    greenf="${esc}[32m"
    yellowf="${esc}[33m"
    bluef="${esc}[34m"
    cyanf="${esc}[36m"
    purplef="${esc}[35m"
    whitef="${esc}[1m"
    lightbluef="${esc}104m"

    blink="${esc}[5m"
    boldon="${esc}[1m"
    reset="${esc}[0m"
}

initializeANSI

cat <<EOF

${boldon}${yellowf}                                  _.-.._         _._
${boldon}${yellowf}                             _,/^^,y./  ^^^^"""^^\\= \\
${boldon}${yellowf}                            \\y###XX;/  /     \\     ^\\^\\
${boldon}${yellowf}                               \\ u   /    .-==||==-.)^^
${boldon}${yellowf}           ,.-=""""=-.__       /^ (  (   -/<${reset}${boldon}${redf}${blink}0${reset}${boldon}${yellowf}>++<${reset}${boldon}${redf}${blink}0${reset}${boldon}${yellowf}(
${boldon}${yellowf}         .^      .: . . :^===(^ \\ (  (  /'''^^^^^^^)
${boldon}${yellowf}        /      .: .,Arco_,_ .(   \\   /    /-(o'~'o))
${boldon}${yellowf}      .^      : . gGG"""YGG}. \\   )   / /  _/-====-\\
${boldon}${yellowf}     /       (. Arco   __Arco .\\  \\  (    (  _.---._)
${boldon}${yellowf}    /        (. (GGb,,)GGp. . . \\_-^-.__(_ /______./
${boldon}${yellowf}   (          \\ . 'Arco.. . . . . ^=-._--_--^^^^^~)
${boldon}${yellowf}   (        /^^^\\_. . . . . . . . . . . . . . . . )
${boldon}${yellowf}   )       /     /._. . . . . . . . . . . . . ._.=)
${boldon}${yellowf}   \      /      |  ^"=.. . . . . . . ._++""\\''^   \\
${boldon}${yellowf}    \    |       |       )^|^^~'---'~^^      \\     )
${boldon}${yellowf}    )   /        )      /   \\                 \\    \\
${boldon}${yellowf}    |;  |        \\     /\\    \\                (    /
${boldon}${yellowf}    |   |         (   (  \\ .. \\               |   (    
${boldon}${yellowf}    )   |         )   )   ^^^^^^              |   |    
${boldon}${yellowf}   /. . \\         |  '|                       )   (   
${boldon}${yellowf}   ^^^^^^         )   \\                       /. . \\  
${boldon}${yellowf}                  / . .\\                      ^^^^^^
${boldon}${yellowf}                  ^^^^^^^  ${reset}

EOF
