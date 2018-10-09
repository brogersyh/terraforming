#Dockerfile to encapsulate terraforming
#
#howto build docker image (from working-directory having terraforming source)
#  docker build -t terraforming .
#
#howto run docker container (from target working-directory for *.tf files)
#required args shown below, optional args follow
#  docker run -it --rm -v $(pwd):/wrk terraforming <aws-service-type>
#  docker run -it --rm -v $(pwd):/wrk terraforming all

FROM ruby:2.4.2-alpine3.6

#Env vars for terraforming
ENV AWS_REGION=us-east-1

#**TODO TEMPORARY ENV VARS**
ENV AWS_DEFAULT_REGION=us-east-1

#Default to key for terraforming-readonly IAM account

#**TODO REMOVE THIS READONLY-ACCOUNT CRED BEFORE CHECKIN (MAKE DEFAULTS BLANK)**
ENV AWS_ACCESS_KEY_ID=AKIAJKQOJ2VQCVBBCHHQ
ENV AWS_SECRET_ACCESS_KEY=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

#install python, aws py boto3 sdk
RUN apk update --no-cache \
    && apk add --no-cache python3 \
    && python3 -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip3 install --upgrade pip setuptools boto3 \
    && if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi \
    && if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi \
    && rm -r /root/.cache


#build gem from source
WORKDIR /app
COPY . .

RUN gem install terraforming

#set up entrypoint script
RUN chmod +x ./docker-entrypoint.sh

#set up runtime workdir for tf files
WORKDIR /wrk

ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD [""]
