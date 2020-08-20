Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B42CE24BEAC
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 15:30:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 61BB43C5801
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 15:30:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 36C403C13D8
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 15:30:40 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CD601200ACA
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 15:30:39 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 58D5CB608;
 Thu, 20 Aug 2020 13:31:06 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 20 Aug 2020 15:30:32 +0200
Message-Id: <20200820133032.16840-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/1] tst_kvcmp: Strip double quotes when parsing
 /etc/os-release
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

ID is normally without double quotes, e.g.: ID=debian

But at least SLES and openSUSE contain double quotes, e.g.:
ID="opensuse-tumbleweed"

thus optionally strip the double quotes after scanning them.

Fixes: e2e60a39b ("lib/tst_kvercmp: Add support /etc/os-release")

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 lib/tst_kvercmp.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/lib/tst_kvercmp.c b/lib/tst_kvercmp.c
index 185a5c39c..5d56e30b9 100644
--- a/lib/tst_kvercmp.c
+++ b/lib/tst_kvercmp.c
@@ -131,6 +131,7 @@ int tst_kvexcmp(const char *tst_exv, const char *cur_ver)
 const char *tst_kvcmp_distname(const char *kver)
 {
 	static char distname[64];
+	char *ret = distname;
 	char *p = distname;
 
 	if (strstr(kver, ".el5uek"))
@@ -148,12 +149,21 @@ const char *tst_kvcmp_distname(const char *kver)
 	if (access(OSRELEASE_PATH, F_OK) != -1) {
 		SAFE_FILE_LINES_SCANF(NULL, OSRELEASE_PATH, "ID=%s", distname);
 
+		if (p[0] == '"') {
+			ret = distname + 1;
+			p = ret;
+		}
+
 		while (*p) {
+			if (*p == '"') {
+				*p = 0;
+				break;
+			}
 			*p = toupper((unsigned char)*p);
 			p++;
 		}
 
-		return distname;
+		return ret;
 	}
 
 	return NULL;
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
