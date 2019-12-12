Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD18011CD45
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Dec 2019 13:35:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6FFF83C2353
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Dec 2019 13:35:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 8E47D3C2216
 for <ltp@lists.linux.it>; Thu, 12 Dec 2019 13:35:15 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id A4819140144E
 for <ltp@lists.linux.it>; Thu, 12 Dec 2019 13:35:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576154112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=or5gocY0oDfNJd1dZrT3V5lw3F5mCDt41qFRwjSbIwc=;
 b=M3bQJEbk5eY1Y7+qd425wLQLwC3I2r9+nf83ABeTspKqZ3x0PGmlhLjcAguAVsTMGVYvFn
 nVzTTJQdv7HLs59c9nTnDjZ2qE+q2sqOAlhpsBjv1BG5munI5aaRIfpV47h8e+1UchX9NE
 96gvnTCrV7OxQb5kzbSDAdQX8k1inTY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-3bVZfm9APOmjdbomMfzIDg-1; Thu, 12 Dec 2019 07:35:11 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CBA2800D4E
 for <ltp@lists.linux.it>; Thu, 12 Dec 2019 12:35:10 +0000 (UTC)
Received: from dustball.usersys.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A3FF5D9C9;
 Thu, 12 Dec 2019 12:35:09 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Thu, 12 Dec 2019 13:35:03 +0100
Message-Id: <cd51199b87580a138fa9c7669e61bdb7611ab204.1576154034.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 3bVZfm9APOmjdbomMfzIDg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] statx07: add fsid= to exports
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

Not all filesystems are stored on devices, and not all filesystems
have UUIDs. tmpfs is one of them, which lead to test failing:
    /tmp/XRzHSG/server requires fsid= for NFS export

Fixes: #622
Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/syscalls/statx/statx07.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/statx/statx07.c b/testcases/kernel/syscalls/statx/statx07.c
index 997e81ad843a..a18f253bc7d4 100644
--- a/testcases/kernel/syscalls/statx/statx07.c
+++ b/testcases/kernel/syscalls/statx/statx07.c
@@ -133,8 +133,8 @@ static void setup(void)
 	snprintf(server_path, sizeof(server_path), ":%s/%s", cwd, SERV_PATH);
 
 	snprintf(cmd, sizeof(cmd),
-		 "exportfs -i -o no_root_squash,rw,sync,no_subtree_check *%.1024s",
-		 server_path);
+		 "exportfs -i -o no_root_squash,rw,sync,no_subtree_check,fsid=%d *%.1024s",
+		 getpid(), server_path);
 	exported = 1;
 
 	ret = tst_system(cmd);
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
