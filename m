Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF80378DE6
	for <lists+linux-ltp@lfdr.de>; Mon, 10 May 2021 15:48:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 69E2C3C6623
	for <lists+linux-ltp@lfdr.de>; Mon, 10 May 2021 15:48:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E71A03C4F6E
 for <ltp@lists.linux.it>; Mon, 10 May 2021 15:48:06 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 55DBB1400C65
 for <ltp@lists.linux.it>; Mon, 10 May 2021 15:48:06 +0200 (CEST)
Received: from 1.general.cascardo.us.vpn ([10.172.70.58]
 helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <cascardo@canonical.com>)
 id 1lg6GS-0002E7-P5; Mon, 10 May 2021 13:48:05 +0000
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: ltp@lists.linux.it
Date: Mon, 10 May 2021 10:47:39 -0300
Message-Id: <20210510134739.37512-1-cascardo@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] mkfs: force block size to 1024 for ext3 and ext4
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

ext3 and ext4 filesystems will reserve at least 1024 blocks for the
journal.  With a blocksize of 4096, this will be 25% of the filesystem size
without accounting for any other overhead.

/etc/mke2fs.conf will use 1024 block size for small filesystems, which are
between 3M and 512M. However, on recent versions of Ubuntu, this
configuration has changed and thet default blocksize is 4096 even for small
filesystems.

Force the blocksize to 1024 on ext3 and ext4 filesystems, which will lead
to the expected results, as journals will take only 1M.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
---
 testcases/commands/mkfs/mkfs01.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/testcases/commands/mkfs/mkfs01.sh b/testcases/commands/mkfs/mkfs01.sh
index 3e3e56719cf3..17c7fb9e4a1a 100755
--- a/testcases/commands/mkfs/mkfs01.sh
+++ b/testcases/commands/mkfs/mkfs01.sh
@@ -96,6 +96,9 @@ mkfs_test()
 	if [ "$fs_type" = "xfs" ] || [ "$fs_type" = "btrfs" ]; then
 		fs_op="$fs_op -f"
 	fi
+	if [ "$fs_type" = "ext3" ] || [ "$fs_type" = "ext4" ]; then
+		fs_op="$fs_op -b 1024"
+	fi
 
 	local mkfs_cmd="mkfs $mkfs_op $fs_op $device $size"
 
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
