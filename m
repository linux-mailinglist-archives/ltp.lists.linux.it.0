Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEF543C411
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Oct 2021 09:37:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CA09D3C687E
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Oct 2021 09:37:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2E4AA3C6806
 for <ltp@lists.linux.it>; Wed, 27 Oct 2021 09:37:28 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2949F100170F
 for <ltp@lists.linux.it>; Wed, 27 Oct 2021 09:37:27 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1914921709;
 Wed, 27 Oct 2021 07:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635320247; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=6xVZD0drzRKGouDS4Ie+RbZQ0eitMvtM6hb4/zMBAew=;
 b=kct4B1vwYTrGsSs1NqfbOsTTwyJ9p6Y+1SfuBdSTNl4RIfL8AdPCT0RHUvTn9OxgZDus/G
 v8DfhvAaOmPs9FtxVfUNXoz5WvmjxysZWfr4BGMApzpXv/ffabRXBHQ50hcpCLeW5pU4cK
 pzjoR9tO77M0vAk9solQtYmOs0rThkU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635320247;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=6xVZD0drzRKGouDS4Ie+RbZQ0eitMvtM6hb4/zMBAew=;
 b=4aSTqUnPLFNBGKsiuZ95NCkjxWjilp1b/DBbKK7JrgfCv4uR4a4HFuGd15TwGNJsYTC9NK
 LfJzngKGq+/ttsAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E7BED13FE6;
 Wed, 27 Oct 2021 07:37:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pn2NNrYBeWGWdQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 27 Oct 2021 07:37:26 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 27 Oct 2021 09:37:19 +0200
Message-Id: <20211027073719.15922-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] ver_linux: Print filesystems
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

-T option is not implemented on all df implementations
(on busybox only with IF_FEATURE_HUMAN_READABLE, also aosp toybox does
not support it), thus fallback without it.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 ver_linux | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/ver_linux b/ver_linux
index 824c39510..abaa30a4c 100755
--- a/ver_linux
+++ b/ver_linux
@@ -138,6 +138,18 @@ echo
 echo 'cpuinfo:'
 tst_cmd_run lscpu || cat /proc/cpuinfo
 
+echo
+echo 'available filesystems:'
+echo $(cut -f2 -d$'\t' /proc/filesystems | sort -u)
+
+echo
+echo 'mounted filesystems (/proc/mounts):'
+cat /proc/mounts
+
+echo
+echo 'mounted filesystems (df):'
+df -hT 2>/dev/null || df -h
+
 echo
 if is_enabled /sys/module/apparmor/parameters/enabled; then
 	echo 'AppArmor enabled'
-- 
2.33.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
