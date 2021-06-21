Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9455F3AE6B1
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 12:04:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 668213C702D
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 12:04:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 852373C1A9C
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 12:04:04 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C8576600856
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 12:04:03 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id C6EDC9F7FD;
 Mon, 21 Jun 2021 10:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1624269842; bh=cMnX7sTnXxbhjg4KR5ZHCd1KSfSrsCaftQSQrRbgV/0=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=hE/O6kKMBmk+A/K8sczW1I909TSMJcNvxHjw2rT6UildyI1fdXM/WYGWGfkS2i5eO
 5Lm/8essMJFFglr2Jt64NClkYb98QJ2IIIEzjgsKyqZ4lTRu3abKZ0cXg3yOqqVlLy
 7S6Dv7/z7sRcnVS8MuH4hO/26u2PAozRe0C/phe4=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	aleksei.kodanev@bell-sw.com,
	pvorel@suse.cz
Date: Mon, 21 Jun 2021 12:03:42 +0200
Message-Id: <20210621100342.4060942-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] ssh-stress: Add hostkey generation
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

If not specified, default host keys (in /etc/ssh) are used.
If the keys do not exist, the test will fail or sshd will try to
create the keys in the default location.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 testcases/network/stress/ssh/ssh-stress.sh | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/testcases/network/stress/ssh/ssh-stress.sh b/testcases/network/stress/ssh/ssh-stress.sh
index 997ad21db..baf1a7896 100755
--- a/testcases/network/stress/ssh/ssh-stress.sh
+++ b/testcases/network/stress/ssh/ssh-stress.sh
@@ -11,7 +11,7 @@ TST_TESTFUNC="test"
 TST_CNT=3
 TST_NEEDS_ROOT=1
 TST_NEEDS_TMPDIR=1
-TST_NEEDS_CMDS="sshd ssh od pkill pgrep"
+TST_NEEDS_CMDS="sshd ssh ssh-keygen od pkill pgrep"
 
 . tst_net.sh
 
@@ -56,8 +56,15 @@ TCPKeepAlive yes
 UseDNS no
 StrictModes no
 PidFile $TST_TMPDIR/sshd.pid
+HostKey $TST_TMPDIR/ssh_host_rsa_key
+HostKey $TST_TMPDIR/ssh_host_ecdsa_key
+HostKey $TST_TMPDIR/ssh_host_ed25519_key
 EOF
 
+	ssh-keygen -q -N "" -t rsa -b 4096 -f $TST_TMPDIR/ssh_host_rsa_key
+	ssh-keygen -q -N "" -t ecdsa -f $TST_TMPDIR/ssh_host_ecdsa_key
+	ssh-keygen -q -N "" -t ed25519 -f $TST_TMPDIR/ssh_host_ed25519_key
+
 	tst_res TINFO "Generate configuration file and key at the remote host"
 	tst_rhost_run -s -c "ssh-keygen -t rsa -N \"\" -f $TST_TMPDIR/id_rsa \
 		>/dev/null"
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
