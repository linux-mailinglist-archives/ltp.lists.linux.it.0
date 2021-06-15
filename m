Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDC73A7829
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 09:41:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D3D993C71D7
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 09:41:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AC86A3C2E09
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 09:41:17 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1B98B600967
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 09:41:16 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 4EDC11FD2A;
 Tue, 15 Jun 2021 07:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1623742876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gm+nCtFvnOjPcBhphVlCg3gYw7rJP5C0BQyqRjvp3sA=;
 b=M0g+veYd7FbiwTZuPokAEuXyZ1f9zPNK+OAH9VimjilCmTqzSPVRg1y9wDlFAfbu2t9pY7
 fQdhYfjSm+lfeYbZ8b+qA4mvJcQW0SC0vDAxbvlD9fNgRMkfmdQgCqkCmXW06W9+Xp52BQ
 h6UR0UW6dBMJ4dUx8rqW/9ZWqzyDUuY=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 177DCA3B84;
 Tue, 15 Jun 2021 07:41:16 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 15 Jun 2021 08:40:45 +0100
Message-Id: <20210615074045.23974-3-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615074045.23974-1-rpalethorpe@suse.com>
References: <20210615074045.23974-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v4 3/3] API: Remove TST_ERR usage from
 rtnetlink/netdevice
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The test author is guaranteed that the library will not set TST_ERR
except via the TEST macro and similar.

Currently the rtnetlink & netdevice API returns 0 on fail and 1 on
success. Either TST_ERR or errno is used to store the error
number. The commit stays with this scheme except that we only use
errno. This means that we have to temporarily save errno when it would
be overwritten by a less important operation.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---

Possibly the API should be redesigned so that we are not juggling
errno. We could return the errno instead of just a boolean. However I
then think this should be done for all network functions for
consistency. Even if that is done, I still don't like it.

In most cases though, the issue is caused by tst_brk_ not
returning. Instead we could print the error immediately, but defer
cleanup. E.g. have tst_brk_defer_ which prints the error and sets a
flag, then call tst_sync_ which exits if the brk flag is set.

In any case these are quite big changes. So I have just submitted this
errno patch.

 lib/tst_netdevice.c | 30 ++++++++++++++++++++----------
 lib/tst_rtnetlink.c |  9 +++++----
 2 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/lib/tst_netdevice.c b/lib/tst_netdevice.c
