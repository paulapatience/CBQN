#!/usr/bin/env bash
make f='-DDEBUG -DHEAP_VERIFY -DJIT_START=0' single-c
echo 'alljit+heapverify:'                     && ./BQN -M 1000 "$1/test/this.bqn" -noerr bytecode header identity literal namespace prim simple syntax token under undo unhead || exit
echo 'singeli:';make o3n-singeli              && ./BQN -M 1000 "$1/test/this.bqn" || exit
echo 'singeli vfy:';make heapverifyn-singeli  && ./BQN -M 1000 "$1/test/this.bqn" -noerr bytecode header identity literal namespace prim simple syntax token under undo unhead || exit
echo '32-bit:';make f='-DDEBUG -m32' single-c && ./BQN -M 1000 "$1/test/this.bqn" || exit
