# "buildx" and "--platform" flag used to fix errors caused by build img on M1 machine
# Ref: https://stackoverflow.com/a/70090803/13743674
docker buildx build --build-arg PORT=5858 --platform linux/amd64 -t krispykalsi/kiido-api:1.0 .