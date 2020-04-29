Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8675C1BE745
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 21:23:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7959C3C5EF0
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 21:23:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 3C9233C280C
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 21:23:47 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7A1ED1000527
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 21:23:46 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1DBB0ADAA;
 Wed, 29 Apr 2020 19:23:45 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 29 Apr 2020 21:23:38 +0200
Message-Id: <20200429192340.14252-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200429192340.14252-1-pvorel@suse.cz>
References: <20200429192340.14252-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v6 1/3] net: Add SAFE_GETADDRINFO()
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

based on setup_addrinfo() from netstress.c.

Added only to new C API, thus code kept in tst_net.c, instead of safe_net.c,
which is also for legacy API.

Reviewed-by: Alexey Kodanev <alexey.kodanev@oracle.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 include/tst_net.h                       |  9 +++++++--
 include/tst_private.h                   |  1 +
 include/tst_safe_net.h                  |  6 ++++++
 lib/tst_net.c                           | 15 +++++++++++++++
 testcases/network/netstress/netstress.c | 20 ++++----------------
 5 files changed, 33 insertions(+), 18 deletions(-)

diff --git a/include/tst_net.h b/include/tst_net.h
index 855f4fc13..daefdd9d9 100644
--- a/include/tst_net.h
+++ b/include/tst_net.h
@@ -7,9 +7,10 @@
 #define TST_NET_H_
 
 #include <arpa/inet.h>
-#include <sys/types.h>
+#include <netdb.h>
 #include <netinet/in.h>
 #include <netinet/ip.h>
+#include <sys/types.h>
 
 void tst_get_in_addr(const char *ip_str, struct in_addr *ip);
 void tst_get_in6_addr(const char *ip_str, struct in6_addr *ip6);
@@ -27,4 +28,8 @@ void tst_init_sockaddr_inet_bin(struct sockaddr_in *sa, uint32_t ip_val, uint16_
 void tst_init_sockaddr_inet6(struct sockaddr_in6 *sa, const char *ip_str, uint16_t port);
 void tst_init_sockaddr_inet6_bin(struct sockaddr_in6 *sa, const struct in6_addr *ip_val, uint16_t port);
 
-#endif
+void safe_getaddrinfo(const char *file, const int lineno, const char *src_addr,
+					  const char *port, const struct addrinfo *hints,
+					  struct addrinfo **addr_info);
+
+#endif /* TST_NET_H_ */
diff --git a/include/tst_private.h b/include/tst_private.h
index 00cd17fce..e30d34740 100644
--- a/include/tst_private.h
+++ b/include/tst_private.h
@@ -10,6 +10,7 @@
 #define TST_PRIVATE_H_
 
 #include <stdio.h>
+#include <netdb.h>
 
 #define MAX_IPV4_PREFIX 32
 #define MAX_IPV6_PREFIX 128
diff --git a/include/tst_safe_net.h b/include/tst_safe_net.h
index f31c8fe2f..78a488a18 100644
--- a/include/tst_safe_net.h
+++ b/include/tst_safe_net.h
@@ -12,6 +12,7 @@
 #include <sys/un.h>
 
 #include "safe_net_fn.h"
+#include "tst_net.h"
 
 #define SAFE_SOCKET(domain, type, protocol) \
 	safe_socket(__FILE__, __LINE__, NULL, domain, type, protocol)
@@ -70,4 +71,9 @@
 #define TST_GET_UNUSED_PORT(family, type) \
 	tst_get_unused_port(__FILE__, __LINE__, NULL, family, type)
 
+/* new API only */
+
+#define SAFE_GETADDRINFO(src_addr, port, hints, addr_info) \
+	safe_getaddrinfo(__FILE__, __LINE__, src_addr, port, hints, addr_info)
+
 #endif /* TST_SAFE_NET_H__ */
diff --git a/lib/tst_net.c b/lib/tst_net.c
index 22c990e62..8a589b0ad 100644
--- a/lib/tst_net.c
+++ b/lib/tst_net.c
@@ -5,6 +5,7 @@
  */
 
 #include <errno.h>
+#include <netdb.h>
 #include <string.h>
 #include <stdlib.h>
 
@@ -204,3 +205,17 @@ void tst_init_sockaddr_inet6_bin(struct sockaddr_in6 *sa, const struct in6_addr
 	sa->sin6_port = htons(port);
 	memcpy(&sa->sin6_addr, ip_val, sizeof(struct in6_addr));
 }
+
+void safe_getaddrinfo(const char *file, const int lineno, const char *src_addr,
+					  const char *port, const struct addrinfo *hints,
+					  struct addrinfo **addr_info)
+{
+	int err = getaddrinfo(src_addr, port, hints, addr_info);
+
+	if (err)
+		tst_brk(TBROK, "%s:%d: getaddrinfo failed, %s", file, lineno,
+				gai_strerror(err));
+
+	if (!*addr_info)
+		tst_brk(TBROK, "%s:%d: failed to get the address", file, lineno);
+}
diff --git a/testcases/network/netstress/netstress.c b/testcases/network/netstress/netstress.c
index 6797be018..c5da4d464 100644
--- a/testcases/network/netstress/netstress.c
+++ b/testcases/network/netstress/netstress.c
@@ -29,6 +29,7 @@
 #include "tst_safe_stdio.h"
 #include "tst_safe_pthread.h"
 #include "tst_test.h"
+#include "tst_safe_net.h"
 
 static const int max_msg_len = (1 << 16) - 1;
 static const int min_msg_len = 5;
@@ -441,19 +442,6 @@ static int parse_client_request(const char *msg)
 static struct timespec tv_client_start;
 static struct timespec tv_client_end;
 
-static void setup_addrinfo(const char *src_addr, const char *port,
-			   const struct addrinfo *hints,
-			   struct addrinfo **addr_info)
-{
-	int err = getaddrinfo(src_addr, port, hints, addr_info);
-
-	if (err)
-		tst_brk(TBROK, "getaddrinfo failed, %s", gai_strerror(err));
-
-	if (!*addr_info)
-		tst_brk(TBROK, "failed to get the address");
-}
-
 static void client_init(void)
 {
 	if (clients_num >= MAX_THREADS) {
@@ -471,8 +459,8 @@ static void client_init(void)
 	hints.ai_protocol = 0;
 
 	if (source_addr)
-		setup_addrinfo(source_addr, NULL, &hints, &local_addrinfo);
-	setup_addrinfo(server_addr, tcp_port, &hints, &remote_addrinfo);
+		SAFE_GETADDRINFO(source_addr, NULL, &hints, &local_addrinfo);
+	SAFE_GETADDRINFO(server_addr, tcp_port, &hints, &remote_addrinfo);
 
 	tst_res(TINFO, "Running the test over IPv%s",
 		(remote_addrinfo->ai_family == AF_INET6) ? "6" : "4");
@@ -667,7 +655,7 @@ static void server_init(void)
 
 	if (source_addr && !strchr(source_addr, ':'))
 		SAFE_ASPRINTF(&src_addr, "::ffff:%s", source_addr);
-	setup_addrinfo(src_addr ? src_addr : source_addr, tcp_port,
+	SAFE_GETADDRINFO(src_addr ? src_addr : source_addr, tcp_port,
 		       &hints, &local_addrinfo);
 	free(src_addr);
 
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
