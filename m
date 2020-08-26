Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01368252B83
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Aug 2020 12:39:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 97CD83C5657
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Aug 2020 12:39:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 53EE03C0639
 for <ltp@lists.linux.it>; Wed, 26 Aug 2020 12:39:15 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 993C0600902
 for <ltp@lists.linux.it>; Wed, 26 Aug 2020 12:39:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F423DAD83;
 Wed, 26 Aug 2020 10:39:44 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: Jan Stancek <jstancek@redhat.com>,
	ltp@lists.linux.it
Date: Wed, 26 Aug 2020 12:39:13 +0200
Message-Id: <20200826103913.27678-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <1390277350.9966000.1598362700248.JavaMail.zimbra@redhat.com>
References: <1390277350.9966000.1598362700248.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] Re: [PATCH] syscalls/setsockopt05: associate receiver
 with destination address
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

OK, here's the correct test patch. The source port changes on every iteration
so different send() calls shouldn't interfere with one another. If you get
ECONNREFUSED with this patch applied, it's caused by broken implementation
of send(MSG_MORE), not delayed ICMP packets. If this patch prevents the error,
resubmit your patch with fixes.

I'll write the test for send(MSG_MORE) either way because if the flag isn't
honored by the kernel, setsockopt05 will be useless.

---
 testcases/kernel/syscalls/setsockopt/setsockopt05.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt05.c b/testcases/kernel/syscalls/setsockopt/setsockopt05.c
index e78ef236e..698396390 100644
--- a/testcases/kernel/syscalls/setsockopt/setsockopt05.c
+++ b/testcases/kernel/syscalls/setsockopt/setsockopt05.c
@@ -64,6 +64,9 @@ static void run(void)
 
 	for (i = 0; i < 1000; i++) {
 		sock = SAFE_SOCKET(AF_INET, SOCK_DGRAM, 0);
+		addr.sin_port = 12346 + i;
+		SAFE_BIND(sock, (struct sockaddr *)&addr, sizeof(addr));
+		addr.sin_port = 12345;
 		SAFE_CONNECT(sock, (struct sockaddr *)&addr, sizeof(addr));
 		SAFE_SEND(1, sock, buf, BUFSIZE, MSG_MORE);
 		SAFE_SETSOCKOPT_INT(sock, SOL_SOCKET, SO_NO_CHECK, 1);
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
