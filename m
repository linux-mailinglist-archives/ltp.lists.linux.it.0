Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C777E3655D1
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 11:56:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E1E133C6D0E
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 11:56:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 220453C6CC0
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 11:56:38 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2E4791400521
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 11:56:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7C9CDAE78
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 09:56:37 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 20 Apr 2021 11:42:45 +0200
Message-Id: <20210420094245.8910-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] syscalls/unshare01: Fix special doc
 commment
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

So that it's picked up by docparser and also add [Algorithm] part.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/unshare/unshare01.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/unshare/unshare01.c b/testcases/kernel/syscalls/unshare/unshare01.c
index f4916ba6d..ad26a908d 100644
--- a/testcases/kernel/syscalls/unshare/unshare01.c
+++ b/testcases/kernel/syscalls/unshare/unshare01.c
@@ -4,10 +4,15 @@
  * Ported from Crackerjack to LTP by Manas Kumar Nayak maknayak@in.ibm.com>
  */
 
-/*
+/*\
  * [Description]
  *
  * Basic tests for the unshare() syscall.
+ *
+ * [Algorithm]
+ *
+ * Calls unshare() for different CLONE_* flags in a child process and expects
+ * them to succeed.
  */
 
 #define _GNU_SOURCE
-- 
2.26.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
