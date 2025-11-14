# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.0-base

# install custom nodes into comfyui
# (no custom nodes to install)
# install registry nodes (unchanged)
RUN comfy node install --exit-on-fail comfyui-videohelpersuite@1.7.7
RUN comfy node install --exit-on-fail comfyui-kjnodes@1.1.9
RUN comfy node install --exit-on-fail comfyui-frame-interpolation@1.0.7
RUN comfy node install --exit-on-fail ComfyUI-Easy-Utils@latest
RUN comfy node install --exit-on-fail comfyanonymous/ComfyUI-ToolingNodes@latest

# download models into comfyui
# (no models to download)
RUN comfy model download \
    --url https://github.com/xinntao/Real-ESRGAN/releases/download/v0.1.0/RealESRGAN_x4plus.pth \
    --relative-path models/upscale_models \
    --filename RealESRGAN_x4plus.pth

RUN comfy model download \
    --url https://huggingface.co/ai-forever/Real-ESRGAN/resolve/main/RealESRGAN_x2.pth \
    --relative-path models/upscale_models \
    --filename RealESRGAN_x2.pth

RUN comfy model download \
    --url https://github.com/JingyunLiang/SwinIR/releases/download/v0.0/001_classicalSR_DF2K_s64w8_SwinIR-M_x2.pth \
    --relative-path models/upscale_models \
    --filename 001_classicalSR_DF2K_s64w8_SwinIR-M_x2.pth

RUN comfy model download \
    --url https://github.com/JingyunLiang/SwinIR/releases/download/v0.0/001_classicalSR_DF2K_s64w8_SwinIR-M_x4.pth \
    --relative-path models/upscale_models \
    --filename 001_classicalSR_DF2K_s64w8_SwinIR-M_x4.pth

RUN comfy model download \
    --url https://huggingface.co/lokCX/4x-Ultrasharp/resolve/main/4x-UltraSharp.pth \
    --relative-path models/upscale_models \
    --filename 4x-UltraSharp.pth

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
