Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA9310532B
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 14:34:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1BCE23C22D5
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 14:34:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 3892F3C1C93
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 14:34:18 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 028801B601DE
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 14:34:16 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 87B13AD4E
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 13:34:15 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 21 Nov 2019 14:34:14 +0100
Message-Id: <20191121133414.19808-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/shmat03: Remove CVE tag
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

The CVE was proved to be bogus so as far as I can tell we shouldn't list
it in tags.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/ipc/shmat/shmat03.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/testcases/kernel/syscalls/ipc/shmat/shmat03.c b/testcases/kernel/syscalls/ipc/shmat/shmat03.c
index 8a0b89bd5..dfa427a56 100644
--- a/testcases/kernel/syscalls/ipc/shmat/shmat03.c
+++ b/testcases/kernel/syscalls/ipc/shmat/shmat03.c
@@ -101,7 +101,6 @@ static struct tst_test test = {
 	.cleanup = cleanup,
 	.test_all = run,
 	.tags = (const struct tst_tag[]) {
-		{"CVE", "2017-5669"},
 		{"linux-git", "95e91b831f87"},
 		{"linux-git", "a73ab244f0da"},
 		{"linux-git", "8f89c007b6de"},
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
