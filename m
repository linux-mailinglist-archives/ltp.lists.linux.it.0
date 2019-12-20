Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3C01277E2
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Dec 2019 10:19:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2280E3C209F
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Dec 2019 10:19:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id CCD883C147F
 for <ltp@lists.linux.it>; Fri, 20 Dec 2019 10:19:02 +0100 (CET)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 60AF11A0BC4C
 for <ltp@lists.linux.it>; Fri, 20 Dec 2019 10:19:00 +0100 (CET)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Dec 2019 01:18:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,335,1571727600"; d="scan'208";a="267480040"
Received: from xpf-desktop.sh.intel.com ([10.239.13.102])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Dec 2019 01:18:57 -0800
From: Pengfei Xu <pengfei.xu@intel.com>
To: ltp <ltp@lists.linux.it>, Pengfei Xu <pengfei.xu@intel.com>,
 Neri Ricardo <ricardo.neri@intel.com>, Su Heng <heng.su@intel.com>,
 Kasten Robert <robert.a.kasten@intel.com>, Cyril Hrubis <chrubis@suse.cz>
Date: Fri, 20 Dec 2019 17:25:26 +0800
Message-Id: <20191220092529.3239-1-pengfei.xu@intel.com>
X-Mailer: git-send-email 2.14.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v5 1/4] lib/tst_kconfig.c: add any kconfig with or
 without expected value function
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Example: CONFIG_X86_INTEL_UMIP=y for umip kconfig before and v5.4
           mainline kernel.
         CONFIG_X86_UMIP=y for umip kconfig after v5.5 mainline kernel.
Format: CONFIG_X86_INTEL_UMIP|CONFIG_X86_UMIP=y
        CONFIG_X86_INTEL_UMIP|CONFIG_X86_UMIP|NA

Signed-off-by: Pengfei Xu <pengfei.xu@intel.com>
---
 lib/tst_kconfig.c | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/lib/tst_kconfig.c b/lib/tst_kconfig.c
index 4b51413e5..ac553b91e 100644
--- a/lib/tst_kconfig.c
+++ b/lib/tst_kconfig.c
@@ -167,7 +167,8 @@ void tst_kconfig_read(const char *const *kconfigs,
 	struct match matches[cnt];
 	FILE *fp;
 	unsigned int i, j;
-	char buf[1024];
+	char buf[1024], kconfig_multi[100];
+	char *kconfig_token = NULL, *p_left = NULL;
 
 	for (i = 0; i < cnt; i++) {
 		const char *val = strchr(kconfigs[i], '=');
@@ -176,12 +177,9 @@ void tst_kconfig_read(const char *const *kconfigs,
 			tst_brk(TBROK, "Invalid config string '%s'", kconfigs[i]);
 
 		matches[i].match = 0;
-		matches[i].len = strlen(kconfigs[i]);
 
-		if (val) {
+		if (val)
 			matches[i].val = val + 1;
-			matches[i].len -= strlen(val);
-		}
 
 		results[i].match = 0;
 		results[i].value = NULL;
@@ -193,17 +191,29 @@ void tst_kconfig_read(const char *const *kconfigs,
 
 	while (fgets(buf, sizeof(buf), fp)) {
 		for (i = 0; i < cnt; i++) {
-			if (match(&matches[i], kconfigs[i], &results[i], buf)) {
-				for (j = 0; j < cnt; j++) {
-					if (matches[j].match)
-						break;
+			memset(kconfig_multi, 0, sizeof(kconfig_multi));
+			/* strtok_r will split kconfigs[i] to multi string, so copy it */
+			memcpy(kconfig_multi, kconfigs[i], strlen(kconfigs[i]));
+			kconfig_token = strtok_r(kconfig_multi, "|=", &p_left);
+
+			while (kconfig_token != NULL) {
+				if (strncmp("CONFIG_", kconfig_token, 7))
+					tst_brk(TBROK, "Invalid config string '%s'", kconfig_token);
+				matches[i].len = strlen(kconfig_token);
+				if (match(&matches[i], kconfig_token, &results[i], buf)) {
+					for (j = 0; j < cnt; j++) {
+						if (matches[j].match)
+							break;
+					}
+					if (j == cnt)
+						goto exit;
 				}
-
-				if (j == cnt)
-					goto exit;
+				kconfig_token = strtok_r(NULL, "|=", &p_left);
+				/* avoid to use after "=" string */
+				if (strlen(p_left) == 0)
+					break;
 			}
 		}
-
 	}
 
 exit:
-- 
2.14.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
