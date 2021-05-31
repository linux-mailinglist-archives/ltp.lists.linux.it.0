Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC92395E16
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 15:53:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D0AF03C9098
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 15:53:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 742713C805F
 for <ltp@lists.linux.it>; Mon, 31 May 2021 15:53:16 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E978D63B7CD
 for <ltp@lists.linux.it>; Mon, 31 May 2021 15:53:15 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2857621920
 for <ltp@lists.linux.it>; Mon, 31 May 2021 13:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622469195; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ypw8k8ewaygl+8a9xjjdJLvYFu1E+OAUPBmcFref5r4=;
 b=Z/DmM6keYacV7aP+zksWao02u98WCmBnT3b3+Yl0/V97bAlAj2SAYu5VTdfj/hx29x0CWD
 nLboDpSa8oVKf/DSDEzcfDzLNsz/CkSf8Z7HdDUyhERMXbLOAHeREzM5eyuH32qJ/h0Yvf
 zMqOJ8M+1KMs9wqexnqR9srCfm/8TOQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622469195;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ypw8k8ewaygl+8a9xjjdJLvYFu1E+OAUPBmcFref5r4=;
 b=oemUaUXMG9vYlwS2GS3/rS/fNs916Uh9OPjdIw5jTo+Lan0L8GrxWijDdzzpL9XCtrdABC
 wdgIlog0B9wfoCCQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id C1ECF118DD
 for <ltp@lists.linux.it>; Mon, 31 May 2021 13:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622469194; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ypw8k8ewaygl+8a9xjjdJLvYFu1E+OAUPBmcFref5r4=;
 b=fSjFCMkPudpMudEtGlHAqa5nkf+rt5gaEPyC92wUj26jpjKb3sXXdOJZQ7gk19HHQym8ZA
 flHR5pPHy041NQUHCCUCHDsRC0PsEvLf77baKnDtFilLzYrb4sIPGfnsjkxkqzPjC/X8vE
 XbHdPE4NnBCg2/b7Lyhif7nPYnCvCqU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622469194;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ypw8k8ewaygl+8a9xjjdJLvYFu1E+OAUPBmcFref5r4=;
 b=TpgdSrvhFRBzPy14TrpB++J+DH7BiDSYEYBbNTyUOycuzGferEq9PBK7qTbHbA5o6rQ6Tj
 8fxCN4fUF553gYDA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id tdOELkrqtGAkagAALh3uQQ (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Mon, 31 May 2021 13:53:14 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 31 May 2021 15:53:13 +0200
Message-Id: <20210531135314.5067-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: imap.suse.de;
	none
X-Spam-Score: 4.00
X-Spamd-Result: default: False [4.00 / 100.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; R_MISSING_CHARSET(2.50)[];
 MIME_GOOD(-0.10)[text/plain]; TO_DN_NONE(0.00)[];
 BROKEN_CONTENT_TYPE(1.50)[];
 PREVIOUSLY_DELIVERED(0.00)[ltp@lists.linux.it];
 RCPT_COUNT_ONE(0.00)[1];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2]
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] network/busy_poll: Fix tests in namespaced env
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/network/busy_poll/busy_poll01.sh | 15 ++++++---------
 testcases/network/busy_poll/busy_poll02.sh |  7 +++----
 testcases/network/busy_poll/busy_poll03.sh |  7 +++----
 3 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/testcases/network/busy_poll/busy_poll01.sh b/testcases/network/busy_poll/busy_poll01.sh
index d306d1be8..0be4c5f96 100755
--- a/testcases/network/busy_poll/busy_poll01.sh
+++ b/testcases/network/busy_poll/busy_poll01.sh
@@ -21,22 +21,19 @@ cleanup()
 set_busy_poll()
 {
 	local value=${1:-"0"}
-	ROD_SILENT sysctl -q -w net.core.busy_read=$value
-	ROD_SILENT sysctl -q -w net.core.busy_poll=$value
-
-	tst_rhost_run -s -c "sysctl -q -w net.core.busy_read=$value"
-	tst_rhost_run -s -c "sysctl -q -w net.core.busy_poll=$value"
+	tst_set_sysctl net.core.busy_read $value safe
+	tst_set_sysctl net.core.busy_poll $value safe
 }
 
 setup()
 {
 	busy_poll_check_config
 
-	busy_read_old="$(cat /proc/sys/net/core/busy_read)"
-	busy_poll_old="$(cat /proc/sys/net/core/busy_poll)"
+	busy_read_old="$(sysctl -n net.core.busy_read)"
+	busy_poll_old="$(sysctl -n net.core.busy_poll)"
 
-	rbusy_read_old=$(tst_rhost_run -c 'cat /proc/sys/net/core/busy_read')
-	rbusy_poll_old=$(tst_rhost_run -c 'cat /proc/sys/net/core/busy_poll')
+	rbusy_read_old=$(tst_rhost_run -c 'sysctl -ne net.core.busy_read')
+	rbusy_poll_old=$(tst_rhost_run -c 'sysctl -ne net.core.busy_poll')
 }
 
 test()
diff --git a/testcases/network/busy_poll/busy_poll02.sh b/testcases/network/busy_poll/busy_poll02.sh
index d02aa7342..ec275bec9 100755
--- a/testcases/network/busy_poll/busy_poll02.sh
+++ b/testcases/network/busy_poll/busy_poll02.sh
@@ -17,16 +17,15 @@ cleanup()
 set_busy_poll()
 {
 	local value=${1:-"0"}
-	ROD_SILENT sysctl -q -w net.core.busy_poll=$value
-	tst_rhost_run -s -c "sysctl -q -w net.core.busy_poll=$value"
+	tst_set_sysctl net.core.busy_poll $value safe
 }
 
 setup()
 {
 	busy_poll_check_config
 
-	busy_poll_old="$(cat /proc/sys/net/core/busy_poll)"
-	rbusy_poll_old=$(tst_rhost_run -c 'cat /proc/sys/net/core/busy_poll')
+	busy_poll_old="$(sysctl -n net.core.busy_poll)"
+	rbusy_poll_old=$(tst_rhost_run -c 'sysctl -ne net.core.busy_poll')
 }
 
 test()
diff --git a/testcases/network/busy_poll/busy_poll03.sh b/testcases/network/busy_poll/busy_poll03.sh
index f6f1ac134..ccdb8308a 100755
--- a/testcases/network/busy_poll/busy_poll03.sh
+++ b/testcases/network/busy_poll/busy_poll03.sh
@@ -19,16 +19,15 @@ cleanup()
 set_busy_poll()
 {
 	local value=${1:-"0"}
-	ROD_SILENT sysctl -q -w net.core.busy_poll=$value
-	tst_rhost_run -s -c "sysctl -q -w net.core.busy_poll=$value"
+	tst_set_sysctl net.core.busy_poll $value safe
 }
 
 setup()
 {
 	busy_poll_check_config
 
-	busy_poll_old="$(cat /proc/sys/net/core/busy_poll)"
-	rbusy_poll_old=$(tst_rhost_run -c 'cat /proc/sys/net/core/busy_poll')
+	busy_poll_old="$(sysctl -n /proc/sys/net/core/busy_poll)"
+	rbusy_poll_old=$(tst_rhost_run -c 'sysctl -ne /proc/sys/net/core/busy_poll')
 }
 
 test()
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
