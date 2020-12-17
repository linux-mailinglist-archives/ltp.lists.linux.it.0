Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C372DCDF1
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 09:59:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5FADD3C57C8
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 09:59:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 216713C29E5
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 09:58:56 +0100 (CET)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 478181000CC1
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 09:58:55 +0100 (CET)
X-Originating-IP: 78.113.208.212
Received: from localhost.localdomain (212.208.113.78.rev.sfr.net
 [78.113.208.212]) (Authenticated sender: kory.maincent@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 74BD240013;
 Thu, 17 Dec 2020 08:58:54 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: ltp@lists.linux.it
Date: Thu, 17 Dec 2020 09:58:52 +0100
Message-Id: <20201217085852.26032-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] fastopen: add require to sch_netem driver
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
Cc: thomas.petazzoni@bootlin.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 testcases/network/tcp_fastopen/tcp_fastopen_run.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/network/tcp_fastopen/tcp_fastopen_run.sh b/testcases/network/tcp_fastopen/tcp_fastopen_run.sh
index fb2cb8fc2..0e59ed506 100755
--- a/testcases/network/tcp_fastopen/tcp_fastopen_run.sh
+++ b/testcases/network/tcp_fastopen/tcp_fastopen_run.sh
@@ -11,6 +11,7 @@ TST_MIN_KVER="3.7"
 TST_NEEDS_TMPDIR=1
 TST_NEEDS_ROOT=1
 TST_NEEDS_CMDS="tc"
+TST_NEEDS_DRIVERS="sch_netem"
 TST_OPTS="R:"
 TST_USAGE=tcp_fastopen_usage
 TST_PARSE_ARGS=tcp_fastopen_parse_args
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
