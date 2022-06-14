Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6A754AF67
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jun 2022 13:40:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1D41E3C94E9
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jun 2022 13:40:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2669D3C8CA7
 for <ltp@lists.linux.it>; Tue, 14 Jun 2022 13:40:18 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 53E771A00684
 for <ltp@lists.linux.it>; Tue, 14 Jun 2022 13:40:17 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9AB1021B25
 for <ltp@lists.linux.it>; Tue, 14 Jun 2022 11:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1655206817; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=RDLGyQFVnlOCm9PpyqJ4VVHm+NfU++JGgiJW/MOOPH8=;
 b=OEgExFD3p2ovNfSvos3HEhYqn2fS4RolGYKOCOBIGMKXeTWarDmCh7hstzfdpOJlusOrrU
 0d4iSQepJjV+i1O76+17d0n/DymMSvN11OHr9a1koNQAi5BTEk7oVkaeCfpbeLX9RdEdtZ
 +hKZb6V1/tLkvG0b33YJFwjI3DcARa4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1655206817;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=RDLGyQFVnlOCm9PpyqJ4VVHm+NfU++JGgiJW/MOOPH8=;
 b=0vochFbA9Jk/jl70B5v4UuoRcDZTz1/CSB9YjhcMAim0OjsfBn8FelgxUUobMjICJ46MbG
 cwHiLf0aPPjSRbAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3CE2B139EC
 for <ltp@lists.linux.it>; Tue, 14 Jun 2022 11:40:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OUajC6FzqGJjdgAAMHmgww
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Tue, 14 Jun 2022 11:40:17 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 14 Jun 2022 13:42:24 +0200
Message-Id: <20220614114224.9362-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] syscalls/perf_event_open03: Fix include
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

Use tst_timer.h instead of tst_timer_test.h as the test just uses
function from tst_timer.h and does not implement a timer test at all.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/perf_event_open/perf_event_open03.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/perf_event_open/perf_event_open03.c b/testcases/kernel/syscalls/perf_event_open/perf_event_open03.c
index 999c8aa22..7dd31d3d2 100644
--- a/testcases/kernel/syscalls/perf_event_open/perf_event_open03.c
+++ b/testcases/kernel/syscalls/perf_event_open/perf_event_open03.c
@@ -16,7 +16,7 @@
 
 #include "config.h"
 #include "tst_test.h"
-#include "tst_timer_test.h"
+#include "tst_timer.h"
 #include "lapi/syscalls.h"
 
 #include "perf_event_open.h"
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
