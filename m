Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AB55AB1B8
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Sep 2022 15:38:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 28A3F3CA8FC
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Sep 2022 15:38:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 69E223CA8C5
 for <ltp@lists.linux.it>; Fri,  2 Sep 2022 15:37:19 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7C7A91401135
 for <ltp@lists.linux.it>; Fri,  2 Sep 2022 15:37:18 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1C62D5BF20;
 Fri,  2 Sep 2022 13:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1662125838; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WPEpqDLk5aGzreweBbN1c02gov/YacScr9iicUjMfOY=;
 b=MM5hyFkO+oyul1RhY999nIejneNerpr8i9Ntjq7YBiLMCXL+LCy/9Tsi747fyylBzTZa/j
 JueTpS0tnOXnXihZovLWZK0kboGlR+TO2abTxP9mNZvr5/+1kjMZe4pbtmjmi4/tmrL7qO
 spdVy3+79qlI9N9WNP+VN/vAoDozrUM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1662125838;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WPEpqDLk5aGzreweBbN1c02gov/YacScr9iicUjMfOY=;
 b=/r5rbjX6W5K6MpI+Yb9rIySCTaFa9j7h+E091UBOdkaaPg9z5nsXymm6G4NXc4rRkIEmKM
 LsQ1xYtF6HUs8cDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C32C61330E;
 Fri,  2 Sep 2022 13:37:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oPm/LQ0HEmObBgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 02 Sep 2022 13:37:17 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  2 Sep 2022 15:37:10 +0200
Message-Id: <20220902133710.1785-10-pvorel@suse.cz>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220902133710.1785-1-pvorel@suse.cz>
References: <20220902133710.1785-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v4 9/9] df01.sh: Convert to TST_ALL_FILESYSTEMS=1
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 runtest/commands              |  8 +-------
 runtest/smoketest             |  2 +-
 testcases/commands/df/df01.sh | 32 +++++++++-----------------------
 3 files changed, 11 insertions(+), 31 deletions(-)

diff --git a/runtest/commands b/runtest/commands
index 8cfad0449..5ec2c3b69 100644
--- a/runtest/commands
+++ b/runtest/commands
@@ -14,13 +14,7 @@ ln01_sh ln_tests.sh
 mkdir01_sh mkdir_tests.sh
 mv01_sh mv_tests.sh
 du01_sh du01.sh
-df01_ext2_sh df01.sh -f ext2
-df01_ext3_sh df01.sh -f ext3
-df01_ext4_sh df01.sh -f ext4
-df01_xfs_sh df01.sh -f xfs
-df01_vfat_sh df01.sh -f vfat
-df01_exfat_sh df01.sh -f exfat
-df01_ntfs_sh df01.sh -f ntfs
+df01_sh df01.sh
 mkfs01_sh mkfs01.sh
 mkfs01_ext2_sh mkfs01.sh -f ext2
 mkfs01_ext3_sh mkfs01.sh -f ext3
diff --git a/runtest/smoketest b/runtest/smoketest
index 485f211fb..83eebfe7b 100644
--- a/runtest/smoketest
+++ b/runtest/smoketest
@@ -12,7 +12,7 @@ stat04 symlink01 -T stat04
 utime01A symlink01 -T utime01
 rename01A symlink01 -T rename01
 splice02 splice02 -s 20
-df01_ext4_sh df01.sh -f ext4
+df01_sh df01.sh
 shell_test01 echo "SUCCESS" | shell_pipe01.sh
 ping602 ping02.sh -6
 macsec02 macsec02.sh
diff --git a/testcases/commands/df/df01.sh b/testcases/commands/df/df01.sh
index 1e86d1c40..ddfa9d9a7 100755
--- a/testcases/commands/df/df01.sh
+++ b/testcases/commands/df/df01.sh
@@ -6,35 +6,19 @@
 #
 # Test df command with some basic options.
 
+TST_ALL_FILESYSTEMS=1
 TST_CNT=12
 TST_SETUP=setup
 TST_TESTFUNC=test
-TST_OPTS="f:"
-TST_USAGE=usage
-TST_PARSE_ARGS=parse_args
 TST_NEEDS_ROOT=1
-TST_MOUNT_DEVICE=1
-
-usage()
-{
-	cat << EOF
-usage: $0 [-f <ext2|ext3|ext4|vfat|...>]
-
-OPTIONS
--f	Specify the type of filesystem to be built.  If not
-	specified, the default filesystem type (currently ext2)
-	is used.
-EOF
-}
-
-parse_args()
-{
-	TST_FS_TYPE="$2"
-}
 
 setup()
 {
-	DF_FS_TYPE=$(mount | grep "$TST_DEVICE" | awk 'NR==1{print $5}')
+	DF_FS_TYPE="$TST_FS_TYPE"
+
+	if [ "$TST_FS_TYPE_FUSE" = 1 ]; then
+		DF_FS_TYPE="fuseblk"
+	fi
 }
 
 df_test()
@@ -180,7 +164,9 @@ test11()
 
 test12()
 {
-	local cmd="df -x $DF_FS_TYPE -P"
+	local fs="$DF_FS_TYPE"
+
+	local cmd="df -x $fs -P"
 
 	df_verify $cmd
 	if [ $? -ne 0 ]; then
-- 
2.37.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
