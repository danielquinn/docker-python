FROM python:3-alpine

# Upgrade pip
RUN pip install --upgrade pip

# Install and setup iPython
RUN pip install ipython && \
  ipython profile create && \
  sed -i -e 's/#c.TerminalInteractiveShell.confirm_exit = True/c.TerminalInteractiveShell.confirm_exit = False/' /root/.ipython/profile_default/ipython_config.py

# I like a pretty shell
COPY .bash* /root/

# Add a user to our container, using the uid/gid of the host user
RUN \
  addgroup -S app -g 1000 && \
  adduser -S app -u 1000 -G app && \
  cp /root/.bash_prompt /root/.bash_aliases /root/.bashrc /home/app && \
  cp -r /root/.ipython /home/app/.ipython && \
  chown app:app /home/app/.ipython /home/app/.bash*

# Add basic dependencies for Django w/ Postgres + Bash
RUN apk add --no-cache --update \
  postgresql-dev postgresql-client bash && \
  rm /var/cache/apk/*
