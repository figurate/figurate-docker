ARG PYTHON_VERSION=3.8
FROM public.ecr.aws/lambda/python:${PYTHON_VERSION}

COPY requirements.txt /tmp

RUN pip3 --no-cache-dir install -r /tmp/requirements.txt

COPY ec2.py ${LAMBDA_TASK_ROOT}
