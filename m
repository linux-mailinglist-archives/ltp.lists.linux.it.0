Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9A229D140
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Oct 2020 18:11:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A7A2F3C55DF
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Oct 2020 18:11:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 0CB773C20D7
 for <ltp@lists.linux.it>; Wed, 28 Oct 2020 18:11:11 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7B5A4600B09
 for <ltp@lists.linux.it>; Wed, 28 Oct 2020 18:11:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1603905070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=I3kDE5l0QqCXF2/eqDC2qxNkOlarTPyHEitnqaEtIEw=;
 b=DNXJ1xCOT8iR6bWeE1KGhQCVGJmyjBV+eORTe/w+1akihNdiMZ+NZLTv6J5tERqIROVaRD
 eSqfEoASrEs+T5cz8ggiH/y/N7LFs9y4zm1OX4mYyaCa66UK0mn//O/xsXv0SDGrPTfSw8
 N4ipYvzmTKYoQTGZsY60BlV5NyzFjZc=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A6E90AE44;
 Wed, 28 Oct 2020 17:11:10 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Wed, 28 Oct 2020 17:10:56 +0000
Message-Id: <20201028171056.2151-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] pty04: Limit the number of packets sent to avoid
 timeout
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

At the end of the test we transmit many packets while closing the PTY
to check for races in the kernel. However if the process which closes
the PTY is delayed this can result a very large number of packets
being transmitted. The kernel appears to handle this quite slowly
which can cause the test to timeout or even a softlockup.

This is not supposed to be a performance test, so this commit puts an
upper bound on the number of packets transmitted.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---

Hopefully will solve: https://github.com/linux-test-project/ltp/issues/674

 testcases/kernel/pty/pty04.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/pty/pty04.c b/testcases/kernel/pty/pty04.c
index 4adf2cbb7..a59de7830 100644
--- a/testcases/kernel/pty/pty04.c
+++ b/testcases/kernel/pty/pty04.c
@@ -136,7 +136,8 @@ static int open_pty(const struct ldisc_info *ldisc)
 static ssize_t try_write(int fd, const char *data,
 			 ssize_t size, ssize_t *written)
 {
-	ssize_t ret = write(fd, data, size);
+	ssize_t off = written ? *written : 0;
+	ssize_t ret = write(fd, data + off, size);
 
 	if (ret < 0)
 		return -(errno != EAGAIN);
@@ -149,6 +150,7 @@ static void write_pty(const struct ldisc_info *ldisc)
 	char *data;
 	ssize_t written, ret;
 	size_t len = 0;
+	int max_writes = 1000;
 
 	switch (ldisc->n) {
 	case N_SLIP:
@@ -190,7 +192,8 @@ static void write_pty(const struct ldisc_info *ldisc)
 
 	tst_res(TPASS, "Wrote PTY %s %d (2)", ldisc->name, ptmx);
 
-	while (try_write(ptmx, data, len, NULL) >= 0)
+	TST_CHECKPOINT_WAIT2(0, 100000);
+	while (max_writes-- && try_write(ptmx, data, len, NULL) >= 0)
 		;
 
 	tst_res(TPASS, "Writing to PTY interrupted by hangup");
@@ -331,7 +334,7 @@ static void read_netdev(const struct ldisc_info *ldisc)
 	check_data(ldisc, data, plen);
 	tst_res(TPASS, "Read netdev %s %d (2)", ldisc->name, sk);
 
-	TST_CHECKPOINT_WAKE(0);
+	TST_CHECKPOINT_WAKE2(0, 2);
 	while ((rlen = read(sk, data, plen)) > 0)
 		check_data(ldisc, data, rlen);
 
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
