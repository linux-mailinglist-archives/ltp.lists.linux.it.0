Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B4043C471
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Oct 2021 09:56:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 96EE23C687F
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Oct 2021 09:56:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E07763C6806
 for <ltp@lists.linux.it>; Wed, 27 Oct 2021 09:56:31 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id F308E1A019B7
 for <ltp@lists.linux.it>; Wed, 27 Oct 2021 09:56:30 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2543A1FD40;
 Wed, 27 Oct 2021 07:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635321390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=KUTwah5ICE1qt/dZOAVeZb0tc9qzxq10E5wJtLMDZz8=;
 b=d90TtqUJ7e/McXdtdJdRTuSnL3UyFMn6SSTpvrA8U2ynLBkt+lJNRRokT3nBZvpzRutNOE
 5m4wrwB2qW74SU6JBBs3Ijc8kiLMgMoi15dLg7Uo+54iDtsMbI7lHT15QPRRnw4BMW02/W
 pJHNDHnSFmjbuUF+1ji/ZJiKb4RhDIw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635321390;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=KUTwah5ICE1qt/dZOAVeZb0tc9qzxq10E5wJtLMDZz8=;
 b=8C+CwGkBDqzSCosQNrDXlIJYemiq7h1K0OijsTBtEvIWv01/bqw/1yelUo6fcZ+QdILFZ9
 MPNr/5K6HHE6xiAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F02E213FDC;
 Wed, 27 Oct 2021 07:56:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Js8FOS0GeWElfgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 27 Oct 2021 07:56:29 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 27 Oct 2021 09:56:15 +0200
Message-Id: <20211027075615.19832-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/1] ver_linux: Print filesystems
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

both available and mounted.

check for options as aosp toybox does not support -h,
-T option requires IF_FEATURE_HUMAN_READABLE on busybox.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
changes v1->v2:
properly check options

 ver_linux | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/ver_linux b/ver_linux
index 824c39510..82b7468a6 100755
--- a/ver_linux
+++ b/ver_linux
@@ -138,6 +138,21 @@ echo
 echo 'cpuinfo:'
 tst_cmd_run lscpu || cat /proc/cpuinfo
 
+echo
+echo 'available filesystems:'
+echo $(cut -f2 /proc/filesystems | sort -u)
+
+echo
+echo 'mounted filesystems (/proc/mounts):'
+cat /proc/mounts
+
+echo
+echo 'mounted filesystems (df):'
+df_opt=
+if ! (df -h 2>&1 | grep -i -q -e 'unknown option' -e 'invalid option'); then df_opt="$df_opt -h"; fi
+if ! (df -T 2>&1 | grep -i -q -e 'unknown option' -e 'invalid option'); then df_opt="$df_opt -T"; fi
+df $df_opt
+
 echo
 if is_enabled /sys/module/apparmor/parameters/enabled; then
 	echo 'AppArmor enabled'
-- 
2.33.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
