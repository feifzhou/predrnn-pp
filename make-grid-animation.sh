dir=$1
history=`ls -d1v $dir/*/`
hist1=`ls -d1v $dir/*/|head -n1`
nhist=`ls -d1v $dir/*/|wc -l`
nimage=`ls -d1v $hist1/*/ |wc -l`
#echo "debug nhist $nhist nimage $nimage hist1 $hist1 " `ls -d1v $hist1/*/`

for step in `seq 11 20`; do
    images=`for i in $history; do echo "$i/*/pd$step.*"; done`
#    echo "step $step $images"
    montage -mode concatenate -borderwidth 1 -bordercolor red -tile ${nimage}x $hist1/*/gt$step.* $images  out$step.png
done
convert out*.png -delay 20 -loop 0 true-v-steps.gif
