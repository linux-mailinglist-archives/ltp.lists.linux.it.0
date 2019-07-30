Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8887B124
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2019 20:03:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 963DB3C1D4C
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2019 20:03:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id E3B353C1D0A
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 20:03:18 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1004E1A006F8
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 20:03:17 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 45E70AFC2
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 18:03:16 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 30 Jul 2019 20:03:14 +0200
Message-Id: <20190730180315.6958-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH 1/2] syscalls/accept02: Fix
 TST_GET_UNUSED_PORT() usage
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

The value returned from TST_GET_UNUSED_PORT() is in network byte order
already so we must not use htons() when passing the value in the
sockaddr structure.

Also when printing the value we have to do the inverse conversion.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/accept/accept02.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/accept/accept02.c b/testcases/kernel/syscalls/accept/accept02.c
index 662ae4346..3db0f33bc 100644
--- a/testcases/kernel/syscalls/accept/accept02.c
+++ b/testcases/kernel/syscalls/accept/accept02.c
@@ -92,7 +92,7 @@ static void run(void)
 {
 	pthread_t server_thr, client_thr;
 
-	server_addr.sin_port = htons(server_port);
+	server_addr.sin_port = server_port;
 	client_addr.sin_port = htons(0);
 
 	SAFE_PTHREAD_CREATE(&server_thr, NULL, server_thread, NULL);
@@ -121,7 +121,7 @@ static void setup(void)
 	addr_len = sizeof(struct sockaddr_in);
 
 	server_port = TST_GET_UNUSED_PORT(AF_INET, SOCK_STREAM);
-	tst_res(TINFO, "Starting listener on port: %d", server_port);
+	tst_res(TINFO, "Starting listener on port: %d", ntohs(server_port));
 }
 
 static void cleanup(void)
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
