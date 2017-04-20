FROM python:3

# Upgrade pip
RUN pip install --upgrade pip

# Install and setup iPython
RUN pip install ipython && \
  ipython profile create && \
  sed -i -e 's/#c.TerminalInteractiveShell.confirm_exit = True/c.TerminalInteractiveShell.confirm_exit = False/' /root/.ipython/profile_default/ipython_config.py

# Add basic dependencies
RUN apt-get update && \
  apt-get install -y postgresql-client net-tools && \
  apt-get clean

# I like a pretty shell
COPY .bash* /root/

# Add a user to our container, using the uid/gid of the host user
RUN \
  useradd --uid 1000 --create-home --shell /bin/bash app && \
  cp /root/.bash_prompt /root/.bash_aliases /root/.bashrc /home/app && \
  cp -r /root/.ipython /home/app/.ipython && \
  chown app:app /home/app/.ipython /home/app/.bash*
