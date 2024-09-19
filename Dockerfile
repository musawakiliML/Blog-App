# Pull base image
FROM python:3.7


# Set Environment Variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set Working Directory
WORKDIR /code

# Install Dependencies
COPY Pipfile Pipfile.lock /code/
RUN pip install --upgrade pip && pip install pipenv
RUN pipenv install --deploy --ignore-pipfile

# Check installed packages (for debugging)
RUN pip list


# Copy Project
COPY . /code/