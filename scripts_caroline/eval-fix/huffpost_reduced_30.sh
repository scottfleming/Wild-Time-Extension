#!/bin/bash
#SBATCH --partition=iris-hi # Run on IRIS nodes
#SBATCH --time=120:00:00 # Max job length is 5 days
#SBATCH --nodes=1 # Only use one node (machine)
#SBATCH --mem=128G # Request 16GB of memory
#SBATCH --gres=gpu:1 # Request one GPU
#SBATCH --job-name="huffpost-reduced-30-eval-fix" # Name the job (for easier monitoring)
#SBATCH --mail-type=END,FAIL          # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=cchoi1@stanford.edu     # Where to send mail

# Now your Python or general experiment/job runner code
source /iris/u/huaxiu/venvnew/bin/activate

cd ../..

python main.py --dataset=huffpost --method=coral --offline --coral_lambda=0.9 --num_groups=3 --group_size=2 --mini_batch_size=32 --train_update_iter=6000 --lr=2e-5 --weight_decay=0.01 --split_time=2015 --num_workers=8 --random_seed=1 --reduced_train_prop=0.3
python main.py --dataset=huffpost --method=coral --offline --coral_lambda=0.9 --num_groups=3 --group_size=2 --mini_batch_size=32 --train_update_iter=6000 --lr=2e-5 --weight_decay=0.01 --split_time=2015 --num_workers=8 --random_seed=2 --reduced_train_prop=0.3
python main.py --dataset=huffpost --method=coral --offline --coral_lambda=0.9 --num_groups=3 --group_size=2 --mini_batch_size=32 --train_update_iter=6000 --lr=2e-5 --weight_decay=0.01 --split_time=2015 --num_workers=8 --random_seed=3 --reduced_train_prop=0.3

python main.py --dataset=huffpost --method=groupdro --offline --num_groups=3 --group_size=2 --mini_batch_size=32 --train_update_iter=6000 --lr=2e-5 --weight_decay=0.01 --split_time=2015 --num_workers=8 --random_seed=1 --reduced_train_prop=0.3
python main.py --dataset=huffpost --method=groupdro --offline --num_groups=3 --group_size=2 --mini_batch_size=32 --train_update_iter=6000 --lr=2e-5 --weight_decay=0.01 --split_time=2015 --num_workers=8 --random_seed=2 --reduced_train_prop=0.3
python main.py --dataset=huffpost --method=groupdro --offline --num_groups=3 --group_size=2 --mini_batch_size=32 --train_update_iter=6000 --lr=2e-5 --weight_decay=0.01 --split_time=2015 --num_workers=8 --random_seed=3 --reduced_train_prop=0.3

python main.py --dataset=huffpost --method=irm --offline --irm_lambda=1.0 --irm_penalty_anneal_iters=0 --num_groups=3 --group_size=2 --mini_batch_size=32 --train_update_iter=6000 --lr=2e-5 --weight_decay=0.01 --split_time=2015 --num_workers=8 --random_seed=1 --reduced_train_prop=0.3
python main.py --dataset=huffpost --method=irm --offline --irm_lambda=1.0 --irm_penalty_anneal_iters=0 --num_groups=3 --group_size=2 --mini_batch_size=32 --train_update_iter=6000 --lr=2e-5 --weight_decay=0.01 --split_time=2015 --num_workers=8 --random_seed=2 --reduced_train_prop=0.3
python main.py --dataset=huffpost --method=irm --offline --irm_lambda=1.0 --irm_penalty_anneal_iters=0 --num_groups=3 --group_size=2 --mini_batch_size=32 --train_update_iter=6000 --lr=2e-5 --weight_decay=0.01 --split_time=2015 --num_workers=8 --random_seed=3 --reduced_train_prop=0.3

python main.py --dataset=huffpost --method=erm --offline --mini_batch_size=32 --train_update_iter=6000 --lr=2e-5 --weight_decay=0.01 --split_time=2015 --num_workers=8 --random_seed=1 --reduced_train_prop=0.3
python main.py --dataset=huffpost --method=erm --offline --mini_batch_size=32 --train_update_iter=6000 --lr=2e-5 --weight_decay=0.01 --split_time=2015 --num_workers=8 --random_seed=2 --reduced_train_prop=0.3
python main.py --dataset=huffpost --method=erm --offline --mini_batch_size=32 --train_update_iter=6000 --lr=2e-5 --weight_decay=0.01 --split_time=2015 --num_workers=8 --random_seed=3 --reduced_train_prop=0.3

