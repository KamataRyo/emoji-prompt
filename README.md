# Emoji Prompt

[![Build Status](https://travis-ci.org/KamataRyo/emoji-prompt.svg?branch=master)](https://travis-ci.org/KamataRyo/emoji-prompt)

You can put Emoji at your prompts.
This is not simply randomized, hashed and serialized for the prompt.
It would be more distinguishable whose and which shell you are using.

Hashing is unique to each username-hostname combinations.
Collision occurs if registered Emoji short. If so, sorry :)
```
🍀 [user1@hostA] ~ $ ssh user2@hostB
🐘 [user2@hostB] ~ $ ssh user3@hostC
🐟 [user3@hostC] ~ $ su user4
🐬 [user4@hostC] user3 $ ssh user1@hostA
🍀 [user1@hostA] ~ $ exit
🐬 [user4@hostC] user3 $ exit
🐟 [user3@hostC] ~ $ exit
🐘 [user2@hostB] ~ $ exit
🍀 [user1@hostA] ~ $ _
```

# install
```
# install depended module, but perhaps you have this
$ brew openssl

# Copy this repo
$ git clone https://github.com/KamataRyo/emoji-prompt.git

# Put the source to Anywhere
$ mv emoji-prompt/emoji-prompt.sh ~/.emoji-prompt.sh

# load the function for PS1 in .bash_profile
$ vi ~/.bash_profile
..
source $HOME/.emoji-prompt.sh
export PS1="(__emoji_pt \u \h) [\u@\h \W] $ "
```

# Questions and Usages
- Q. I don't like the choosen Emoji for my main prompt.
  ```
  🐛 [user@host ~] $ _
  ```
- A. Try 3rd argument `OFFSET`. You can offset Hash list to select Emoji, though the emoji shifts to be another.
  ```
  🐛 [user@host ~] $ vi ~/.bash_profile
  ..
  export PS1="(__emoji_pt \h \h 9) [\u@\h \W] $ "

  🐬 [user@host ~] $ _
  ```

  Or you can try 4th argument `EMOJIs`. This overwrites default Emoji lists. You can eliminate what you don't want to include.
  ```
  # choose pretty Emojis sets as array
  🐛 [user@host ~] $ vi ~/.bash_profile
  ..
  export PS1="(__emoji_pt \h \h 0 (🐬 🐗 🐵 ..)) [\u@\h \W] $ "

  🐬 [user@host ~] $ _
  ```
  Be careful to add sufficient amounts of Emoji to avoid collision.
