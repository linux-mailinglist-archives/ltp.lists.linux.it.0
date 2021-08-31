Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 100DF3FC44F
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 11:00:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C0B7F3C2A8C
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 11:00:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1322F3C2A05
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 11:00:12 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5D1C86008F6
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 11:00:12 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 0AE409F66D;
 Tue, 31 Aug 2021 09:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1630400411; bh=hSG5n6PJGBk9gm6bOMqwxb5ZJWR2eY/mNocQUptm+0U=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=t0yF3lXKOGtm1ZqWuRV7HXYLiselecwhndG/BCpPXQ7cDhBUZ4TacQOx5Lwlb6uSv
 JBDhVxKnuqYFH6vw++2rsZg7YHJv7IE12Aw0cFiSQsUJ2g+ovoLFP+Yjghs0dDP5Et
 KwDWTbRa6EZNGFG/avZz6GehO0MSd/9r9R5Ab9xE=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	rpalethorpe@suse.com
Date: Tue, 31 Aug 2021 11:00:01 +0200
Message-Id: <20210831090002.1431298-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 1/2] cfs_bandwidth01: Fix cleanup on failure in
 set_cpu_quota
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

If set_cpu_quota failed, mk_cpu_cgroup did not return
and cg_workers[n] was not set. This lead to a failure during
cleanup, because the worker cgroups were not deleted.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 .../sched/cfs-scheduler/cfs_bandwidth01.c       | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c b/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c
index 9301ee458..e8032d65a 100644
--- a/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c
+++ b/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c
@@ -57,17 +57,14 @@ static void set_cpu_quota(const struct tst_cgroup_group *const cg,
 		tst_cgroup_group_name(cg), quota_us, period_us);
 }
 
-static struct tst_cgroup_group *
-mk_cpu_cgroup(const struct tst_cgroup_group *const cg_parent,
+static void mk_cpu_cgroup(struct tst_cgroup_group **cg,
+          const struct tst_cgroup_group *const cg_parent,
 	      const char *const cg_child_name,
 	      const float quota_percent)
 {
-	struct tst_cgroup_group *const cg =
-		tst_cgroup_group_mk(cg_parent, cg_child_name);
+	*cg = tst_cgroup_group_mk(cg_parent, cg_child_name);
 
-	set_cpu_quota(cg, quota_percent);
-
-	return cg;
+	set_cpu_quota(*cg, quota_percent);
 }
 
 static void busy_loop(const unsigned int sleep_ms)
@@ -142,11 +139,11 @@ static void setup(void)
 	cg_level2 = tst_cgroup_group_mk(cg_test, "level2");
 
 	cg_level3a = tst_cgroup_group_mk(cg_level2, "level3a");
-	cg_workers[0] = mk_cpu_cgroup(cg_level3a, "worker1", 30);
-	cg_workers[1] = mk_cpu_cgroup(cg_level3a, "worker2", 20);
+	mk_cpu_cgroup(&cg_workers[0], cg_level3a, "worker1", 30);
+	mk_cpu_cgroup(&cg_workers[1], cg_level3a, "worker2", 20);
 
 	cg_level3b = tst_cgroup_group_mk(cg_level2, "level3b");
-	cg_workers[2] = mk_cpu_cgroup(cg_level3b, "worker3", 30);
+	mk_cpu_cgroup(&cg_workers[2], cg_level3b, "worker3", 30);
 }
 
 static void cleanup(void)
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
