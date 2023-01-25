Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFDB67AF32
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Jan 2023 11:02:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7E92B3CC75A
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Jan 2023 11:02:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BC8F93CB37F
 for <ltp@lists.linux.it>; Wed, 25 Jan 2023 11:02:38 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2C7741400C41
 for <ltp@lists.linux.it>; Wed, 25 Jan 2023 11:02:37 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A38C321CE8;
 Wed, 25 Jan 2023 10:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1674640956; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qez0nGZGITyaYHv7fqOdmLEJt/Quc7zOyWpr3rhDhRY=;
 b=dsO11qpHs4gNlIJDkyXNW+axayJlONTigYSk95EL2Q0SmfHsSOMfdk0RQ2B1KIO4aU6AHy
 jfLxabVqOpSmOg7HSkw7t5vqkqJ1//arvtDse1JL2Sn8sGd0Y4zrJjWKsFSFmpK8bAem+C
 +oKggaTosEA+apRb/BofTKCmEBj5Cbk=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 65EE01358F;
 Wed, 25 Jan 2023 10:02:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GHY4Fjz+0GOJLQAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Wed, 25 Jan 2023 10:02:36 +0000
To: ltp@lists.linux.it
Date: Wed, 25 Jan 2023 11:00:42 +0100
Message-Id: <20230125100043.32349-2-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230125100043.32349-1-andrea.cervesato@suse.com>
References: <20230125100043.32349-1-andrea.cervesato@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v4 1/2] Add SAFE_SETHOSTNAME macro
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 include/safe_net_fn.h  |  3 +++
 include/tst_safe_net.h |  3 +++
 lib/safe_net.c         | 17 +++++++++++++++++
 3 files changed, 23 insertions(+)

diff --git a/include/safe_net_fn.h b/include/safe_net_fn.h
index ff81b1337..6c63cb2cf 100644
--- a/include/safe_net_fn.h
+++ b/include/safe_net_fn.h
@@ -73,6 +73,9 @@ int safe_getsockname(const char *file, const int lineno,
 int safe_gethostname(const char *file, const int lineno,
 		     char *name, size_t size);
 
+int safe_sethostname(const char *file, const int lineno,
+		     const char *name, size_t size);
+
 int tst_getsockport(const char *file, const int lineno, int sockfd);
 
 unsigned short tst_get_unused_port(const char *file, const int lineno,
diff --git a/include/tst_safe_net.h b/include/tst_safe_net.h
index e85b79a3e..98f0256fd 100644
--- a/include/tst_safe_net.h
+++ b/include/tst_safe_net.h
@@ -68,6 +68,9 @@
 #define SAFE_GETHOSTNAME(name, size) \
 	safe_gethostname(__FILE__, __LINE__, name, size)
 
+#define SAFE_SETHOSTNAME(name, size) \
+	safe_sethostname(__FILE__, __LINE__, name, size)
+
 #define TST_GETSOCKPORT(sockfd) \
 	tst_getsockport(__FILE__, __LINE__, sockfd)
 
diff --git a/lib/safe_net.c b/lib/safe_net.c
index 1717f0745..5dec0de11 100644
--- a/lib/safe_net.c
+++ b/lib/safe_net.c
@@ -469,6 +469,23 @@ int safe_gethostname(const char *file, const int lineno,
 	return rval;
 }
 
+int safe_sethostname(const char *file, const int lineno,
+		     const char *name, size_t size)
+{
+	int rval = sethostname(name, size);
+
+	if (rval == -1) {
+		tst_brkm_(file, lineno, TBROK | TERRNO, NULL,
+			"sethostname(%p, %zu) failed", name, size);
+	} else if (rval) {
+		tst_brkm_(file, lineno, TBROK | TERRNO, NULL,
+			"Invalid sethostname(%p, %zu) return value %d", name,
+			size, rval);
+	}
+
+	return rval;
+}
+
 /*
  * @return port in network byte order.
  */
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
