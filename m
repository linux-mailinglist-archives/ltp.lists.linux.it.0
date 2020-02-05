Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F058152820
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Feb 2020 10:19:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 23A193C2624
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Feb 2020 10:19:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 2B3063C238B
 for <ltp@lists.linux.it>; Wed,  5 Feb 2020 10:19:34 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 779181401B40
 for <ltp@lists.linux.it>; Wed,  5 Feb 2020 10:19:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580894373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wvWcvh+e9LT+wPVuw6RSo7482g3W0QeXbfqBeeoU0GU=;
 b=PRnjkYDyfUBPlF3ZI3oEC9jyOBLxlUumaHXhxh2H+aU3IL3Rwf7+s8LibJ+s/katpMhoDt
 VC3F6WCjQ6xynDVvx6H2S+TDKcZfw848EhCREKir6AmJOQuaFh8Msg6AjpZGre3bt081e1
 Co2/B7FO//PSa1Px0KnkAJ2YrciG4W8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-yJbgrdKHP8ScAZstEYBEBw-1; Wed, 05 Feb 2020 04:19:31 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDCD7100F53A
 for <ltp@lists.linux.it>; Wed,  5 Feb 2020 09:19:29 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.43.17.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64CE71001920
 for <ltp@lists.linux.it>; Wed,  5 Feb 2020 09:19:29 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Wed,  5 Feb 2020 10:19:23 +0100
Message-Id: <7843cc36a04deb034e9479a139f535e5fa5f3135.1580894017.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: yJbgrdKHP8ScAZstEYBEBw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/getrandom02: lower bufsize if low on entropy
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

Some PPC KVM guests accumulate about 1 bit of entropy per second while idle
and running getrandom02. Which isn't enough and test sporadically fails on
timeout.

Adjust the buffer size by looking at entropy_avail. We want to run the test,
even if all entropy is exhausted, but with smaller buffer we don't set
as high expectations on how much entropy is generated within default test time.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/syscalls/getrandom/getrandom02.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/getrandom/getrandom02.c b/testcases/kernel/syscalls/getrandom/getrandom02.c
index ee0193df9897..1384fc5f32c0 100644
--- a/testcases/kernel/syscalls/getrandom/getrandom02.c
+++ b/testcases/kernel/syscalls/getrandom/getrandom02.c
@@ -10,6 +10,8 @@
 #include "lapi/syscalls.h"
 #include "tst_test.h"
 
+#define PROC_ENTROPY_AVAIL "/proc/sys/kernel/random/entropy_avail"
+
 static int modes[] = { 0, GRND_RANDOM, GRND_NONBLOCK,
 		       GRND_RANDOM | GRND_NONBLOCK };
 
@@ -37,11 +39,17 @@ static int check_content(unsigned char *buf, int nb)
 static void verify_getrandom(unsigned int n)
 {
 	unsigned char buf[256];
+	int bufsize = 64, entropy_avail;
 
-	memset(buf, 0, sizeof(buf));
+	if (access(PROC_ENTROPY_AVAIL, F_OK) == 0) {
+		SAFE_FILE_SCANF(PROC_ENTROPY_AVAIL, "%d", &entropy_avail);
+		if (entropy_avail > 256)
+			bufsize = sizeof(buf);
+	}
 
+	memset(buf, 0, sizeof(buf));
 	do {
-		TEST(tst_syscall(__NR_getrandom, buf, sizeof(buf), modes[n]));
+		TEST(tst_syscall(__NR_getrandom, buf, bufsize, modes[n]));
 	} while ((modes[n] & GRND_NONBLOCK) && TST_RET == -1
 		  && TST_ERR == EAGAIN);
 
-- 
2.18.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
