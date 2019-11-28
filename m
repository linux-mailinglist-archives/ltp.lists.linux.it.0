Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4E210C51C
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 09:29:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CD7FE3C23F5
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 09:29:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 845CA3C1815
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 09:29:54 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id A3A5B602AEC
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 09:29:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574929792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ck8VATCYN+IxVoJxW1qTTIqy2ikAjwjYzZ69b92t8D8=;
 b=Rd4Y15qd0ktgmLcTLFZ2V7/6i0ltUuj2egF+0uGz9dw7KyHmccr6uGKo8apoO/EM5g7DRE
 kWaSgXaLkzaI6QUzm2BayT0vxDkHgF2uAIDYbU1RfZEyVwYy1oWxRvo7OKmrioQAoZrpLf
 a6wdz0bZF/oVnPRcmk3/nFevxekMB/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-EiNmApaVMxqI4QJj_kNiVw-1; Thu, 28 Nov 2019 03:29:50 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 724FCDB60
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 08:29:49 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F748600C8;
 Thu, 28 Nov 2019 08:29:48 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Thu, 28 Nov 2019 16:29:45 +0800
Message-Id: <20191128082945.6495-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: EiNmApaVMxqI4QJj_kNiVw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [COMMITTED PATCH] mmap1: include lapi/abisize.h header file
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
Cc: zhijwang@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

To get rid of this BROK on i686:
 mmap1.c:204: BROK: mmap((nil),2147483648,3,34,-1,0) failed: ENOMEM (12)

Reported-by: Zhijun Wang <zhijwang@redhat.com>
Signed-off-by: Li Wang <liwang@redhat.com>
---
 testcases/kernel/mem/mtest06/mmap1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/kernel/mem/mtest06/mmap1.c b/testcases/kernel/mem/mtest06/mmap1.c
index c5417444f..5c7d3df2f 100644
--- a/testcases/kernel/mem/mtest06/mmap1.c
+++ b/testcases/kernel/mem/mtest06/mmap1.c
@@ -30,6 +30,7 @@
 #include <stdlib.h>
 #include "lapi/abisize.h"
 #include "tst_test.h"
+#include "lapi/abisize.h"
 #include "tst_safe_pthread.h"
 
 #ifdef TST_ABI32
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
