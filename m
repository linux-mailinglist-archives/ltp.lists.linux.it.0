Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F111575E4
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Feb 2020 13:47:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 77FE03C256A
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Feb 2020 13:47:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id CCD163C23EC
 for <ltp@lists.linux.it>; Mon, 10 Feb 2020 13:47:34 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id D64411000CA6
 for <ltp@lists.linux.it>; Mon, 10 Feb 2020 13:47:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581338852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Zz5W9qrwJME2/C3ryS5WqlB2qcAq9wAohhnaNWw12jg=;
 b=TSsRyg2aTsBn3gNZR/kSCfYUQBcg+Od9DtUQsSqsLVI9QQF7qJk4lKzZ+aEbOmsYz1goMR
 MLTqbd0zPoxntqMqoX4Kx0OWhZjU6bHn+e19R5x6l8aPGXhbe1rvE8bZxgMwzwZ+l9575z
 84ftpyiGadE2fGZh89FtaZXyMnshfyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207--a8zE5nqPVO9znwsgsCZbA-1; Mon, 10 Feb 2020 07:47:28 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E28D10054E3;
 Mon, 10 Feb 2020 12:47:27 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.43.17.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 822045C1D6;
 Mon, 10 Feb 2020 12:47:26 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Mon, 10 Feb 2020 13:47:20 +0100
Message-Id: <87e6761eb699c7912e2064dea222f5ac7fd04a6b.1581338640.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: -a8zE5nqPVO9znwsgsCZbA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/setrlimit06: lower RLIMIT_CPU parameters
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Lower the parameters so that test completes faster where possible.

This also increases alarm timer slightly, which in combination with
lower RLIMIT_CPU aims to avoid false positives in environments with
high steal time, where it can take multiple of wall clock seconds
to spend single second on a cpu.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/syscalls/setrlimit/setrlimit06.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/setrlimit/setrlimit06.c b/testcases/kernel/syscalls/setrlimit/setrlimit06.c
index 726b26841583..3e5bf1d4253d 100644
--- a/testcases/kernel/syscalls/setrlimit/setrlimit06.c
+++ b/testcases/kernel/syscalls/setrlimit/setrlimit06.c
@@ -59,8 +59,8 @@ static void verify_setrlimit(void)
 	pid = SAFE_FORK();
 	if (!pid) {
 		struct rlimit rlim = {
-			.rlim_cur = 2,
-			.rlim_max = 3,
+			.rlim_cur = 1,
+			.rlim_max = 2,
 		};
 
 		TEST(setrlimit(RLIMIT_CPU, &rlim));
@@ -70,7 +70,7 @@ static void verify_setrlimit(void)
 			exit(1);
 		}
 
-		alarm(10);
+		alarm(20);
 
 		while (1);
 	}
-- 
2.18.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
