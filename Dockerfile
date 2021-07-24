# inherit prebuilt image
FROM prajwals3/projectfizilion:latest

# env setup
RUN mkdir /Draganus && chmod 777 /Draganus
ENV PATH="/Draganus/bin:$PATH"
WORKDIR /Draganus

# clone repo
RUN git clone https://github.com/DGJM/DraganusBot -b demon /Draganus
#RUN git clone https://github.com/Senpai-sama-afk/ProjectFizilion -b dragon /Draganus

# Copies session and config(if it exists)
COPY ./sample_config.env ./userbot.session* ./config.env* /Draganus/

# install required pypi modules
RUN pip3 install -r requirements.txt

# Finalization
CMD ["python3","-m","userbot"]
