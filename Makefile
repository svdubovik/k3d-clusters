DEV_SERVER_MEM=1g
DEV_AGENT_MEM=1.5g


all: install up

install:
	brew upgrade k3d || brew install k3d

up: up_dev

down: down_dev

up_dev:
	k3d cluster create --config k3d-dev.yaml --servers-memory $(DEV_SERVER_MEM) --agents-memory $(DEV_AGENT_MEM)

down_dev:
	k3d cluster delete dev
