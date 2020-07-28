Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9082308C5
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jul 2020 13:33:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DBF243C5DB2
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jul 2020 13:33:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 26B4A3C0488
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 13:33:14 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 6BD45140199E
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 13:33:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595935993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type;
 bh=eNV3NymZvbWJICqfFXsPHY47gx03xUPy8ifq8VjxTX4=;
 b=UzCS1f3L6U2ybqRpodDq9at9y2QG/BtRueMX1ktbh+L2P3a2PDwy31Fbg6JZ11BjX23qj6
 7XsyV8LgacL2uB2cPQXpFyBmVZG/bB64Kj3ZQQsLHGGBM4k0EI51GsRorQNbsDW0SWpTDG
 1z1254ZDd+YlEOGeRm9lSEc5bJ3hmjQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-iwvvFtNQNYuJrvCps9izZw-1; Tue, 28 Jul 2020 07:33:10 -0400
X-MC-Unique: iwvvFtNQNYuJrvCps9izZw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E259558
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 11:33:09 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.40.208.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C54A72ADE
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 11:33:08 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 28 Jul 2020 13:33:03 +0200
Message-Id: <a5b38150d2d496927567ef574610fee6d1fd8dd4.1595935959.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH COMMITTED] thp04: avoid warnings in cleanup()
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

Don't call munmap on read/write_thp when test TCONFs earlier:
  thp04.c:72: CONF: Kernel does not support huge pages
  safe_macros.c:202: WARN: thp04.c:146: munmap((nil),0) failed: EINVAL (22)
  safe_macros.c:202: WARN: thp04.c:147: munmap((nil),0) failed: EINVAL (22)

Successful call to alloc_zero_page() always returns address > 0,
so add a NULL check to cleanup().

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/mem/thp/thp04.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/mem/thp/thp04.c b/testcases/kernel/mem/thp/thp04.c
index d21f77e72de1..e71261c1d986 100644
--- a/testcases/kernel/mem/thp/thp04.c
+++ b/testcases/kernel/mem/thp/thp04.c
@@ -143,8 +143,10 @@ static void cleanup(void)
 	if (writefd >= 0)
 		SAFE_CLOSE(writefd);
 
-	SAFE_MUNMAP(read_thp, thp_size);
-	SAFE_MUNMAP(write_thp, thp_size);
+	if (read_thp)
+		SAFE_MUNMAP(read_thp, thp_size);
+	if (write_thp)
+		SAFE_MUNMAP(write_thp, thp_size);
 }
 
 static struct tst_test test = {
-- 
2.18.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
