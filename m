Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A78618832D
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 13:11:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A38AB3C55D9
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 13:11:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 463D93C55C2
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 13:10:59 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 598F51A013A2
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 13:10:59 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B7EEDB080
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 12:10:58 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 17 Mar 2020 13:10:56 +0100
Message-Id: <20200317121057.13529-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200317121057.13529-1-mdoucha@suse.cz>
References: <20200317121057.13529-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v4 2/3] Add socket address initialization functions to
 tst_net library
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1:
- new patch

Changes since v2:
- Added tst_ prefix to the new functions

Changes since v3:
- Added #define protection against multiple #includes to tst_net.h

 include/tst_net.h | 21 ++++++++++++++
 lib/tst_net.c     | 71 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/include/tst_net.h b/include/tst_net.h
index 034faecce..9611b2047 100644
--- a/include/tst_net.h
+++ b/include/tst_net.h
@@ -3,8 +3,29 @@
  * Copyright (c) 2017-2019 Petr Vorel <pvorel@suse.cz>
  */
 
+#ifndef TST_NET_H_
+#define TST_NET_H_
+
 #include <arpa/inet.h>
 #include <stdio.h>
+#include <sys/types.h>
+#include <netinet/in.h>
+#include <netinet/ip.h>
 
 void tst_get_in_addr(const char *ip_str, struct in_addr *ip);
 void tst_get_in6_addr(const char *ip_str, struct in6_addr *ip6);
+
+/*
+ * Find valid connection address for a given bound socket
+ */
+socklen_t tst_get_connect_address(int sock, struct sockaddr_storage *addr);
+
+/*
+ * Initialize AF_INET/AF_INET6 socket address structure with address and port
+ */
+void tst_init_sockaddr_inet(struct sockaddr_in *sa, const char *ip_str, uint16_t port);
+void tst_init_sockaddr_inet_bin(struct sockaddr_in *sa, uint32_t ip_val, uint16_t port);
+void tst_init_sockaddr_inet6(struct sockaddr_in6 *sa, const char *ip_str, uint16_t port);
+void tst_init_sockaddr_inet6_bin(struct sockaddr_in6 *sa, const struct in6_addr *ip_val, uint16_t port);
+
+#endif
diff --git a/lib/tst_net.c b/lib/tst_net.c
index b27ad3a5b..34d639068 100644
--- a/lib/tst_net.c
+++ b/lib/tst_net.c
@@ -1,5 +1,6 @@
 /*
  * Copyright (c) 2017 Petr Vorel <pvorel@suse.cz>
+ * Copyright (c) 2019 Martin Doucha <mdoucha@suse.cz>
  *
  * This program is free software: you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -145,3 +146,73 @@ void tst_get_in6_addr(const char *ip_str, struct in6_addr *ip6)
 	if (inet_pton(AF_INET6, ip_str, ip6) <= 0)
 		tst_brk_comment("bad IPv6 address: '%s'", ip_str);
 }
+
+socklen_t tst_get_connect_address(int sock, struct sockaddr_storage *addr)
+{
+	struct sockaddr_in *inet_ptr;
+	struct sockaddr_in6 *inet6_ptr;
+	size_t tmp_size;
+	socklen_t ret = sizeof(*addr);
+
+	SAFE_GETSOCKNAME(sock, (struct sockaddr*)addr, &ret);
+
+	/* Sanitize wildcard addresses */
+	switch (addr->ss_family) {
+	case AF_INET:
+		inet_ptr = (struct sockaddr_in*)addr;
+
+		switch (ntohl(inet_ptr->sin_addr.s_addr)) {
+		case INADDR_ANY:
+		case INADDR_BROADCAST:
+			inet_ptr->sin_addr.s_addr = htonl(INADDR_LOOPBACK);
+			break;
+		}
+
+		break;
+
+	case AF_INET6:
+		inet6_ptr = (struct sockaddr_in6*)addr;
+		tmp_size = sizeof(struct in6_addr);
+
+		if (!memcmp(&inet6_ptr->sin6_addr, &in6addr_any, tmp_size)) {
+			memcpy(&inet6_ptr->sin6_addr, &in6addr_loopback,
+				tmp_size);
+		}
+
+		break;
+	}
+
+	return ret;
+}
+
+void tst_init_sockaddr_inet(struct sockaddr_in *sa, const char *ip_str, uint16_t port)
+{
+	memset(sa, 0, sizeof(struct sockaddr_in));
+	sa->sin_family = AF_INET;
+	sa->sin_port = htons(port);
+	tst_get_in_addr(ip_str, &sa->sin_addr);
+}
+
+void tst_init_sockaddr_inet_bin(struct sockaddr_in *sa, uint32_t ip_val, uint16_t port)
+{
+	memset(sa, 0, sizeof(struct sockaddr_in));
+	sa->sin_family = AF_INET;
+	sa->sin_port = htons(port);
+	sa->sin_addr.s_addr = htonl(ip_val);
+}
+
+void tst_init_sockaddr_inet6(struct sockaddr_in6 *sa, const char *ip_str, uint16_t port)
+{
+	memset(sa, 0, sizeof(struct sockaddr_in6));
+	sa->sin6_family = AF_INET6;
+	sa->sin6_port = htons(port);
+	tst_get_in6_addr(ip_str, &sa->sin6_addr);
+}
+
+void tst_init_sockaddr_inet6_bin(struct sockaddr_in6 *sa, const struct in6_addr *ip_val, uint16_t port)
+{
+	memset(sa, 0, sizeof(struct sockaddr_in6));
+	sa->sin6_family = AF_INET6;
+	sa->sin6_port = htons(port);
+	memcpy(&sa->sin6_addr, ip_val, sizeof(struct in6_addr));
+}
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
