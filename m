Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F541CF8CA
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 17:17:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D8F7D3C5565
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 17:17:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id A17633C209F
 for <ltp@lists.linux.it>; Tue, 12 May 2020 17:17:03 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6DBE410007AC
 for <ltp@lists.linux.it>; Tue, 12 May 2020 17:17:03 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DAC1EB03E
 for <ltp@lists.linux.it>; Tue, 12 May 2020 15:17:05 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 12 May 2020 17:17:29 +0200
Message-Id: <20200512151730.10201-2-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512151730.10201-1-chrubis@suse.cz>
References: <20200512151730.10201-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] [COMMITTED] lib: Fix two sprintf() warnings.
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

tst_test.c: In function 'do_setup':
tst_test.c:69:21: warning: '%s' directive writing up to 1023 bytes into a region of size 1011 [-Wformat-overflow=]

tst_kconfig.c: In function 'tst_kconfig_read':
tst_kconfig.c:67:37: warning: '%s' directive output may be truncated writing up to 1023 bytes into a region of size 1018 [-Wformat-truncation=]

The buffer that we print the path along with variable name has to be
bigger than the path obviously.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 lib/tst_kconfig.c | 2 +-
 lib/tst_test.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/tst_kconfig.c b/lib/tst_kconfig.c
index 4b51413e5..d49187b6f 100644
--- a/lib/tst_kconfig.c
+++ b/lib/tst_kconfig.c
@@ -52,7 +52,7 @@ static char is_gzip;
 static FILE *open_kconfig(void)
 {
 	FILE *fp;
-	char buf[1024];
+	char buf[1064];
 	char path_buf[1024];
 	const char *path = kconfig_path(path_buf, sizeof(path_buf));
 
diff --git a/lib/tst_test.c b/lib/tst_test.c
index 64cd3ac33..0e58060e0 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -68,7 +68,7 @@ extern unsigned int tst_max_futexes;
 
 #define IPC_ENV_VAR "LTP_IPC_PATH"
 
-static char ipc_path[1024];
+static char ipc_path[1064];
 const char *tst_ipc_path = ipc_path;
 
 static char shm_path[1024];
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
