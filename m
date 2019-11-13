Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8110DFB941
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 20:58:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C51E3C22A3
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 20:58:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 07AE93C2022
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 20:58:55 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 46CA31A0116B
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 20:58:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573675132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cis1gt23Rc0JrJEyXXrkRn1EJZNnD1PrEYKSnAd17Io=;
 b=Jrz9HKN52RgkpAmo/acaiD+eWWXIHM5vUICAkWHPlMn6S0dQONQ6j0yIA7i+s1iOfRk7zE
 dclYvdOQq0rmTzQ1W1SPWOAlr6jvDCM3bJi2dQSC9LTEMNgbuftswSqc2l9h3u35rdSDeD
 C7P5GP+5pSrKgp1jV/ynVZPeGfpdy7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-hkiw3-zoNNun7JIe0lBeUQ-1; Wed, 13 Nov 2019 14:58:51 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69CB218B5F72
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 19:58:50 +0000 (UTC)
Received: from dustball.usersys.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4EB881766
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 19:58:49 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Wed, 13 Nov 2019 20:58:38 +0100
Message-Id: <51aabb2e4680d830b5ba7b7623e0c7697bcb6338.1573675056.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: hkiw3-zoNNun7JIe0lBeUQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] mbind04: terminate child processes
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

verify_policy() forks a child, which continues to run
pass end of function and into same loop in verify_mbind()
as parent, effectively creating fork bomb. With 2 nodes,
there's 45 forked children. With 4 nodes, 765 processes.

Terminate child process at the end of verify_policy();

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/syscalls/mbind/mbind04.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/mbind/mbind04.c b/testcases/kernel/syscalls/mbind/mbind04.c
index 6a7a2a2321a8..aaad8a988bad 100644
--- a/testcases/kernel/syscalls/mbind/mbind04.c
+++ b/testcases/kernel/syscalls/mbind/mbind04.c
@@ -47,6 +47,7 @@ static void verify_policy(unsigned int node, int mode, unsigned flag)
 	struct bitmask *bm = numa_allocate_nodemask();
 	unsigned int i;
 	void *ptr;
+	pid_t child;
 	unsigned long size = PAGES_ALLOCATED * page_size;
 
 	numa_bitmask_setbit(bm, node);
@@ -69,7 +70,8 @@ static void verify_policy(unsigned int node, int mode, unsigned flag)
 
 	const char *prefix = "child: ";
 
-	if (SAFE_FORK()) {
+	child = SAFE_FORK();
+	if (child) {
 		prefix = "parent: ";
 		tst_reap_children();
 	}
@@ -104,6 +106,9 @@ static void verify_policy(unsigned int node, int mode, unsigned flag)
 
 	if (fail)
 		tst_nodemap_print_counters(nodes);
+
+	if (!child)
+		exit(0);
 }
 
 static const int modes[] = {
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
