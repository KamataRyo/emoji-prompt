#!/bin/bash
# TODO
#   - Add error checks of Arguments

function __emoji_pt() {
    if [[ $# -lt 2 ]]; then
        return 1
    else

        # you can set offset of the list
        if [[ $# -gt 2 ]]; then
            OFFSET=$3
        else
            OFFSET=0
        fi

        # you can overwrite default Emoji set
        if [[ $# -gt 3 ]]; then
            EMOJIs=$4
        else
            EMOJIs=(🐶 🐺 🐱 🐭 🐹 🐰 🐸 🐯 🐨 🐻 🐷 🐽 🐮 🐗 🐵 🐒 🐴 🐑 🐘 🐼 🐧 🐦 🐤 🐥 🐣 🐔 🐍 🐢 🐛 🐝 🐜 🐞 🐌 🐙 🐚 🐠 🐟 🐬 🐳 🐋 🐄 🐏 🐀 🐃 🐅 🐇 🐉 🐎 🐐 🐓 🐕 🐖 🐁 🐂 🐲 🐡 🐊 🐫 🐪 🐆 🐈 🐩 🐾 💐 🌸 🌷 🍀 🌹 🌻 🌺 🍁 🍃 🍂 🌿 🌾 🍄 🌵 🌴 🌲 🌳 🌰 🌱 🌼 🌐 🌞 🌝 🌚 🌑 🌒 🌓 🌔 🌕 🌖 🌗 🌘 🌜 🌛 🌙 🌍 🌎 🌏 🌋 🌌 🌠 ⭐ ❄ ⛄ 🌀 🌁 🌈 🌊 🎍 💝 🎎 🎒 🎓 🎏 🎆 🎇 🎐 🎑 🎃 👻 🎅 🎄 🎁 🎋 🎉 🎊 🎈 🎌 🔮 🎥 📷 📹 📼 📀 💽 📟 📠 📡 📺 📻 🔊 🔔 📢 ⏳ ⏰ ⌚ 🔑 🔎 💡 🔦 🔆 🔌 🔋 🔍 🛁 🚿 🚽 🔧 🔩 🔨 🚪 🚬 💣 🔫 🔪 💊 💉 💰 💴 💳 💸 📯 📮 📦 📊 📋 📅 📌 📎 📏 📐 📕 📗 📘 📙 📓 📔 📒 📚 📖 🔖 📛 🔬 🔭 📰 🎨 🎬 🎤 🎵 🎹 🎻 🎺 🎷 🎸 👾 🎮 🃏 🎴 🀄 🎲 🎯 🏈 🏀 ⚽ 🎾 🎱 🏉 🎳 ⛳ 🚴 🏁 🏇 🏆 🎿 🏂 🏊 🏄 🎣 🍵 🍶 🍼 🍺 🍻 🍸 🍹 🍷 🍴 🍕 🍔 🍟 🍗 🍖 🍝 🍛 🍤 🍱 🍣 🍥 🍙 🍘 🍚 🍜 🍲 🍢 🍡 🍳 🍞 🍩 🍮 🍦 🍨 🍧 🎂 🍰 🍪 🍫 🍬 🍭 🍯 🍎 🍏 🍊 🍋 🍒 🍇 🍉 🍓 🍑 🍈 🍌 🍐 🍍 🍠 🍆 🍅 🌽)
        fi

        # hash in 16base
        IDhex=$(echo "$1$2" | openssl md5 | tail -c 5)
        # hash in 10base
        IDdec=$(($(printf '%d\n' "0x$IDhex") + OFFSET))
        # modulous
        N=${#EMOJIs[*]}
        INDEX=$((IDdec % N))
        echo "${EMOJIs[INDEX]}"
        return 0
    fi
}