index d098173d5..214a6f500 100644
--- a/lib/tst_netdevice.c
+++ b/lib/tst_netdevice.c
@@ -101,7 +101,7 @@ int tst_netdev_set_state(const char *file, const int lineno,
 int tst_create_veth_pair(const char *file, const int lineno,
 	const char *ifname1, const char *ifname2)
 {
-	int ret;
+	int ret, save_errno;
 	struct ifinfomsg info = { .ifi_family = AF_UNSPEC };
 	struct tst_rtnl_context *ctx;
 	struct tst_rtnl_attr_list peerinfo[] = {
@@ -146,10 +146,12 @@ int tst_create_veth_pair(const char *file, const int lineno,
 	}
 
 	ret = tst_rtnl_send_validate(file, lineno, ctx);
+	save_errno = errno;
 	tst_rtnl_destroy_context(file, lineno, ctx);
 
 	if (!ret) {
-		tst_brk_(file, lineno, TBROK | TTERRNO,
+		errno = save_errno;
+		tst_brk_(file, lineno, TBROK | TERRNO,
 			"Failed to create veth interfaces %s+%s", ifname1,
 			ifname2);
 	}
@@ -161,7 +163,7 @@ int tst_remove_netdev(const char *file, const int lineno, const char *ifname)
 {
 	struct ifinfomsg info = { .ifi_family = AF_UNSPEC };
 	struct tst_rtnl_context *ctx;
-	int ret;
+	int ret, save_errno;
 
 	if (strlen(ifname) >= IFNAMSIZ) {
 		tst_brk_(file, lineno, TBROK,
@@ -180,10 +182,12 @@ int tst_remove_netdev(const char *file, const int lineno, const char *ifname)
 	}
 
 	ret = tst_rtnl_send_validate(file, lineno, ctx);
+	save_errno = errno;
 	tst_rtnl_destroy_context(file, lineno, ctx);
 
 	if (!ret) {
-		tst_brk_(file, lineno, TBROK | TTERRNO,
+		errno = save_errno;
+		tst_brk_(file, lineno, TBROK | TERRNO,
 			"Failed to remove netdevice %s", ifname);
 	}
 
@@ -196,7 +200,7 @@ static int modify_address(const char *file, const int lineno,
 	size_t addrlen, uint32_t addr_flags)
 {
 	struct tst_rtnl_context *ctx;
-	int index, ret;
+	int index, ret, save_errno;
 	struct ifaddrmsg info = {
 		.ifa_family = family,
 		.ifa_prefixlen = prefix
@@ -229,10 +233,12 @@ static int modify_address(const char *file, const int lineno,
 	}
 
 	ret = tst_rtnl_send_validate(file, lineno, ctx);
+	save_errno = errno;
 	tst_rtnl_destroy_context(file, lineno, ctx);
 
 	if (!ret) {
-		tst_brk_(file, lineno, TBROK | TTERRNO,
+		errno = save_errno;
+		tst_brk_(file, lineno, TBROK | TERRNO,
 			"Failed to modify %s network address", ifname);
 	}
 
@@ -276,7 +282,7 @@ static int change_ns(const char *file, const int lineno, const char *ifname,
 {
 	struct ifinfomsg info = { .ifi_family = AF_UNSPEC };
 	struct tst_rtnl_context *ctx;
-	int ret;
+	int ret, save_errno;
 
 	if (strlen(ifname) >= IFNAMSIZ) {
 		tst_brk_(file, lineno, TBROK,
@@ -298,10 +304,12 @@ static int change_ns(const char *file, const int lineno, const char *ifname,
 	}
 
 	ret = tst_rtnl_send_validate(file, lineno, ctx);
+	save_errno = errno;
 	tst_rtnl_destroy_context(file, lineno, ctx);
 
 	if (!ret) {
-		tst_brk_(file, lineno, TBROK | TTERRNO,
+		errno = save_errno;
+		tst_brk_(file, lineno, TBROK | TERRNO,
 			"Failed to move %s to another namespace", ifname);
 	}
 
@@ -327,7 +335,7 @@ static int modify_route(const char *file, const int lineno, unsigned int action,
 	const void *gateway, size_t gatewaylen)
 {
 	struct tst_rtnl_context *ctx;
-	int ret;
+	int ret, save_errno;
 	int32_t index;
 	struct rtmsg info = {
 		.rtm_family = family,
@@ -389,10 +397,12 @@ static int modify_route(const char *file, const int lineno, unsigned int action,
 	}
 
 	ret = tst_rtnl_send_validate(file, lineno, ctx);
+	save_errno = errno;
 	tst_rtnl_destroy_context(file, lineno, ctx);
 
 	if (!ret) {
-		tst_brk_(file, lineno, TBROK | TTERRNO,
+		errno = save_errno;
+		tst_brk_(file, lineno, TBROK | TERRNO,
 			"Failed to modify network route");
 	}
 
diff --git a/lib/tst_rtnetlink.c b/lib/tst_rtnetlink.c
index 1ecda3a9f..627695c80 100644
--- a/lib/tst_rtnetlink.c
+++ b/lib/tst_rtnetlink.c
@@ -376,11 +376,12 @@ int tst_rtnl_check_acks(const char *file, const int lineno,
 			tst_brk_(file, lineno, TBROK,
 				"No ACK found for Netlink message %u",
 				msg->nlmsg_seq);
+			errno = ENOMSG;
 			return 0;
 		}
 
 		if (res->err->error) {
-			TST_ERR = -res->err->error;
+			errno = -res->err->error;
 			return 0;
 		}
 	}
@@ -392,9 +393,7 @@ int tst_rtnl_send_validate(const char *file, const int lineno,
 	struct tst_rtnl_context *ctx)
 {
 	struct tst_rtnl_message *response;
-	int ret;
-
-	TST_ERR = 0;
+	int ret, save_errno;
 
 	if (tst_rtnl_send(file, lineno, ctx) <= 0)
 		return 0;
@@ -406,7 +405,9 @@ int tst_rtnl_send_validate(const char *file, const int lineno,
 		return 0;
 
 	ret = tst_rtnl_check_acks(file, lineno, ctx, response);
+	save_errno = errno;
 	tst_rtnl_free_message(response);
+	errno = save_errno;
 
 	return ret;
 }
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
