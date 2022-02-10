Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCB04B12B6
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Feb 2022 17:27:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2FDDF3C9EB1
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Feb 2022 17:27:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1EB513C9D96
 for <ltp@lists.linux.it>; Thu, 10 Feb 2022 17:27:44 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 954C61A006FF
 for <ltp@lists.linux.it>; Thu, 10 Feb 2022 17:27:44 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 374721F3A1;
 Thu, 10 Feb 2022 16:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1644510464; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MBOqxgJVYPCwTy0ok/lgnViBhH629DPKX2MPJvVscn8=;
 b=oEd1nhtLLJIOZZD8Jock6cb+WiJm/vsCucpPsZYeobP0AQsjzmcUMcEhJ1Ta8IbUZpe53Z
 NAYzbPZsAZhJGCi0VLmV8LIo3k5bTh0ffM7SaLbida2JzmCvqTa1gGX/4sviJukZX3uZo4
 dOZol5crKtQL83Fm4fIxw6BW8ESLEoo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1644510464;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MBOqxgJVYPCwTy0ok/lgnViBhH629DPKX2MPJvVscn8=;
 b=UB+ZDmOsVQwlags//k4AJjV0/PTZvv0Ywjs8EUMiRaEdeetfGphhv1VSoVE6krAPddun4P
 QUu5L0uwAWmpUdCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ED41013BC1;
 Thu, 10 Feb 2022 16:27:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iDN1OP88BWJAMgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 10 Feb 2022 16:27:43 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 10 Feb 2022 17:27:35 +0100
Message-Id: <20220210162739.30159-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220210162739.30159-1-pvorel@suse.cz>
References: <20220210162739.30159-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/6] tst_test.sh: Redesing tst_mkfs() API
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

the goal is to add support for extra opts after device name
(e.g. size) - to sync with C API.

But instead adding new variable for extra opts we specify only
$fs_type and the rest of args we just pass to the mkfs.* command.
Still keep $TST_FS_TYPE and $TST_DEVICE as a default when no parameters
are passed.

NOTE: not adding it to legacy shell API (thus no need to change
test_robind.sh).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_test.sh | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index fa4c90f787..64e65f9f53 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -342,19 +342,21 @@ tst_umount()
 tst_mkfs()
 {
 	local fs_type=${1:-$TST_FS_TYPE}
-	local device=${2:-$TST_DEVICE}
 	[ $# -ge 1 ] && shift
-	[ $# -ge 1 ] && shift
-	local fs_opts="$@"
 
-	if [ -z "$device" ]; then
-		tst_brk TBROK "No device specified"
+	local opts="$@"
+
+	if [ -z "$opts" ]; then
+		if [ "$TST_NEEDS_DEVICE" != 1 ]; then
+			tst_brk "Using default parameters in tst_mkfs requires TST_NEEDS_DEVICE=1"
+		fi
+		opts="$TST_DEVICE"
 	fi
 
 	tst_require_cmds mkfs.$fs_type
 
-	tst_res TINFO "Formatting $device with $fs_type extra opts='$fs_opts'"
-	ROD_SILENT mkfs.$fs_type $fs_opts $device
+	tst_res TINFO "Formatting $fs_type with opts='$opts'"
+	ROD_SILENT mkfs.$fs_type $opts
 }
 
 # Detect whether running under hypervisor: Microsoft Hyper-V
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
