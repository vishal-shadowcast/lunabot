FROM python:3.7-slim

RUN python -m pip install rasa

WORKDIR /app
COPY . .

RUN rasa train

#set the user to run, don't run as root
USER 1001

EXPOSE 8080

#set the entrypoint for interactive shells
ENTRYPOINT ["rasa", "run", "--enable-api, "--port", "8080"]

