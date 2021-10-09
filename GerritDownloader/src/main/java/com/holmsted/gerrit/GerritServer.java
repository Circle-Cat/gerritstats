package com.holmsted.gerrit;

import javax.annotation.Nonnull;

/**
 * Represents a Gerrit server.
 */
public class GerritServer {

    private static final int GERRIT_DEFAULT_PORT = 29418;
    private final int port;

    @Nonnull
    private final String serverName;
    private final String identityFile;
    private final String loginName;

    public GerritServer(@Nonnull String serverName, int port,
                        @Nonnull String identityFile, String loginName) {
        this.serverName = serverName;
        this.port = port != 0 ? port : GERRIT_DEFAULT_PORT;
        this.identityFile = identityFile;
        this.loginName = loginName;
    }

    public String getServerName() {
        return serverName;
    }

    public int getPort() {
        return port;
    }

    public String getIdentityFile() {
        return identityFile;
    }

    public String getLoginName() {
        return loginName;
    }

    @Override
    public String toString() {
        return String.format("%s:%d", serverName, port);
    }
}
