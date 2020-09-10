#! /bin/bash
#
# run.sh
# Copyright (C) 2020 Kazuhiro KOBAYASHI <root.4mac@gmail.com>
#
# Distributed under terms of the MIT license.
#


wavdir=wav22k

if [ ! -e $wavdir/feats/features.f32 ] ; then
    ./dump_data \
        -train $wavdir/train.raw \
        $wavdir/feats/features.f32 \
        $wavdir/feats/data.u8
fi

python src/train_lpcnet.py \
    $wavdir/feats/features.f32 \
    $wavdir/feats/data.u8 \
    $wavdir/model
