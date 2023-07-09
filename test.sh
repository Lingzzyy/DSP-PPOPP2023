source /root/miniconda3/etc/profile.d/conda.sh
model="graphsage"

conda activate quiver
echo pyg_epoch_time
mkdir -p logs/pyg/train
for dataset in "paper"; do
  for rank in 4 8; do
    bash pyg/run.sh $dataset $rank 0 >& logs/pyg/train/${dataset}_${rank}gpus.txt
  done
done

conda activate quiver
echo quiver_epoch_time
mkdir -p logs/quiver/train
for dataset in "paper"; do
  for rank in 4 8; do
    bash quiver/run.sh $dataset $rank 0 >&  logs/quiver/train/${dataset}_${rank}gpus.txt
  done
done
