Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7DE5456A5
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jun 2022 23:43:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DA8CD3C922F
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jun 2022 23:43:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1F8AF3C03B1
 for <ltp@lists.linux.it>; Thu,  9 Jun 2022 23:42:32 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 398216012B3
 for <ltp@lists.linux.it>; Thu,  9 Jun 2022 23:42:31 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8467122080;
 Thu,  9 Jun 2022 21:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1654810951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2hlxC/7qz3rkqiEMmnuUy2kFg97wCcOEWXRVX3/7MpQ=;
 b=Eg2pN7mNipAkGNH0v/qDyuXDMQOMvsYudPDSko5jEUk9tVSteKTLCvRabHsOvzBSLTrPDm
 rzT4b3sI5d0kCvq/WV0vMs9eAgoE9VQnoG+NffBmKNx7HTa2s4F26zaLdWCefNKrn60nD4
 0Y80FoQs0Hr53QaBUKwq4qOjWZdf9ao=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1654810951;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2hlxC/7qz3rkqiEMmnuUy2kFg97wCcOEWXRVX3/7MpQ=;
 b=gmuKW6KYu2nWa3tAocxR1p7YelLXNHY1koQsJRjTapuWdUk9yrWe673V+03dnhnK5MDH4B
 egAscXyUgfV1CdBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F210813A8C;
 Thu,  9 Jun 2022 21:42:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4CZSOEZpomIQDgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 09 Jun 2022 21:42:30 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  9 Jun 2022 23:42:15 +0200
Message-Id: <20220609214223.4608-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220609214223.4608-1-pvorel@suse.cz>
References: <20220609214223.4608-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/9] tst_test.sh: Add $TST_MOUNT_DEVICE
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
Cc: linux-nfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 doc/shell-test-api.txt    |  2 ++
 testcases/lib/tst_test.sh | 12 +++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/doc/shell-test-api.txt b/doc/shell-test-api.txt
index df5ebbdf0..65444541e 100644
--- a/doc/shell-test-api.txt
+++ b/doc/shell-test-api.txt
@@ -214,6 +214,8 @@ simply by setting right '$TST_FOO'.
                              https://github.com/linux-test-project/ltp/wiki/Shell-Test-API#formatting-device-with-a-filesystem[Formatting device with a filesystem].
 | 'TST_MNT_PARAMS'         | Extra mount params for 'tst_mount', see
                              https://github.com/linux-test-project/ltp/wiki/Shell-Test-API#formatting-device-with-a-filesystem[Formatting device with a filesystem].
+| 'TST_MOUNT_DEVICE'       | Mount device, see
+                             https://github.com/linux-test-project/ltp/wiki/Shell-Test-API#mounting-and-unmounting-filesystems[Mounting and unmounting filesystems].
 | 'TST_NEEDS_ROOT'         | Exit the test with 'TCONF' unless executed under root.
                              Alternatively the 'tst_require_root' command can be used.
 | 'TST_NEEDS_TMPDIR'       | Create test temporary directory and cd into it.
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index c6e0752f3..740115385 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -41,6 +41,10 @@ _tst_do_exit()
 		fi
 	fi
 
+	if [ "$TST_MOUNT_FLAG" = 1 ]; then
+		tst_umount
+	fi
+
 	if [ "$TST_NEEDS_DEVICE" = 1 -a "$TST_DEVICE_FLAG" = 1 ]; then
 		if ! tst_device release "$TST_DEVICE"; then
 			tst_res TWARN "Failed to release device '$TST_DEVICE'"
@@ -632,7 +636,7 @@ tst_run()
 			NET_SKIP_VARIABLE_INIT|NEEDS_CHECKPOINTS);;
 			CHECKPOINT_WAIT|CHECKPOINT_WAKE);;
 			CHECKPOINT_WAKE2|CHECKPOINT_WAKE_AND_WAIT);;
-			DEV_EXTRA_OPTS|DEV_FS_OPTS|FORMAT_DEVICE);;
+			DEV_EXTRA_OPTS|DEV_FS_OPTS|FORMAT_DEVICE|MOUNT_DEVICE);;
 			*) tst_res TWARN "Reserved variable TST_$_tst_i used!";;
 			esac
 		done
@@ -666,6 +670,7 @@ tst_run()
 
 	_tst_setup_timer
 
+	[ "$TST_MOUNT_DEVICE" = 1 ] && TST_FORMAT_DEVICE=1
 	[ "$TST_FORMAT_DEVICE" = 1 ] && TST_NEEDS_DEVICE=1
 	[ "$TST_NEEDS_DEVICE" = 1 ] && TST_NEEDS_TMPDIR=1
 
@@ -702,6 +707,11 @@ tst_run()
 		tst_mkfs $TST_FS_TYPE $TST_DEV_FS_OPTS $TST_DEVICE $TST_DEV_EXTRA_OPTS
 	fi
 
+	if [ "$TST_MOUNT_DEVICE" = 1 ]; then
+		tst_mount
+		TST_MOUNT_FLAG=1
+	fi
+
 	[ -n "$TST_NEEDS_CHECKPOINTS" ] && _tst_init_checkpoints
 
 	if [ -n "$TST_SETUP" ]; then
-- 
2.36.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
