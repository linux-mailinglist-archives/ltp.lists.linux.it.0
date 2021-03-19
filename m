Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A9B34181D
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 10:20:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 61B5B3C8EFB
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 10:20:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 20D073C5FCB
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 10:19:17 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CD6571A008B2
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 10:19:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1616145556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0yz3IoJ0emnj1eq7tJrmZOMfDdRsa/+m4aPUvL+w83Q=;
 b=IY1B7B9RGIIzBpkwKlSZix6eW43JTveGttBIk4Z3k0F35F7rcnwU2qntqPIiXdzSFSEj4B
 A62E9sWKEsnPvbm+ZRVknZXOf+G3hl3bp7FBZIzag+AWhcFBRxjegxCB92pIwn10M6ebFF
 y9PcZZ8DftmqNzgo3DYB3RGISgfkHPU=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6AFACAE42;
 Fri, 19 Mar 2021 09:19:16 +0000 (UTC)
To: ltp@lists.linux.it
Date: Fri, 19 Mar 2021 09:18:37 +0000
Message-Id: <20210319091837.27319-8-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210319091837.27319-1-rpalethorpe@suse.com>
References: <20210319091837.27319-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3 7/7] fzsync: Check processor affinity
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

It is useful for testing Fuzzy Sync itself to set the CPU affinity to
a single core. The current processes affinity does not effect
tst_ncpus(), but we can get the affinity separately.

Note that checking this still does not guarantee we will use yield
when restricted to only one core. We would have to periodically probe
which CPUs threads are running on until we detect more than one CPU.

Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 include/tst_fuzzy_sync.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
index 36a604e13..e38b56e5e 100644
--- a/include/tst_fuzzy_sync.h
+++ b/include/tst_fuzzy_sync.h
@@ -61,7 +61,6 @@
 
 #include <math.h>
 #include <pthread.h>
-#include <sched.h>
 #include <stdbool.h>
 #include <stdlib.h>
 #include <sys/time.h>
@@ -213,12 +212,16 @@ struct tst_fzsync_pair {
  */
 static void tst_fzsync_pair_init(struct tst_fzsync_pair *pair)
 {
+	long ncpus = tst_ncpus_available();
+
 	CHK(avg_alpha, 0, 1, 0.25);
 	CHK(min_samples, 20, INT_MAX, 1024);
 	CHK(max_dev_ratio, 0, 1, 0.1);
 	CHK(exec_time_p, 0, 1, 0.5);
 	CHK(exec_loops, 20, INT_MAX, 3000000);
-	CHK(yield_in_wait, 0, 1, (tst_ncpus() <= 1));
+
+	if (ncpus <= 1)
+		pair->yield_in_wait = 1;
 }
 #undef CHK
 
-- 
2.30.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
