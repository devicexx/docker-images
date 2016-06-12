#!/bin/bash
set -e

if [[ "$*" == npm*start* ]]; then
    baseDir="$GHOST_SOURCE/content"
    for dir in "$baseDir"/*/ "$baseDir"/themes/*/; do
        targetDir="$GHOST_CONTENT/${dir#$baseDir/}"
        mkdir -p "$targetDir"
        if [ -z "$(ls -A "$targetDir")" ]; then
            tar -c --one-file-system -C "$dir" . | tar xC "$targetDir"
        fi
    done

    if [ ! -e "$GHOST_CONTENT/config.js" ]; then
        echo 'Generating config.js ...'
        # Start config
        echo \
'
// # Ghost Configuration
// Setup your Ghost install for various [environments](http://support.ghost.org/config/#about-environments).

// Ghost runs in `development` mode by default. Full documentation can be found at http://support.ghost.org/config/

var path = require("path"),
    config;

config = {
' \
        >> "$GHOST_CONTENT/config.js"

        # Start mode
        if [[ "${NODE_ENV}" == *production* ]]; then
            echo \
'
    // ### Production
    production: {
' \
            >> "$GHOST_CONTENT/config.js"

        elif [[ "${NODE_ENV}" == *development* ]]; then
            echo \
'
    // ### Development
    development: {
' \
            >> "$GHOST_CONTENT/config.js"

        else
            echo \
'
    // ### Development
    development: {
' \
            >> "$GHOST_CONTENT/config.js"

        fi

        # URL
        echo \
'
        url: process.env.GHOST_URL || "http://0.0.0.0:2368",
' \
        >> "$GHOST_CONTENT/config.js"

        # URL SSL
        if [[ "${GHOST_URL_SSL}" != "" ]]; then
            echo \
'
        urlSSL: process.env.GHOST_URL_SSL || "https://0.0.0.0:2368",
' \
            >> "$GHOST_CONTENT/config.js"
        fi

        # Admin SSL
        if [[ "${GHOST_FORCE_ADMIN_SSL}" != "" ]]; then
            echo \
'
        forceAdminSSL: process.env.GHOST_FORCE_ADMIN_SSL || true,
' \
            >> "$GHOST_CONTENT/config.js"
        fi

        # Mail
        if [[ "${GHOST_MAIL_HOST}" != "" ]]; then
            echo \
'
        mail: {
            transport: "SMTP",
            from     : process.env.GHOST_MAIL_FROM || "ghost@yourdomain.com",     // ghost@yourdomain.com
            options: {
                host            : process.env.GHOST_MAIL_HOST || "localhost",     // yourdomain.com
                secureConnection: process.env.GHOST_MAIL_SECURE || false,         // true or false
                port            : process.env.GHOST_MAIL_PORT || 465,             // e.g. 465
                auth: {
                    user        : process.env.GHOST_MAIL_USERNAME || "ghost@yourdomain.com", // e.g. ghost@yourdomain.com
                    pass        : process.env.GHOST_MAIL_PASSWORD || "changeme"   // e.g. ***********
                }
            }
        },
' \
            >> "$GHOST_CONTENT/config.js"
        fi

        # Databases
        if [[ "${GHOST_DATABASE_CLIENT}" == *sqlite* ]]; then
            echo \
'
        database: {
            client: "sqlite3",
            connection: {
                filename: path.join(process.env.GHOST_CONTENT, "/data/", process.env.GHOST_SQLITE_FILENAME || "ghost.db")
            },
            debug: false

        },
' \
            >> "$GHOST_CONTENT/config.js"

        elif [[ "${GHOST_DATABASE_CLIENT}" == *mysql*  ]]; then
            echo \
'
        database: {
            client: "mysql",
            connection: {
                host     : process.env.GHOST_MYSQL_HOST || "localhost",     // yourdomain.com
                user     : process.env.GHOST_MYSQL_USER || "ghost",         // your database user
                password : process.env.GHOST_MYSQL_PASSWORD || "changeme",  // your database password
                database : process.env.GHOST_MYSQL_DATABASE || "ghost",     // your database name
                charset  : "utf8"
            },
            debug: false
        },
' \
            >> "$GHOST_CONTENT/config.js"

        elif [[ "${GHOST_DATABASE_CLIENT}" == *pg*  ]]; then
            echo \
'
        database: {
            client: "pg",
            connection: {
                host     : process.env.GHOST_PG_HOST || "localhost",     // yourdomain.com
                user     : process.env.GHOST_PG_USER || "ghost",         // your database user
                password : process.env.GHOST_PG_PASSWORD || "changeme",  // your database password
                database : process.env.GHOST_PG_DATABASE || "ghost",     // your database name
                charset  : "utf8"
            },
            debug: false
        },
' \
            >> "$GHOST_CONTENT/config.js"

        else
            echo \
'
        database: {
            client: "sqlite3",
            connection: {
                filename: path.join(process.env.GHOST_CONTENT, "/data/", process.env.GHOST_SQLITE_FILENAME || "ghost.db")
            },
            debug: false

        },
' \
            >> "$GHOST_CONTENT/config.js"

        fi

        # Storage
        if [[ "${GHOST_STORAGE_PROVIDER}" == *qiniu*  ]]; then
            echo \
'
        storage: {
            provider: "qiniu",
            bucketname: process.env.GHOST_QN_BUCKET || "your-bucket-name",    // your bucket name
            ACCESS_KEY: process.env.GHOST_QN_ACCESS_KEY || "changeme",        // your access key
            SECRET_KEY: process.env.GHOST_QN_SECRET_KEY || "changeme",        // your secret key
            root: "/image/",
            prefix: process.env.GHOST_QN_URL || "http://your-cdn.qiniudn.com" // your URL
        },

' \
            >> "$GHOST_CONTENT/config.js"

        elif [[ "${GHOST_STORAGE_PROVIDER}" == *upyun*  ]]; then
            echo \
'
        storage: {
            provider: "upyun",
            bucketname: process.env.GHOST_UPYUN_BUCKET || "your-bucket-name",    // your bucket name
            username:   process.env.GHOST_UPYUN_USERNAME || "changeme",          // your username
            password:   process.env.GHOST_UPYUN_PASSWORD || "changeme",          // your password
            root: "/image/",
            prefix: process.env.GHOST_UPYUN_URL || "http://your-bucket-name.b0.upaiyun.com" // your URL
        },

' \
            >> "$GHOST_CONTENT/config.js"

        elif [[ "${GHOST_STORAGE_PROVIDER}" == *oss*  ]]; then
            echo \
'
        storage: {
            provider: "oss",
            bucketname: process.env.GHOST_OSS_BUCKET || "your-bucket-name",  // your bucket name
            ACCESS_KEY: process.env.GHOST_OSS_ACCESS_KEY || "changeme",      // your access key
            SECRET_KEY: process.env.GHOST_OSS_SECRET_KEY || "changeme",      // your secret key
            root: "/image/",
            endpoint: process.env.GHOST_OSS_ENDPOINT || "http://oss-cn-hangzhou.aliyuncs.com",          // upload endpoint
            prefix: process.env.GHOST_OSS_URL || "http://your-bucket-name.oss-cn-hangzhou.aliyuncs.com" // your URL
        },

' \
            >> "$GHOST_CONTENT/config.js"

        fi

        # End mode
        echo \
'
        // #### Privacy
        // Set GoogleFonts, Gravatar, etc. May unuse in China
        privacy: {
            useGoogleFonts: false,
            useGravatar: false,
        }, 
        // #### Server
        // Can be host & port (default), or socket
        server: {
            // Host to be passed to net.Server#listen()
            host: "0.0.0.0",
            // Port to be passed to net.Server#listen() for iisnode set this to process.env.PORT
            port: "2368"
        },
        // #### Paths
        // Specify where your content directory lives
        paths: {
            contentPath: path.join(process.env.GHOST_CONTENT, "/")
        }
    },

    // **Developers only need to edit below here**

    // ### Testing
    // Used when developing Ghost to run tests and check the health of Ghost
    // Uses a different port number
    testing: {
        url: "http://127.0.0.1:2369",
        database: {
            client: "sqlite3",
            connection: {
                filename: path.join(__dirname, "/content/data/ghost-test.db")
            },
            pool: {
                afterCreate: function (conn, done) {
                    conn.run("PRAGMA synchronous=OFF;" +
                    "PRAGMA journal_mode=MEMORY;" +
                    "PRAGMA locking_mode=EXCLUSIVE;" +
                    "BEGIN EXCLUSIVE; COMMIT;", done);
                }
            }
        },
        server: {
            host: "127.0.0.1",
            port: "2369"
        },
        logging: false
    },

    // ### Testing MySQL
    // Used by Travis - Automated testing run through GitHub
    "testing-mysql": {
        url: "http://127.0.0.1:2369",
        database: {
            client: "mysql",
            connection: {
                host     : "127.0.0.1",
                user     : "root",
                password : "",
                database : "ghost_testing",
                charset  : "utf8"
            }
        },
        server: {
            host: "127.0.0.1",
            port: "2369"
        },
        logging: false
    },

    // ### Testing pg
    // Used by Travis - Automated testing run through GitHub
    "testing-pg": {
        url: "http://127.0.0.1:2369",
        database: {
            client: "pg",
            connection: {
                host     : "127.0.0.1",
                user     : "postgres",
                password : "",
                database : "ghost_testing",
                charset  : "utf8"
            }
        },
        server: {
            host: "127.0.0.1",
            port: "2369"
        },
        logging: false
    }
' \
        >> "$GHOST_CONTENT/config.js"

        # End config
        echo \
'
};

module.exports = config;
' \
        >> "$GHOST_CONTENT/config.js"
    fi

    ln -sf "$GHOST_CONTENT/config.js" "$GHOST_SOURCE/config.js"

    chown -R user "$GHOST_CONTENT"

    set -- gosu user "$@"
fi

exec "$@"
