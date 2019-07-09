Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F0163223
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jul 2019 09:32:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 194AE3C1C68
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jul 2019 09:32:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 3FCC23C07AD
 for <ltp@lists.linux.it>; Tue,  9 Jul 2019 09:32:36 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B9CE4601CE8
 for <ltp@lists.linux.it>; Tue,  9 Jul 2019 09:32:34 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2A1EAAF83;
 Tue,  9 Jul 2019 07:32:33 +0000 (UTC)
From: Christian Amann <camann@suse.com>
To: ltp@lists.linux.it
Date: Tue,  9 Jul 2019 09:32:28 +0200
Message-Id: <20190709073228.18707-1-camann@suse.com>
X-Mailer: git-send-email 2.16.4
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v1] syscalls/ioctl08: Add check for btrfs
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

This test used to fail on systems with missing btrfs support. Now it
ends with TCONF.

Reported-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: Christian Amann <camann@suse.com>
---
 testcases/kernel/syscalls/ioctl/ioctl08.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl08.c b/testcases/kernel/syscalls/ioctl/ioctl08.c
index 8de80048c..c39423b8b 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl08.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl08.c
@@ -112,9 +112,15 @@ static void setup(void)
 			sizeof(struct file_dedupe_range_info));
 }
 
+static const char *kconfigs[] = {
+	"CONFIG_BTRFS_FS",
+	NULL
+};
+
 static struct tst_test test = {
 	.test = verify_ioctl,
 	.tcnt = ARRAY_SIZE(tcases),
+	.needs_kconfigs = kconfigs,
 	.setup = setup,
 	.cleanup = cleanup,
 	.min_kver = "4.5",
-- 
2.16.4


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
