FROM ethermias/stack:0.0.4

MAINTAINER jermi

WORKDIR /code

EXPOSE 8388

COPY . .

CMD ["stack", "run"]