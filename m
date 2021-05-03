Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B715371244
	for <lists+linux-ltp@lfdr.de>; Mon,  3 May 2021 10:10:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D8CD73C5981
	for <lists+linux-ltp@lfdr.de>; Mon,  3 May 2021 10:10:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AC3863C220F
 for <ltp@lists.linux.it>; Mon,  3 May 2021 10:07:45 +0200 (CEST)
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id F31AD200B6B
 for <ltp@lists.linux.it>; Mon,  3 May 2021 10:07:44 +0200 (CEST)
Received: from sc9-mailhost2.vmware.com (10.113.161.72) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Mon, 3 May 2021 01:07:35 -0700
Received: from ankitj-virtual-machine.eng.vmware.com (unknown [10.197.103.58])
 by sc9-mailhost2.vmware.com (Postfix) with ESMTP id EDE052014C;
 Mon,  3 May 2021 01:07:35 -0700 (PDT)
From: Ankit Jain <ankitja@vmware.com>
To: <ltp@lists.linux.it>
Date: Mon, 3 May 2021 13:37:19 +0530
Message-ID: <1620029239-31643-1-git-send-email-ankitja@vmware.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-002.vmware.com: ankitja@vmware.com does not
 designate permitted sender hosts)
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 03 May 2021 10:10:18 +0200
Subject: [LTP] [PATCH] realtime/func/pi-tests: testpi-2 parser indentation
 fix
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
Cc: sturlapati@vmware.com, ankitja@vmware.com, bordoloih@vmware.com,
 bvikas@vmware.com, srivatsa@csail.mit.edu, srivatsab@vmware.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

There is an indentation issue in parser for testpi-2
which causes incorect parsing of the logs.

Signed-off-by: Ankit Jain <ankitja@vmware.com>
---
 testcases/realtime/func/pi-tests/parse-testpi2.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/testcases/realtime/func/pi-tests/parse-testpi2.py b/testcases/realtime/func/pi-tests/parse-testpi2.py
index 69b2748..a455843 100644
--- a/testcases/realtime/func/pi-tests/parse-testpi2.py
+++ b/testcases/realtime/func/pi-tests/parse-testpi2.py
@@ -49,10 +49,8 @@ class TestPi2(Log):
					flag=True
				elif count == 0:
					return False
+			prev_line=line

-
-
-		prev_line=line
		if count>=2:
			return True
		else:
--
2.7.4

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
