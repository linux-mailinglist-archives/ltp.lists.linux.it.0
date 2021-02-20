Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 66955320558
	for <lists+linux-ltp@lfdr.de>; Sat, 20 Feb 2021 13:37:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 222FA3C6570
	for <lists+linux-ltp@lfdr.de>; Sat, 20 Feb 2021 13:37:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 0ABE83C4EC1
 for <ltp@lists.linux.it>; Sat, 20 Feb 2021 13:37:32 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 9B10A6001EA
 for <ltp@lists.linux.it>; Sat, 20 Feb 2021 13:37:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613824650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5sr49SyQSu0DAZivQRpYJmNchUnjLCwkl8Sr2zFc9UE=;
 b=PK87rTEqXzkRV/bPTCgBO7JkjRr1GVMODz9kFxIQF4frvyDaf4mCR4G/OsnEJdAvtI+kfR
 YsxS0hVXQ/Ez62s871HAwcVvlnKt32nhQoSSyMjrel4LEmddKl3Tmg15NlS/3mcu9VazpO
 CX1J0d7UxvbVsRWhJbY9Mzukv382zj8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-fZiWbVjLMJGCJMTXmG-ttA-1; Sat, 20 Feb 2021 07:37:28 -0500
X-MC-Unique: fZiWbVjLMJGCJMTXmG-ttA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D097818449E1;
 Sat, 20 Feb 2021 12:37:26 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92FDA5D730;
 Sat, 20 Feb 2021 12:37:25 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it,
	zhaogongyi@huawei.com
Date: Sat, 20 Feb 2021 12:37:24 +0000
Message-Id: <20210220123724.16939-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] open_posix_testsuite: correct fork11-1 report log
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

Signed-off-by: Li Wang <liwang@redhat.com>
---
 .../open_posix_testsuite/conformance/interfaces/fork/11-1.c   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/fork/11-1.c b/testcases/open_posix_testsuite/conformance/interfaces/fork/11-1.c
index 8a7796cfd..e31f3896f 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/fork/11-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/fork/11-1.c
@@ -47,7 +47,7 @@ static int child(int fd)
 
 	if (fcntl(fd, F_SETLK, &fl) == -1) {
 		if (errno == EACCES || errno == EAGAIN) {
-			printf("PASSED: child did not inherit the lock\n");
+			printf("PASSED: Child locked file already locked by parent\n");
 			return PTS_PASS;
 		}
 
@@ -56,7 +56,7 @@ static int child(int fd)
 		return PTS_UNRESOLVED;
 	}
 
-	printf("Child locked file already locked by parent\n");
+	printf("Child did not inherit the lock\n");
 	return PTS_FAIL;
 }
 
-- 
2.21.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
