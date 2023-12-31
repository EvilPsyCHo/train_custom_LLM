CUDA_VISIBLE_DEVICES=0,1 torchrun --nproc_per_node 2 train.py \
    --model_name baichuan \
    --model_path ./pretrained/baichuan-7b \
    --data_name belle_open_source_500k \
    --data_path ./data/Belle_open_source_0.5M.json \
    --train_size 20000 \
    --output_dir ./output/baichuan_lorasft \
    --seed 42 \
    --max_len 1024  \
    --lora_rank 8 \
    --num_train_epochs 1 \
    --learning_rate 3e-4 \
    --per_device_train_batch_size 4 \
    --per_device_eval_batch_size 8 \
    --gradient_accumulation_steps 1 \
    --logging_steps 10 \
    --evaluation_strategy steps \
    --save_strategy steps \
    --eval_steps 100 \
    --save_steps 100 \
    --report_to tensorboard \
    --save_total_limit 3 \
    --load_best_model_at_end true \
    --optim adamw_torch \
    --ddp_find_unused_parameters false
