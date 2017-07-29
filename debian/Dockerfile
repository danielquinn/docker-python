FROM python:3

# Upgrade pip
RUN pip install --upgrade pip

# Install and setup iPython
RUN pip install ipython && \
  ipython profile create && \
  sed -i -e 's/#c.TerminalInteractiveShell.confirm_exit = True/c.TerminalInteractiveShell.confirm_exit = False/' /root/.ipython/profile_default/ipython_config.py

# Home directory stuff
RUN \
  cd /root && \
  wget \
    https://raw.githubusercontent.com/danielquinn/docker-django/master/common/.bash_aliases \
    https://raw.githubusercontent.com/danielquinn/docker-django/master/common/.bash_prompt \
    https://raw.githubusercontent.com/danielquinn/docker-django/master/common/.bashrc && \
  mkdir -p .config/pip && \
  cd .config/pip && \
  wget https://raw.githubusercontent.com/danielquinn/docker-django/master/common/.config/pip/pip.conf

# Add a user to our container, using the uid/gid of the host user
RUN \
  useradd --uid 1000 --create-home --shell /bin/bash app && \
  cp -r /root/.bash_prompt /root/.bash_aliases /root/.bashrc /root/.config /home/app && \
  cp -r /root/.ipython /home/app/.ipython && \
  chown -R app:app /home/app/

# Add basic dependencies
RUN apt-get update && \
  apt-get install -y net-tools && \
  apt-get clean
