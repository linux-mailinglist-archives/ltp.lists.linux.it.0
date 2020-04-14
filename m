Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB541A76C8
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Apr 2020 11:00:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E5E223C2B64
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Apr 2020 11:00:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id B52433C2B5E
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 10:59:57 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 12D69600635
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 10:59:56 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 26589AC65
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 08:59:55 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 14 Apr 2020 10:59:34 +0200
Message-Id: <20200414085934.8840-3-mdoucha@suse.cz>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200414085934.8840-1-mdoucha@suse.cz>
References: <20200414085934.8840-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v5 3/3] Skip Btrfs in LVM stress tests
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
Changes since v4: Rebase only.

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
2.26.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
