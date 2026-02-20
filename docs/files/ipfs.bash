# Initialize your computer as an IPFS node with:
./ipfs init

# Output
# generating ED25519 keypair...done
# peer identity: 12D3KooWQQe2yFFNE4iqMz1HFBhd2CGN4f5XD9MgB4YNBLyjsqt8
# initializing IPFS node at /home/user/.ipfs

# Inspect the initialized IPFS root:
tree ~/.ipfs

# Output
# /home/user/.ipfs
# ├── blocks
# │   ├── diskUsage.cache
# │   ├── _README
# │   ├── SHARDING
# │   └── X3
# │       └── CIQFTFEEHEDF6KLBT32BFAGLXEZL4UWFNWM4LFTLMXQBCERZ6CMLX3Y.data
# ├── config
# ├── datastore
# │   ├── 000001.log
# │   ├── CURRENT
# │   ├── LOCK
# │   ├── LOG
# │   └── MANIFEST-000000
# ├── datastore_spec
# ├── keystore
# └── version

./ipfs daemon

# Output
# Initializing daemon...
# ...
# Daemon is ready

# NB. Open another terminal window, to continue
# Add a string to IPFS:
echo "Hello Learn X in Y minutes" | ./ipfs add

# Output
# added QmfGEMEzFrHB3e9RwZvboUmAL9tY6KVvKEcWgiHWxvY9f1 QmfGEMEzFrHB3e9RwZvboUmAL9tY6KVvKEcWgiHWxvY9f1

./ipfs cat QmfGEMEzFrHB3e9RwZvboUmAL9tY6KVvKEcWgiHWxvY9f1

# Output
# Hello Learn X in Y minutes
# Convert your v0 identifier to base32:
./ipfs cid base32 QmfGEMEzFrHB3e9RwZvboUmAL9tY6KVvKEcWgiHWxvY9f1

# Output
# bafybeih3othzkow5sr2t6q7smwzrrfgitw277ytesdkb43z527afnhwoqq

# Request the data from an IPFS Gateway:
curl https://bafybeih3othzkow5sr2t6q7smwzrrfgitw277ytesdkb43z527afnhwoqq.ipfs.dweb.link

# Output
# Hello Learn X in Y minutes

# Do the same via another gateway:
curl https://ipfs.io/ipfs/bafybeih3othzkow5sr2t6q7smwzrrfgitw277ytesdkb43z527afnhwoqq

# Output
# Hello Learn X in Y minutes

# Create a CID from the outset:
echo "crerating a CID from the outset" | ./ipfs add --cid-version 1

# Output
# added bafkreie5gakawm2czygbrzprxl56eo5cv76tlkn6ckytncb7hdyy4mqfsu bafkreie5gakawm2czygbrzprxl56eo5cv76tlkn6ckytncb7hdyy4mqfsu


# Because we know its address up front we can download and view XKCD 927:
./ipfs get QmTJc66pWBfz8oaS2dQhQqq3UJex7E9r3jTVswHifzD76p

# Output
# Saving file(s) to QmTJc66pWBfz8oaS2dQhQqq3UJex7E9r3jTVswHifzD76p

tree QmTJc66pWBfz8oaS2dQhQqq3UJex7E9r3jTVswHifzD76p

# Output
# QmTJc66pWBfz8oaS2dQhQqq3UJex7E9r3jTVswHifzD76p
# ├── 927 - Standards - alt.txt
# ├── 927 - Standards.png
# └── 927 - Standards - transcript.txt

# These can all be viewed locally with nix tooling, or we can continue to use
# IPFS:
./ipfs cat QmaHkEgzRdocAK3bvZWjhxvoHv2kAKkmMwyoQcxbUGVKxg | display

# Output
# Will display in `display` if installed with ImageMagick.

# And its transcript:
./ipfs cat QmUvEch4som4WK7dmE5pLoM3GBA7nCeqms8oqKyaaF9Wgy

# Output
# HOW STANDARDS PROLIFERATE
# (See: A
# C chargers, character encodings, instant messaging, etc.)
#
# SITUATION:
# There are 14 competing standards.
#
# Geek: 14?! Ridiculous! We need to develop one universal standard that covers everyone's use cases.
# Fellow Geek: Yeah!
#
# Soon:
# SITUATION:
# There are 15 competing standards.
#
# {{Title text: Fortunately, the charging one has been solved now that we've all standardized on mini-USB. Or is it micro-USB? Shit.}}