python main.py --dataset=huffpost --method=erm --lisa --offline --mix_alpha=2.0 --mini_batch_size=32 --train_update_iter=6000 --lr=2e-5 --weight_decay=0.01 --split_time=2015 --num_workers=8 --random_seed=1 --reduced_train_prop=0.3
python main.py --dataset=huffpost --method=erm --lisa --offline --mix_alpha=2.0 --mini_batch_size=32 --train_update_iter=6000 --lr=2e-5 --weight_decay=0.01 --split_time=2015 --num_workers=8 --random_seed=2 --reduced_train_prop=0.3
python main.py --dataset=huffpost --method=erm --lisa --offline --mix_alpha=2.0 --mini_batch_size=32 --train_update_iter=6000 --lr=2e-5 --weight_decay=0.01 --split_time=2015 --num_workers=8 --random_seed=3 --reduced_train_prop=0.3

python main.py --dataset=huffpost --method=erm --mixup --offline --mix_alpha=2.0 --mini_batch_size=32 --train_update_iter=6000 --lr=2e-5 --weight_decay=0.01 --split_time=2015 --num_workers=8 --random_seed=1 --reduced_train_prop=0.3
python main.py --dataset=huffpost --method=erm --mixup --offline --mix_alpha=2.0 --mini_batch_size=32 --train_update_iter=6000 --lr=2e-5 --weight_decay=0.01 --split_time=2015 --num_workers=8 --random_seed=2 --reduced_train_prop=0.3
python main.py --dataset=huffpost --method=erm --mixup --offline --mix_alpha=2.0 --mini_batch_size=32 --train_update_iter=6000 --lr=2e-5 --weight_decay=0.01 --split_time=2015 --num_workers=8 --random_seed=3 --reduced_train_prop=0.3

python main.py --dataset=huffpost --method=agem --buffer_size=1000 --mini_batch_size=16 --train_update_iter=1000 --lr=2e-5 --weight_decay=0.01 --offline --split_time=2015 --random_seed=1 --reduced_train_prop=0.3
python main.py --dataset=huffpost --method=agem --buffer_size=1000 --mini_batch_size=16 --train_update_iter=1000 --lr=2e-5 --weight_decay=0.01 --offline --split_time=2015 --random_seed=2 --reduced_train_prop=0.3
python main.py --dataset=huffpost --method=agem --buffer_size=1000 --mini_batch_size=16 --train_update_iter=1000 --lr=2e-5 --weight_decay=0.01 --offline --split_time=2015 --random_seed=3 --reduced_train_prop=0.3

python main.py --dataset=huffpost --method=ewc --ewc_lambda=0.5 --online --mini_batch_size=16 --train_update_iter=1000 --lr=2e-5 --weight_decay=0.01 --offline --split_time=2015 --random_seed=1 --reduced_train_prop=0.3
python main.py --dataset=huffpost --method=ewc --ewc_lambda=0.5 --online --mini_batch_size=16 --train_update_iter=1000 --lr=2e-5 --weight_decay=0.01 --offline --split_time=2015 --random_seed=2 --reduced_train_prop=0.3
python main.py --dataset=huffpost --method=ewc --ewc_lambda=0.5 --online --mini_batch_size=16 --train_update_iter=1000 --lr=2e-5 --weight_decay=0.01 --offline --split_time=2015 --random_seed=3 --reduced_train_prop=0.3

python main.py --dataset=huffpost --method=ft --mini_batch_size=16 --train_update_iter=1000 --lr=2e-5 --weight_decay=0.01 --offline --split_time=2015 --random_seed=1 --reduced_train_prop=0.3
python main.py --dataset=huffpost --method=ft --mini_batch_size=16 --train_update_iter=1000 --lr=2e-5 --weight_decay=0.01 --offline --split_time=2015 --random_seed=2 --reduced_train_prop=0.3
python main.py --dataset=huffpost --method=ft --mini_batch_size=16 --train_update_iter=1000 --lr=2e-5 --weight_decay=0.01 --offline --split_time=2015 --random_seed=3 --reduced_train_prop=0.3

python main.py --dataset=huffpost --method=si --si_c=0.1 --epsilon=1e-4 --mini_batch_size=16 --train_update_iter=1000 --lr=2e-5 --weight_decay=0.01 --offline --split_time=2015 --random_seed=1 --reduced_train_prop=0.3
python main.py --dataset=huffpost --method=si --si_c=0.1 --epsilon=1e-4 --mini_batch_size=16 --train_update_iter=1000 --lr=2e-5 --weight_decay=0.01 --offline --split_time=2015 --random_seed=2 --reduced_train_prop=0.3
python main.py --dataset=huffpost --method=si --si_c=0.1 --epsilon=1e-4 --mini_batch_size=16 --train_update_iter=1000 --lr=2e-5 --weight_decay=0.01 --offline --split_time=2015 --random_seed=3 --reduced_train_prop=0.3