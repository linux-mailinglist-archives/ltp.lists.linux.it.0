Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 509E959F4BD
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Aug 2022 10:07:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 422DE3CA36D
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Aug 2022 10:07:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CF09D3C9AEA
 for <ltp@lists.linux.it>; Wed, 24 Aug 2022 10:07:29 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B4CD2200ADD
 for <ltp@lists.linux.it>; Wed, 24 Aug 2022 10:07:28 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 44FC820075;
 Wed, 24 Aug 2022 08:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1661328447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=p4C7vJcqMbHYe7fmziuxDJ/JXCV2PkxXi3IvsU3P0/w=;
 b=oTlzRSZrFYOrxJvaZTpvL1YweyCgMci4UPRTYRA5Hi3N1mqrk4eiiOfJcNS7710ytem+Ze
 WyPFs8AU4QhLUouRtgD51L5K0OkllR+/egFabbqJRC43JGjCFDFgR2QNX+8whUjEDQUt/z
 okpVM8TnGT+IWMQkbSmJeIIgpYeLJ4g=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 05FA713AC0;
 Wed, 24 Aug 2022 08:07:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KeLUNz7cBWNHXQAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Wed, 24 Aug 2022 08:07:26 +0000
To: ltp@lists.linux.it
Date: Wed, 24 Aug 2022 10:06:38 +0200
Message-Id: <20220824080638.23012-1-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v1] Add more madvise testcases in madvise01
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

Added MADV_COLD and MADV_PAGEOUT madvise modes and created two new
testcases in madvise01 for them. Supported by kernel >= 5.4.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 include/lapi/mmap.h                           | 8 ++++++++
 testcases/kernel/syscalls/madvise/madvise01.c | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/include/lapi/mmap.h b/include/lapi/mmap.h
index 12845b76e..49108338b 100644
--- a/include/lapi/mmap.h
+++ b/include/lapi/mmap.h
@@ -66,6 +66,14 @@
 # define MADV_KEEPONFORK 19
 #endif
 
+#ifndef MADV_COLD
+# define MADV_COLD	20
+#endif
+
+#ifndef MADV_PAGEOUT
+# define MADV_PAGEOUT	21
+#endif
+
 #ifndef MAP_FIXED_NOREPLACE
 
 #ifdef __alpha__
diff --git a/testcases/kernel/syscalls/madvise/madvise01.c b/testcases/kernel/syscalls/madvise/madvise01.c
index de5daf34a..ec64a1db3 100644
--- a/testcases/kernel/syscalls/madvise/madvise01.c
+++ b/testcases/kernel/syscalls/madvise/madvise01.c
@@ -55,6 +55,8 @@ static struct tcase {
 	{MADV_FREE,        "MADV_FREE",        &amem},  /* since Linux 4.5 */
 	{MADV_WIPEONFORK,  "MADV_WIPEONFORK",  &amem},  /* since Linux 4.14 */
 	{MADV_KEEPONFORK,  "MADV_KEEPONFORK",  &amem},  /* since Linux 4.14 */
+	{MADV_COLD,        "MADV_COLD",        &amem},  /* since Linux 5.4 */
+	{MADV_PAGEOUT,     "MADV_PAGEOUT",     &amem},  /* since Linux 5.4 */
 
 };
 
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
