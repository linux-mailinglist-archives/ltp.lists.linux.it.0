Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5582224B448
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 12:02:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F35C93C2FA0
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 12:02:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id BCB863C2F8F
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 12:02:47 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B868B1A011CE
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 12:02:46 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 295BBAD33;
 Thu, 20 Aug 2020 10:03:13 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 20 Aug 2020 12:02:38 +0200
Message-Id: <20200820100238.15925-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] tst_kvcmp: Fix parsing format for /etc/os-release
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
Cc: Po-Hsu Lin <po-hsu.lin@canonical.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

We need to strip double quotes.
Also for openSUSE Tumbleweed, which contains ID="opensuse-tumbleweed"
it "\"%s\"" does not remove trailing double quote, thus match all but
double quote.

Fixes: e2e60a39b ("lib/tst_kvercmp: Add support /etc/os-release")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 lib/tst_kvercmp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/tst_kvercmp.c b/lib/tst_kvercmp.c
index 185a5c39c..7e980e076 100644
--- a/lib/tst_kvercmp.c
+++ b/lib/tst_kvercmp.c
@@ -146,7 +146,8 @@ const char *tst_kvcmp_distname(const char *kver)
 		return "RHEL6";
 
 	if (access(OSRELEASE_PATH, F_OK) != -1) {
-		SAFE_FILE_LINES_SCANF(NULL, OSRELEASE_PATH, "ID=%s", distname);
+		SAFE_FILE_LINES_SCANF(NULL, OSRELEASE_PATH, "ID=\"%[^\"]\"",
+				      distname);
 
 		while (*p) {
 			*p = toupper((unsigned char)*p);
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
