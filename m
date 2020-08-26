Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B94252B20
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Aug 2020 12:08:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 32AC73C5659
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Aug 2020 12:08:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 9B24A3C0639
 for <ltp@lists.linux.it>; Wed, 26 Aug 2020 12:08:30 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 892311A00F71
 for <ltp@lists.linux.it>; Wed, 26 Aug 2020 12:08:30 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D0807AF0C;
 Wed, 26 Aug 2020 10:09:00 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: Jan Stancek <jstancek@redhat.com>,
	ltp@lists.linux.it
Date: Wed, 26 Aug 2020 12:08:28 +0200
Message-Id: <20200826100828.21690-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <1390277350.9966000.1598362700248.JavaMail.zimbra@redhat.com>
References: <1390277350.9966000.1598362700248.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/setsockopt05: associate receiver with
 destination address
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

Let's see if it's really a delayed ICMP message. Can you reproduce the error
after applying this patch?

In the meantime, I'll write a test for send(MSG_MORE).

---
 testcases/kernel/syscalls/setsockopt/setsockopt05.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt05.c b/testcases/kernel/syscalls/setsockopt/setsockopt05.c
index e78ef236e..594178744 100644
--- a/testcases/kernel/syscalls/setsockopt/setsockopt05.c
+++ b/testcases/kernel/syscalls/setsockopt/setsockopt05.c
@@ -63,6 +63,7 @@ static void run(void)
 	memset(buf, 0x42, BUFSIZE);
 
 	for (i = 0; i < 1000; i++) {
+		addr.sin_port = 12345 + i;
 		sock = SAFE_SOCKET(AF_INET, SOCK_DGRAM, 0);
 		SAFE_CONNECT(sock, (struct sockaddr *)&addr, sizeof(addr));
 		SAFE_SEND(1, sock, buf, BUFSIZE, MSG_MORE);
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