# Its alt-text:
./ipfs cat QmfNvocxez2nEChH95BQCLhJLciy5dmwbGW4NofTUvNvgu

# Output
# Fortunately, the charging one has been solved now that we've all standardized on mini-USB. Or is it micro-USB? Shit.

# List the files that you are "providing" / "hosting" locally that others can
# access via the IPFS:
./ipfs pin ls

# Output
# QmUNLLsPACCz1vLxQVkXqqLX5R1X345qqfHbsf67hvA3Nn recursive
# QmfGEMEzFrHB3e9RwZvboUmAL9tY6KVvKEcWgiHWxvY9f1 recursive

# Not all of these will be the files you added, so inspect them.to understand
# what they are:
./ipfs files stat /ipfs/QmfGEMEzFrHB3e9RwZvboUmAL9tY6KVvKEcWgiHWxvY9f1

# Output
# QmfGEMEzFrHB3e9RwZvboUmAL9tY6KVvKEcWgiHWxvY9f1
# Size: 27
# CumulativeSize: 35
# ChildBlocks: 0
# Type: file
# Mode: not set (not set)
# Mtime: not set
# Write some new data:
echo "[1]" | ./ipfs add --cid-version 1

# Output
# added bafkreifmyb5wf4r7iwesg434jtkkm26qluphd22phbaahovpfxghmdldje bafkreifmyb5wf4r7iwesg434jtkkm26qluphd22phbaahovpfxghmdldje

# Publish the data to your default IPNS:
./ipfs name publish /ipfs/bafkreifmyb5wf4r7iwesg434jtkkm26qluphd22phbaahovpfxghmdldje

# Output
# Published to k51qzi5uqu5dhl7wp9jatxst1ke5ms4l0cp26yjk4orf4t7dr5xvj4u8pj0ib0: /ipfs/bafkreifmyb5wf4r7iwesg434jtkkm26qluphd22phbaahovpfxghmdldje

# View your file via a gateway:
curl https://ipfs.io/ipns/k51qzi5uqu5dhl7wp9jatxst1ke5ms4l0cp26yjk4orf4t7dr5xvj4u8pj0ib0

# Output
# [1]

# Change your data and publish it to your IPNS:
echo "[1, 2]" | ./ipfs add --cid-version 1

# Output
# added bafkreia7wp746ppytyy7k2js2steui7o32fc6zyhrgf7cti7yqvhqkdina bafkreia7wp746ppytyy7k2js2steui7o32fc6zyhrgf7cti7yqvhqkdina

# Publish the new CID:
./ipfs name publish bafkreia7wp746ppytyy7k2js2steui7o32fc6zyhrgf7cti7yqvhqkdina

# Output
# Published to k51qzi5uqu5dhl7wp9jatxst1ke5ms4l0cp26yjk4orf4t7dr5xvj4u8pj0ib0: /ipfs/bafkreia7wp746ppytyy7k2js2steui7o32fc6zyhrgf7cti7yqvhqkdina

# Wait 5-10 minutes and poll the gateway again:
curl https://ipfs.io/ipns/k51qzi5uqu5dhl7wp9jatxst1ke5ms4l0cp26yjk4orf4t7dr5xvj4u8pj0ib0

# Output
# [1, 2]

# Other IPNS names can be used for more granular control of persistent
# IPNS links, e.g., different content; your blog, homepage, media collection,
# and so on:
./ipfs key gen my-new-key

# Output
# k51qzi5uqu5dkyu7b6rdcayq3tvmfwqh90hjea80n5p9ih4p3amxar98c1r0wp

./ipfs name publish /ipfs/bafkreidhgwhnr7lm2tmkvqz2zkrxnnmcg67lreod5gcokbot4v7eh56tea --key my-new-key

# Output
# Published to k51qzi5uqu5dkyu7b6rdcayq3tvmfwqh90hjea80n5p9ih4p3amxar98c1r0wp: /ipfs/bafkreidhgwhnr7lm2tmkvqz2zkrxnnmcg67lreod5gcokbot4v7eh56tea

