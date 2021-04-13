Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A52A935D880
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 09:09:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2332A3C1C46
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 09:09:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F2C883C71DF
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 09:08:08 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 812E9200DDE
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 09:08:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1618297688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YqZE8IYTaXWle5B9Pnavbnnj/GFp1qAKFOCt/W8lCJw=;
 b=A8DkxDwRyJoWpxOQQaK+0OwSmfyblSeOFVonscIMjJUHu+Yn6DwFPS1WmGql0/Wq4iUi37
 wJ/QDJ2kPvCDk8DGAUZzW7UbDJZ1mB98g3p9J1y9mfqIgTIes0XL36NWdTz+CRF7Z4xUa5
 aMr9YeEDb1Z7FAHmNKoj1+fMEoh6oBo=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2581DAF11;
 Tue, 13 Apr 2021 07:08:08 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 13 Apr 2021 08:07:53 +0100
Message-Id: <20210413070753.1691-8-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413070753.1691-1-rpalethorpe@suse.com>
References: <20210413070753.1691-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v4 7/7] fzsync: Check processor affinity
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
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Acked-by: Petr Vorel <pvorel@suse.cz>
Reviewed-by: Li Wang <liwang@redhat.com>
---
 include/tst_fuzzy_sync.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
index 36a604e13..8f97bb8f6 100644
--- a/include/tst_fuzzy_sync.h
+++ b/include/tst_fuzzy_sync.h
@@ -61,7 +61,6 @@
 
 #include <math.h>
 #include <pthread.h>
-#include <sched.h>
 #include <stdbool.h>
 #include <stdlib.h>
 #include <sys/time.h>
@@ -218,7 +217,9 @@ static void tst_fzsync_pair_init(struct tst_fzsync_pair *pair)
 	CHK(max_dev_ratio, 0, 1, 0.1);
 	CHK(exec_time_p, 0, 1, 0.5);
 	CHK(exec_loops, 20, INT_MAX, 3000000);
-	CHK(yield_in_wait, 0, 1, (tst_ncpus() <= 1));
+
+	if (tst_ncpus_available() <= 1)
+		pair->yield_in_wait = 1;
 }
 #undef CHK
 
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
