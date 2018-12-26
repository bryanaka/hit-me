ROOT_APP_PATH='..'
SERVER_APP_PATH='server'
CLIENT_APP_PATH='client'


ensure_server_prereq:
	./tasks/server/envcheck.sh

ensure_client_prereq:
	./tasks/client/envcheck.sh

setup_server_prereq:
	./tasks/server/envsetup.sh

setup_client_prereq:
	./tasks/client/envsetup.sh

install_server:
	cd ${SERVER_APP_PATH} && mix deps.get && mix deps.compile && cd ${ROOT_APP_PATH}

install_client:
	cd ${CLIENT_APP_PATH} && yarn install && cd ${ROOT_APP_PATH}

run_server:
	cd ${SERVER_APP_PATH} && mix phx.server & cd ${ROOT_APP_PATH}

run_client:
	cd ${CLIENT_APP_PATH} && ember serve & cd ${ROOT_APP_PATH}

setup_db:
	cd ${SERVER_APP_PATH} && mix ecto.create && mix ecto.migrate

envcheck: ensure_server_prereq ensure_client_prereq

envsetup: setup_server_prereq setup_client_prereq

install: install_server install_client setup_db

setup: envsetup install

serve: run_server run_client
	wait