# The key `my-new-key`: k51qzi5uqu5dkyu7b6rdcayq3tvmfwqh90hjea80n5p9ih4p3amxar98c1r0wp
# is an ed25519 key.

# Sign data and publish it as follows:
DATA_TO_SIGN="Hello security!"
echo $DATA_TO_SIGN | ./ipfs add && echo $DATA_TO_SIGN | ./ipfs key sign --key my-new-key | ./ipfs add

# Output
# added QmaQhz8NPzZqLsu4b8ZgNzue1SaEAMgz4FV282kRez1F7P QmaQhz8NPzZqLsu4b8ZgNzue1SaEAMgz4FV282kRez1F7P
# added QmNLh2WNKVArkDo88rJozDMRTAQxLBtGU2xHmJVZ13yK9M QmNLh2WNKVArkDo88rJozDMRTAQxLBtGU2xHmJVZ13yK9M

# Imagine you alreaday know of the public key from a trusted party.

# Verify signed data retrieve from IPFS:
./ipfs cat QmaQhz8NPzZqLsu4b8ZgNzue1SaEAMgz4FV282kRez1F7P | \
 ./ipfs key verify \
 --signature $(./ipfs cat QmNLh2WNKVArkDo88rJozDMRTAQxLBtGU2xHmJVZ13yK9M | \
 jq -r .Signature) \
 --key k51qzi5uqu5dkyu7b6rdcayq3tvmfwqh90hjea80n5p9ih4p3amxar98c1r0wp | jq

# It's a little clunky but it may provide a useful demonstration for
# you to build on.

# Output
# {
#   "Key": {
#     "Name": "",
#     "Id": "k51qzi5uqu5dkyu7b6rdcayq3tvmfwqh90hjea80n5p9ih4p3amxar98c1r0wp"
#   },
#   "SignatureValid": true
# }

# List all locally pinned files:
./ipfs pin ls --type=all

# Output
# QmfGEMEzFrHB3e9RwZvboUmAL9tY6KVvKEcWgiHWxvY9f1 recursive
# bafkreie5gakawm2czygbrzprxl56eo5cv76tlkn6ckytncb7hdyy4mqfsu recursive

# Garbage collect (gc) what's already available to gc:
./ipfs repo gc

# Output
# removed bafkreih5fqe4ew6ir2inqa3u76ize2yg3nsxw3m5wmfk25ijmqf4payioy
# removed bafkreidbycqgtvz2ph7o5cu4jktzyy2k544k6fod73gfybqfk2moy7wuei
# removed bafkreigfrvnk6clikkwxjftgxyy6nfo6ocekd5sqpp34yjereup4wul4jm
# removed bafkreifrrxabyunbp4l4ictsyfzhh32l6j7srpp472kr3dnj5rkl2ztiku
# removed bafkreicjyrhuoztkpfcjl3dyhv6gstkcsgbgurfah3s4s3fi6adolgb2te
# removed bafkreicghp2nkqdxabzeo6u4vrcn3pxmx7v6fnaj5lpuvnsgrj7tukbl4y

# Unpin one of your own test files:
./ipfs pin rm QmfGEMEzFrHB3e9RwZvboUmAL9tY6KVvKEcWgiHWxvY9f1

# Output
# unpinned QmfGEMEzFrHB3e9RwZvboUmAL9tY6KVvKEcWgiHWxvY9f1

# Content is removed locally, and may only be retrievable globally if
# cached by another peer.

# If you shutdown the IPFS daemon, you can try retrieval:
./ipfs get QmfGEMEzFrHB3e9RwZvboUmAL9tY6KVvKEcWgiHWxvY9f1

# Output
# Error: block was not found locally (offline): ipld: could not find QmfGEMEzFrHB3e9RwZvboUmAL9tY6KVvKEcWgiHWxvY9f1

# Start the daemon again as you did in the first steps before moving on.
# Having unpinned and removed the content "Hello Learn X in Y minutes" with
# the CID `QmfGEMEzFrHB3e9RwZvboUmAL9tY6KVvKEcWgiHWxvY9f1` try adding it to
# IPFS again:
echo "Hello Learn X in Y minutes" | ./ipfs add

