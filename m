Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D95D73FC450
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 11:00:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3B69D3C9A57
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 11:00:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1F10C3C2A3D
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 11:00:12 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9544C1400DB4
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 11:00:12 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id BFBDDA076E;
 Tue, 31 Aug 2021 09:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1630400411; bh=zdXcWeKn0Sx974d4zvL8EHx3zYUPGH9rxAHUhPjraLk=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=TbGOJUet1S7F/3yE18C8GNrT9sUU7XIjzb7UHfOOQ+Czu1XzhcAmOoQVFyrlNqhAO
 tbSmNkEWc/s0H+I0d9XT8o/Jut1XqAgBGRTM5zwZJ++x7kP5rPIBBOR4XnzQEFZN0R
 NYqPzxIv9/hIZVCsX6t1wwaWCqhELstaXLdBvHIk=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	rpalethorpe@suse.com
Date: Tue, 31 Aug 2021 11:00:02 +0200
Message-Id: <20210831090002.1431298-2-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831090002.1431298-1-lkml@jv-coder.de>
References: <20210831090002.1431298-1-lkml@jv-coder.de>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 2/2] cfs_bandwidth01: Add misssing needs_kconfigs
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

The test requires CONFIG_CFS_BANDWIDTH, otherwise it fails with
cfs_bandwidth01.c:51: TBROK: openat(13</sys/fs/cgroup/cpu,cpuacct/ltp/test-5666/level2/level3a/worker1>, 'cpu.cfs_period_us', O_WRONLY): ENOENT (2)

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c b/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c
index e8032d65a..001fb2685 100644
--- a/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c
+++ b/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c
@@ -178,6 +178,10 @@ static struct tst_test test = {
 	.forks_child = 1,
 	.needs_checkpoints = 1,
 	.taint_check = TST_TAINT_W | TST_TAINT_D,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_CFS_BANDWIDTH",
+		NULL
+	},
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "39f23ce07b93"},
 		{"linux-git", "b34cb07dde7c"},
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
