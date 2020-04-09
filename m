Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 901371A2F03
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 08:07:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8A4543C2CEB
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 08:07:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 51D163C2CBB
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 08:07:50 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5D568601925
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 08:07:50 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7C811AE63;
 Thu,  9 Apr 2020 06:07:48 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Thu,  9 Apr 2020 08:07:44 +0200
Message-Id: <20200409060745.9619-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] pty04: Use guarded buffers for transmission
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

V2: Simply resend of patch-set with this commit included

 testcases/kernel/pty/pty04.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/pty/pty04.c b/testcases/kernel/pty/pty04.c
index 0273bf902..d730d6834 100644
--- a/testcases/kernel/pty/pty04.c
+++ b/testcases/kernel/pty/pty04.c
@@ -27,6 +27,7 @@
 
 #define _GNU_SOURCE
 #include "tst_test.h"
+#include "tst_buffers.h"
 #include "config.h"
 
 #if defined(HAVE_LINUX_IF_PACKET_H) && defined(HAVE_LINUX_IF_ETHER_H)
@@ -110,7 +111,7 @@ static ssize_t try_write(int fd, char *data, ssize_t size, ssize_t *written)
 
 static void write_pty(void)
 {
-	char *data = SAFE_MALLOC(mtu);
+	char *data = tst_alloc(mtu);
 	ssize_t written, ret;
 
 	memset(data, '_', mtu - 1);
@@ -137,7 +138,7 @@ static void write_pty(void)
 
 	tst_res(TPASS, "Writing to PTY interrupted by hangup");
 
-	free(data);
+	tst_free_all();
 }
 
 static void open_netdev(struct ldisc_info *ldisc)
@@ -203,7 +204,7 @@ static void check_data(const char *data, ssize_t len)
 static void read_netdev(void)
 {
 	int rlen, plen = mtu - 1;
-	char *data = SAFE_MALLOC(plen);
+	char *data = tst_alloc(plen);
 
 	tst_res(TINFO, "Reading from socket %d", sk);
 
@@ -222,7 +223,7 @@ static void read_netdev(void)
 
 	tst_res(TPASS, "Reading data from netdev interrupted by hangup");
 
-	free(data);
+	tst_free_all();
 }
 
 static void do_test(unsigned int n)
-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
