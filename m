Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EEA4137C7
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Sep 2021 18:46:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E95523CA2D2
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Sep 2021 18:46:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5327E3C821A
 for <ltp@lists.linux.it>; Tue, 21 Sep 2021 18:46:04 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B0D7B10006CD
 for <ltp@lists.linux.it>; Tue, 21 Sep 2021 18:46:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632242762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=t9QZB405aVuJe6Y+MfDLHv0ldxauCNdpqwX2YOmsbOY=;
 b=TCedu1WwB/YkkzmV27+UEWYXAQQsNQZC7EFtQk5znwkaaOqvxxW2XwiPF36pgHZe+6oS4o
 RDOgmWSsKbZjqXGKgFWHQN2dFLpc9j02eCixdSZitIXfruIGmf6pj9P2Co/W8iClA8TcYu
 +Fi438R1pcKLGt2XoQ35tzRS9LDcRGQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-ZBltXFMyMouja_TkXEM5fw-1; Tue, 21 Sep 2021 12:46:00 -0400
X-MC-Unique: ZBltXFMyMouja_TkXEM5fw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2BB910151E0
 for <ltp@lists.linux.it>; Tue, 21 Sep 2021 16:45:59 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.40.208.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF9F469FAE;
 Tue, 21 Sep 2021 16:45:58 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it,
	liwan@redhat.com
Date: Tue, 21 Sep 2021 18:45:54 +0200
Message-Id: <8b4c1fad2914aee00c8a160d1f9e482574b8e5ae.1632242721.git.jstancek@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] hugeshmat04: don't attach at specific address
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

The test intermittently fails on ppc64le, when heap
happens to overlap with segment that the test is trying
to attach at 1GB boundary.

Let the kernel find suitable address.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat04.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat04.c b/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat04.c
index e9bb9fbf7b4b..75f61de066d7 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat04.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat04.c
@@ -22,7 +22,6 @@
 #include "hugetlb.h"
 
 #define SIZE	(1024 * 1024 * 1024)
-#define BOUNDARY (1024 * 1024 * 1024)
 
 static long huge_free;
 static long huge_free2;
@@ -54,7 +53,7 @@ static void shared_hugepage(void)
 	if (shmid < 0)
 		tst_brk(TBROK | TERRNO, "shmget");
 
-	buf = shmat(shmid, (void *)BOUNDARY, SHM_RND | 0777);
+	buf = shmat(shmid, NULL, 0777);
 	if (buf == (void *)-1) {
 		shmctl(shmid, IPC_RMID, NULL);
 		tst_brk(TBROK | TERRNO, "shmat");
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