# Output
# added QmfGEMEzFrHB3e9RwZvboUmAL9tY6KVvKEcWgiHWxvY9f1 QmfGEMEzFrHB3e9RwZvboUmAL9tY6KVvKEcWgiHWxvY9f1

# The hashes match. The data can be retrieved again.
./ipfs cat QmfGEMEzFrHB3e9RwZvboUmAL9tY6KVvKEcWgiHWxvY9f1

# Output
# Hello Learn X in Y minutes

# This makes it easy to understand path behaviors when it is provided to
# the IPFS as well as promoting some level of deduplication.
# Add JSON directly to IPLD:
echo '{"Hello": "Learn X in Y minutes" }' | ./ipfs dag put

# Output
# bafyreiatmqgvdvcum4w4lwy2cwzixweoshjfvuy6pcoixhd5hz4imrohse

./ipfs dag get bafyreiatmqgvdvcum4w4lwy2cwzixweoshjfvuy6pcoixhd5hz4imrohse | jq

# Output
# {
#   "Hello": "Learn X in Y minutes"
# }

# You can also output CBOR:
./ipfs dag get bafyreiatmqgvdvcum4w4lwy2cwzixweoshjfvuy6pcoixhd5hz4imrp --output-codec cbor | xxd -p

# Output
# a16548656c6c6f744c6561726e205820696e2059206d696e75746573

# Which looks as follows in CBOR playground:
#
# A1                                      # map(1)
#    65                                   # text(5)
#       48656C6C6F                        # "Hello"
#    74                                   # text(20)
#       4C6561726E205820696E2059206D696E75746573 # "Learn X in Y minutes"

# The largest benefit might be storing data as data.
# But if you do have interconnected data you can model it by linking
# back to previous DAG CIDs.
echo '{"foo": "bar", "prev_cid": "bafyreiatmqgvdvcum4w4lwy2cwzixweoshjfvuy6pcoixhd5hz4imrohse" }' \
 | ./ipfs dag put

# Output
# bafyreihl77szrg4z6ftm23z43ymurqtpggtypln5qndhw36s4diludlyli

# Retrieve the data:
./ipfs dag get bafyreihl77szrg4z6ftm23z43ymurqtpggtypln5qndhw36s4diludlyli --output-codec json

# Output
# {
# 	"foo": "bar",
# 	"prev_cid": "bafyreiatmqgvdvcum4w4lwy2cwzixweoshjfvuy6pcoixhd5hz4imrohse"
# }

# You must input "data", e.g. JSON, not raw bytes that IPLD is able to
# parse and re-present back to users as anticipated.

# Input invalid data, i.e. plain bytes:
echo "Hello Learn X in Y minutes" | ./ipfs dag put

# Output
# Error: Invalid byte while expecting start of value: 0x48

# Input valid data:
echo "{}" | ./ipfs dag put

# Output
# bafyreigbtj4x7ip5legnfznufuopl4sg4knzc2cof6duas4b3q2fy6swua

# Data with equivalent content is treated equally.
echo '{"e": "f", "a": "b", "c": "d" }' | ./ipfs dag put

# Output
# bafyreih3bjm5aujqidwimp2ouua5bfzf6agw5bt2j5h2aveuwfrvu4cgai

# Change the order of the keys and add it to IPFS.
echo '{ "c": "d", "e": "f", "a": "b" }' | ./ipfs dag put

# Output
# bafyreih3bjm5aujqidwimp2ouua5bfzf6agw5bt2j5h2aveuwfrvu4cgai

# bafyreih3bjm5aujqidwimp2ouua5bfzf6agw5bt2j5h2aveuwfrvu4cgai ==
# bafyreih3bjm5aujqidwimp2ouua5bfzf6agw5bt2j5h2aveuwfrvu4cgai

# When it is retrieved you will see the keys are storted.
./ipfs dag get bafyreih3bjm5aujqidwimp2ouua5bfzf6agw5bt2j5h2aveuwfrvu4cgai

# Output
# {"a":"b","c":"d","e":"f"}

# Sorting of keys affects the appearance of the data, which can be
# unsettling for some and may be a consideration in its design for the end
# user, but it does not affect its interpretation by JSON-based tools
# or libraries.
# All commands can be output with:
./ipfs commands

# Count them as follows:
./ipfs commands | wc -l

# Output
# 201 (commands)
