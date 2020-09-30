Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9773027EB5F
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 16:50:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4C5FA3C2A93
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 16:50:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 5C0163C2A08
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 16:50:28 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0CAF4200CF4
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 16:50:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601477427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8kswxEXKJWBB9AhQknR+GXCD/3UeyrSeA3GcivBxyeU=;
 b=pevOsSWhzbnKPFTX3Unk2JqWFCksvZjljs9n8UJ/SCVQlYTxtSGaK1mu+3jcQwNi0k4PuS
 pr4DewMTYMXgGuGLAhjlT2SYrDxqafXWdeNaLt4bhQ20iSktCSfu+EDgCmrHv58vdIXirt
 WxOdE0lNXEjJiqDcrst1331vjYym/5Q=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ACFD0AF80;
 Wed, 30 Sep 2020 14:50:27 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Wed, 30 Sep 2020 15:50:09 +0100
Message-Id: <20200930145009.16260-3-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930145009.16260-1-rpalethorpe@suse.com>
References: <20200930145009.16260-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] eventfd01: Handle no AIO support
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

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 testcases/kernel/syscalls/eventfd/eventfd01.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/testcases/kernel/syscalls/eventfd/eventfd01.c b/testcases/kernel/syscalls/eventfd/eventfd01.c
index e4f9c804a..4d888910b 100644
--- a/testcases/kernel/syscalls/eventfd/eventfd01.c
+++ b/testcases/kernel/syscalls/eventfd/eventfd01.c
@@ -510,6 +510,11 @@ static int trigger_eventfd_overflow(int evfd, int *fd, io_context_t * ctx)
 	ret = io_setup(16, ctx);
 	if (ret < 0) {
 		errno = -ret;
+		if (errno == ENOSYS) {
+			tst_brkm(TCONF | TERRNO, cleanup,
+				 "io_setup(): AIO not supported by kernel");
+		}
+
 		tst_resm(TINFO | TERRNO, "io_setup error");
 		return -1;
 	}
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
