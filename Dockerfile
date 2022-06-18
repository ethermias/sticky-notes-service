FROM ethermias/stack:0.0.5

MAINTAINER jermi

WORKDIR /code

EXPOSE 8888

COPY . .

RUN stack build

CMD ["stack", "exec", "sticky-notes-service-exe"]