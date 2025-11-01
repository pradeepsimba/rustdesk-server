# rustdesk-server

    services:
        hbbs:
        image: rustdesk/rustdesk-server:latest
        container_name: hbbs
        restart: unless-stopped
        environment:
            - RUST_LOG=info
            # Default ports, no need to override HBBS_PORT/HBBR_PORT
        command: hbbs
        ports:
            - "21115:21115"         # TCP ID/Signaling
            - "21116:21116/udp"     # UDP NAT traversal
            - "21117:21117"         # TCP relay coordination
        volumes:
            - ./data:/root/.config/rustdesk
    
        hbbr:
        image: rustdesk/rustdesk-server:latest
        container_name: hbbr
        restart: unless-stopped
        environment:
            - RUST_LOG=info
            # Default HBBR_PORT=21118 automatically
        command: hbbr
        ports:
            - "21118:21118"         # TCP relay
            - "21118:21118/udp"     # UDP relay
        volumes:
            - ./data:/root/.config/rustdesk