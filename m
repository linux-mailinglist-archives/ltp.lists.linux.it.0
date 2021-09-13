Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A666040995B
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Sep 2021 18:37:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CF1163C92A3
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Sep 2021 18:37:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7342D3C1D85
 for <ltp@lists.linux.it>; Mon, 13 Sep 2021 18:37:49 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8ACBC1A00114
 for <ltp@lists.linux.it>; Mon, 13 Sep 2021 18:37:48 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id B72BD1FDA0;
 Mon, 13 Sep 2021 16:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1631551067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=IoUS6hrHtgdaofOxDzXndrHcW3UaHeXF4NGnlRgwfRg=;
 b=kE3hGYgvVFN2w0x4ooH2DG5n80FJkHCUPlARjx5sxGMLQVcpLAS3YDEJJ/ySMfZCuo/61n
 1sIXxY0b493kPry68LaF+ZW4QYNbEqAE9gW1sb1gn3c5UXujDJYYlyf/RedjZnJk6ai90H
 YWPfv9PDIemQyH8mXSndJChE3npNY5E=
Received: from blezhepekov.udp.ovpn1.nue.suse.de (unknown [10.163.30.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 84BF6A3B81;
 Mon, 13 Sep 2021 16:37:47 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 13 Sep 2021 19:37:43 +0300
Message-Id: <20210913163745.28108-1-bogdan.lezhepekov@suse.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v1 1/3] realtime:hrtimer-prio: fix misleading help
 message
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
From: Bogdan Lezhepekov via ltp <ltp@lists.linux.it>
Reply-To: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The argument "-m" had been removed years ago, but the help
message mistakenly offered to set "maximum timer
latency in microseconds".

Signed-off-by: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
---
 testcases/realtime/func/hrtimer-prio/hrtimer-prio.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/testcases/realtime/func/hrtimer-prio/hrtimer-prio.c b/testcases/realtime/func/hrtimer-prio/hrtimer-prio.c
index 4ae49a713..cbc2343f6 100644
--- a/testcases/realtime/func/hrtimer-prio/hrtimer-prio.c
+++ b/testcases/realtime/func/hrtimer-prio/hrtimer-prio.c
@@ -76,9 +76,6 @@ void usage(void)
 	printf
 	    ("  -f#	   #:rt fifo priority of busy threads (1,98), defaults to %d\n",
 	     DEF_MED_PRIO);
-	printf
-	    ("  -m#	   #:maximum timer latency in microseconds, defaults to %d\n",
-	     DEF_CRITERIA);
 }
 
 int parse_args(int c, char *v)
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
