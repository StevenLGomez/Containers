
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

# TeamCity Agent complete ================================================




