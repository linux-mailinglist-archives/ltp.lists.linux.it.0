Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 805FC203478
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 12:05:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 997143C227B
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 12:05:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 950B03C1D32
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 12:05:14 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 225131A01531
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 12:05:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592820312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kp2x0ewPU8DBDfeMyGmXz7kYiSgQ3M6eqdIY5aPck08=;
 b=AQpKjGH0c4xNBoRKY0T5MLAALdowpxMd6WHQePPTTy0uqeNO97ayXeZQ1My4wCg2r2cCYS
 od0OlGwhB3YpuTVXakL8YAxTDSpRk+XgmHldgRyuammp/NJwcht4reXdFjMU2ZQBlo5KYr
 rTuShxh6xLztMGq0KVysphztclTOx+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-VB4h3SKLOS2p5qEafFSfoA-1; Mon, 22 Jun 2020 06:05:10 -0400
X-MC-Unique: VB4h3SKLOS2p5qEafFSfoA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB03E835B42;
 Mon, 22 Jun 2020 10:05:09 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9AD605D9E8;
 Mon, 22 Jun 2020 10:05:08 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it,
	pvorel@suse.com
Date: Mon, 22 Jun 2020 18:05:06 +0800
Message-Id: <20200622100506.4285-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2] tst_cgroup: fix tst_cgroup_version to cover more
 situations
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

  * system doesn't support any cgroup(v1, v2): TCONF
  * system only support cgroup v1: choose v1
  * system only support cgroup v2: choose v2
  * system support v1 & v2 but mounting v1: chosse v1
  * systep support v1 & v2 but mounting v2: choose v2

Signed-off-by: Li Wang <liwang@redhat.com>
---
 lib/tst_cgroup.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
index 0118dd7b2..010baa69e 100644
--- a/lib/tst_cgroup.c
+++ b/lib/tst_cgroup.c
@@ -38,18 +38,19 @@ static int tst_cgroup_check(const char *cgroup)
 
 enum tst_cgroup_ver tst_cgroup_version(void)
 {
-	if (tst_cgroup_check("cgroup2")) {
-		if (!tst_is_mounted("cgroup2") && tst_is_mounted("cgroup"))
-			return TST_CGROUP_V1;
-		else
-			return TST_CGROUP_V2;
-	}
+	enum tst_cgroup_ver cg_ver;
 
 	if (tst_cgroup_check("cgroup"))
-		return TST_CGROUP_V1;
+		cg_ver = TST_CGROUP_V1;
+
+	if (tst_cgroup_check("cgroup2"))
+		if (!cg_ver || tst_is_mounted("cgroup2"))
+			cg_ver = TST_CGROUP_V2;
+
+	if (!cg_ver)
+		tst_brk(TCONF, "Cgroup is not configured");
 
-	tst_brk(TCONF, "Cgroup is not configured");
-	return TST_CGROUP_V1; /* fix -Werror=return-type */
+	return cg_ver;
 }
 
 static void tst_cgroup1_mount(const char *name, const char *option,
-- 
2.21.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
