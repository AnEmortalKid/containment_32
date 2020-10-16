FROM doged

COPY /app /app
WORKDIR /app
RUN npm install path express require-doge fs

# Convert DJS to JS since the interpreter doesn't halt atm
# so sad see https://github.com/dogescript/dogescript/issues/271
RUN dogescript app.djs > app.js
ENTRYPOINT [ "node", "app.js" ]