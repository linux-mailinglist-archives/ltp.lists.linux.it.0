Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6497B2C40E2
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 14:06:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1D1513C305F
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 14:06:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 812053C0354
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 14:06:34 +0100 (CET)
Received: from mail.avm.de (mail.avm.de [212.42.244.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A47DF1A0121B
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 14:06:33 +0100 (CET)
Received: from mail-notes.avm.de (mail-notes.avm.de [172.16.0.1])
 by mail.avm.de (Postfix) with ESMTP
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 14:06:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
 t=1606309592; bh=9SXgBZoaE2zDqIBLBQcarQVX46HqV5rOmzSwX43f1BI=;
 h=In-Reply-To:References:Subject:From:To:Date:From;
 b=iNCc3IN/EQoWzgr3E9pzoXj6+vpMX4Aw/8zzv6VfzgQeX/S7YEr/jmG4TO5/8zfxM
 eS3deDKCafXVr6M8GLqfFmbrZWuk9jE9fWUKKHGcjO2/no5B+2HMQVJjUUIFf1lO31
 Uc2UcbRgSMgKusX1A2RCvb4vJpXZxxPoytmQlCiI=
MIME-Version: 1.0
X-Disclaimed: 1
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
In-Reply-To: 
References: 
To: "LTP List" <ltp@lists.linux.it>
Date: Wed, 25 Nov 2020 14:06:32 +0100
Message-ID: <OFCE604BCE.4F62924B-ONC125862B.004801C0-C125862B.0048027B@avm.de>
X-Mailer: Lotus Domino Web Server Release 11.0.1FP1 July 20, 2020
X-MIMETrack: Serialize by http on ANIS1/AVM(Release 11.0.1FP1|July 20, 2020) at
 25.11.2020 14:06:32, Serialize complete at 25.11.2020 14:06:32,
 Serialize by Router on ANIS1/AVM(Release 11.0.1FP1|July 20, 2020) at
 25.11.2020 14:06:32
X-purgate-ID: 149429::1606309592-0000783E-3B3109C0/0/0
X-purgate-type: clean
X-purgate-size: 1992
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] netstress: explicitly set a thread stack size
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
From: Johannes Nixdorf via ltp <ltp@lists.linux.it>
Reply-To: j.nixdorf@avm.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Musl libc uses a relatively small thread stack size (128k [1]). This
gets used up on 2 local buffers sized max_msg_len (64k by default),
which causes a segfault due to a stack overflow in the error reporting
path.

Set the stack size to 128kB + 2*max_msg_len instead, which is enough for
both buffers with an additional allowance for the remaining stack usage
by netstress and called libc or ltp helper functions.

[1]: https://wiki.musl-libc.org/functional-differences-from-glibc.html#Thread_stack_size

Signed-off-by: Johannes Nixdorf <j.nixdorf@avm.de>
---
 testcases/network/netstress/netstress.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/testcases/network/netstress/netstress.c b/testcases/network/netstress/netstress.c
index e79e64220..bcd3cd049 100644
--- a/testcases/network/netstress/netstress.c
+++ b/testcases/network/netstress/netstress.c
@@ -480,7 +480,7 @@ static void client_init(void)
 	clock_gettime(CLOCK_MONOTONIC_RAW, &tv_client_start);
 	intptr_t i;
 	for (i = 0; i < clients_num; ++i)
-		SAFE_PTHREAD_CREATE(&thread_ids[i], 0, client_fn, (void *)i);
+		SAFE_PTHREAD_CREATE(&thread_ids[i], &attr, client_fn, (void *)i);
 }
 
 static void client_run(void)
@@ -747,8 +747,6 @@ static void server_run(void)
 	struct sockaddr_in6 addr6;
 	socklen_t addr_size = sizeof(addr6);
 
-	pthread_attr_init(&attr);
-
 	/*
 	 * detaching threads allow to reclaim thread's resources
 	 * once a thread finishes its work.
@@ -980,6 +978,14 @@ static void setup(void)
 	break;
 	}
 
+	errno = pthread_attr_init(&attr);
+	if (errno != 0)
+		tst_brk(TBROK | TERRNO, "pthread_attr_init failed");
+
+	errno = pthread_attr_setstacksize(&attr, 128*1024 + 2*max_msg_len);
+	if (errno != 0)
+		tst_brk(TBROK | TERRNO, "pthread_attr_setstacksize failed");
+
 	net.init();
 }
 
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
