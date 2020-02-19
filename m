Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3C3164085
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 10:37:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3782E3C25EC
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 10:37:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id D2E6E3C003A
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 10:37:17 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2725D1401A32
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 10:37:16 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 93769AF41
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 09:37:16 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 19 Feb 2020 10:37:06 +0100
Message-Id: <20200219093706.9043-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200219093706.9043-1-mdoucha@suse.cz>
References: <20200130144146.20846-1-mdoucha@suse.cz>
 <20200219093706.9043-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v4 4/4] Skip Btrfs in LVM stress tests
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

Delayed file deletion makes stress testing Btrfs on small block devices
difficult. Each test case would require explicit FS cleanup synchronization.
Drop Btrfs tests from LVM runfile for now.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v3: New patch.

 testcases/misc/lvm/generate_lvm_runfile.sh | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/testcases/misc/lvm/generate_lvm_runfile.sh b/testcases/misc/lvm/generate_lvm_runfile.sh
index b5e979e6b..5ca035f22 100755
--- a/testcases/misc/lvm/generate_lvm_runfile.sh
+++ b/testcases/misc/lvm/generate_lvm_runfile.sh
@@ -18,7 +18,10 @@ generate_runfile()
 	echo -n "" >"$OUTFILE"
 
 	for fsname in $FS_LIST; do
-		sed -e "s/{fsname}/$fsname/g" "$INFILE" >>"$OUTFILE"
+		# Btrfs needs too much space for reliable stress testing
+		if [ "x$fsname" != "xbtrfs" ]; then
+			sed -e "s/{fsname}/$fsname/g" "$INFILE" >>"$OUTFILE"
+		fi
 	done
 
 	tst_res TPASS "Runfile $OUTFILE successfully created"
-- 
2.25.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
