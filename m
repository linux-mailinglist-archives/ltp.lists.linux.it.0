Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB553E16F8
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 16:29:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7AFCE3C7DB8
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 16:29:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AD29F3C5EA4
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 16:29:41 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D74582000C7
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 16:29:40 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0A2D0223B9
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 14:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628173780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=fQEIg8UwFm9H2jBNmRqeCAkJKwLEc1p8AB++be6ZJ7A=;
 b=WdJ/7aqLFYlEejiM5JOdu8GX44AZSX2+NWp2nX/Ce2nrQ4gh6fX5+sUanFMnjWboL9x4w3
 9kHvCGbGgx77DUfztI0PYhYw8h2OW2uKn0FOpWeVbmMAQ3G3CP///NU52qc90KIobqpCz5
 Qd1EECGCO5L5W5ojo8XUIx69G+prnoo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628173780;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=fQEIg8UwFm9H2jBNmRqeCAkJKwLEc1p8AB++be6ZJ7A=;
 b=C9LCKA1uqxElXtN7xG1/G2yxwN9KhGVqNWlNb3rsMTsnQJ7nMr4U9OGaxX+H7tkvC05Tm4
 lzz7OEL15xanJYDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B13B013D66
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 14:29:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HmnqKtP1C2H6ZQAAMHmgww
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Thu, 05 Aug 2021 14:29:39 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  5 Aug 2021 16:29:49 +0200
Message-Id: <20210805142949.10834-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] [COMMITTED] lapi/ip_tables.h: Fix build on older
 distributions
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

On older distributions the linux/netfilter_ipv4/ip_tables.h does not
include a header that would define IFNAMSIZ and the build fails.

This effectivelly moves the #include <net/if.h> from the setsockopt03.c
to the lapi/ip_tables.h which fixes the build.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
Fixes: 5684bec6b480 (API: Add lapi/ip_tables.h and use it in setsockopt03)
---
 include/lapi/ip_tables.h                            | 1 +
 testcases/kernel/syscalls/setsockopt/setsockopt03.c | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/lapi/ip_tables.h b/include/lapi/ip_tables.h
index e91238ffd..3ac62141c 100644
--- a/include/lapi/ip_tables.h
+++ b/include/lapi/ip_tables.h
@@ -5,6 +5,7 @@
 
 #include "config.h"
 
+#include <net/if.h>
 #include <linux/netfilter_ipv4/ip_tables.h>
 
 #ifndef HAVE_STRUCT_XT_ENTRY_MATCH
diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt03.c b/testcases/kernel/syscalls/setsockopt/setsockopt03.c
index 1434475db..b7a4447ba 100644
--- a/testcases/kernel/syscalls/setsockopt/setsockopt03.c
+++ b/testcases/kernel/syscalls/setsockopt/setsockopt03.c
@@ -19,7 +19,6 @@
 #include <sys/types.h>
 #include <sys/socket.h>
 #include <netinet/in.h>
-#include <net/if.h>
 #include <limits.h>
 
 #include "tst_test.h"
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
