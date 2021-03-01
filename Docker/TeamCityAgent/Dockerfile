
FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y openjdk-11-jre-headless unzip

# ========================================================================
# Set up the TeamCity Agent

# TODO - Add commands to open port 9090/tcp for agent communication

RUN useradd agent

RUN mkdir /opt/BuildAgent
RUN chown agent:root /opt/BuildAgent

# The following should work when network connectivity is figured out.
#RUN wget http://usstlbas02:8111/update/buildAgent.zip

# But until then....
COPY ./buildAgent.zip /opt

RUN unzip /opt/buildAgent.zip -d /opt/BuildAgent
RUN rm /opt/buildAgent.zip
RUN mv /opt/BuildAgent/conf/buildAgent.dist.properties /opt/BuildAgent/conf/buildAgent.properties

# Apply network information for TeamCity server
# For production server use:
# RUN sed -i 's/serverUrl=http\:\/\/localhost\:8111/serverUrl=http\:\/\/usstlbas02\:8111/g' conf/buildAgent.properties

# For experimental (development) server use:
RUN sed -i 's/serverUrl=http\:\/\/localhost\:8111/serverUrl=http\:\/\/10.17.20.9\:8111/g' conf/buildAgent.properties

# Set the Agent Name to be the same as the hostname 
# NOTE that double quotes are required to allow expansion of ${HOST_NAME}
RUN sed -i "s/name=/name=${HOST_NAME}/g" conf/buildAgent.properties

RUN chown -R agent:agent /opt/BuildAgent/*

# Make the agent executable, then start it (NOTE must run as buildagent, NOT root)
RUN chmod +x /opt/BuildAgent/bin/agent.sh
# RUN runuser agent -c '/opt/BuildAgent/bin/agent.sh start'

# TeamCity Agent complete ================================================




