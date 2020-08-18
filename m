Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FE024827D
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Aug 2020 12:04:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 91E763C5884
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Aug 2020 12:04:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 08EC53C5886
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 12:04:43 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 39F021401656
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 12:04:40 +0200 (CEST)
Received: from mail-pg1-f197.google.com ([209.85.215.197])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1k7yTv-0000A3-3V
 for ltp@lists.linux.it; Tue, 18 Aug 2020 10:04:39 +0000
Received: by mail-pg1-f197.google.com with SMTP id n32so11877186pgb.22
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 03:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PyG0lzRclc4VKQA43T6MfcEMsIvtfLV8g1xxdlLWSNg=;
 b=WKwi2aUiyUVHYlxIRY1nPBTu6eB4a0enXKbqsILyGrv9LrJEfx35hg0v852ycNdwmz
 4jXUDTjsCWOi6wsPxnDWGzOPLtSAdP83NqNB8ZhVlupbKggl3DFa33wn93/+4ZbyO2fz
 Utk7Srz1OUvlju1+hDOT9qDq1Vv/5Mo1TLY8mgC2BJ3XEFQBW20TdmISl8LLQhzW1qLp
 HiZhFCC7QuXe3mAcNG6PodSMlzg9kk0PuYvXucv5lvJX6irWrP2ruPiDQjA11/cAKAPu
 oqm8/3iRU042y/EeDOObpdRrG02VpZl3inpzUXPevnyofLzzBHsEkgjZXkgKVOZpI6TG
 KiAA==
X-Gm-Message-State: AOAM532BiDvqCdsTefEpvjF9NWrGK2rem90aoW4Lc0w9NnX5KXHwCoOY
 vSUTR+0zU/pfKqNV8+KHuL0xUjn2zz483vq5WYwlG+OGCetFNBHb5tn6i+An9tG3d4UzZrcKoMk
 gW5+ABkfY7kpC7uOx0S77fNdaz8g=
X-Received: by 2002:a63:8f1c:: with SMTP id n28mr9891732pgd.330.1597745076935; 
 Tue, 18 Aug 2020 03:04:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIfsUK3KRTYgQUDUQ6BhiF6DET2epM4uWFMB/eBKj4BYv0LBKtpsQ2FH3pWtaBbFEDRVeRVw==
X-Received: by 2002:a63:8f1c:: with SMTP id n28mr9891716pgd.330.1597745076606; 
 Tue, 18 Aug 2020 03:04:36 -0700 (PDT)
Received: from localhost.localdomain (223-137-244-244.emome-ip.hinet.net.
 [223.137.244.244])
 by smtp.gmail.com with ESMTPSA id q10sm23433222pfs.75.2020.08.18.03.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 03:04:35 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it,
	viresh.kumar@linaro.org,
	chrubis@suse.cz
Date: Tue, 18 Aug 2020 18:04:21 +0800
Message-Id: <20200818100422.27775-2-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200818100422.27775-1-po-hsu.lin@canonical.com>
References: <20200818100422.27775-1-po-hsu.lin@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCHv2 1/2] lib/tst_kvercmp: Add support to get distname
 for different OS in tst_kvcmp_distname
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
Cc: po-hsu.lin@canonical.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The kver on Ubuntu will be something like these:
* 4.4.0-187-generic
* 5.4.0-1021-kvm
* 4.15.0-1093-azure

So it's better to parse OS name from ID= in /etc/os-release, instead
of doing this from checking kver substring like what we did for RHEL
and Oracle Linux here.

From the document [1] this string will alway be in lowercase. Example:
"ID=fedora" or "ID=debian". Thus it needs to be converted to uppercase
to make it consistent with other return values in tst_kvcmp_distname().

Note that if ID was not set, it will default to "ID=linux". Thus we
can expect to get LINUX on some distros.

[1] https://www.freedesktop.org/software/systemd/man/os-release.html

Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
---
 lib/tst_kvercmp.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/lib/tst_kvercmp.c b/lib/tst_kvercmp.c
index dc3bb669b..af6c6de69 100644
--- a/lib/tst_kvercmp.c
+++ b/lib/tst_kvercmp.c
@@ -18,6 +18,7 @@
  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  */
 
+#include <ctype.h>
 #include <stdlib.h>
 #include <unistd.h>
 #include <string.h>
@@ -25,6 +26,8 @@
 #include <sys/utsname.h>
 #include "test.h"
 
+#define OSRELEASE_PATH "/etc/os-release"
+
 static char *parse_digit(const char *str, int *d)
 {
 	unsigned long v;
@@ -127,6 +130,8 @@ int tst_kvexcmp(const char *tst_exv, const char *cur_ver)
 
 const char *tst_kvcmp_distname(const char *kver)
 {
+	static char distname[64];
+	char *tok;
 	if (strstr(kver, ".el5uek"))
 		return "OL5UEK";
 
@@ -139,6 +144,17 @@ const char *tst_kvcmp_distname(const char *kver)
 	if (strstr(kver, ".el6"))
 		return "RHEL6";
 
+	// Special case for other releases with the presencse of /etc/os-release
+	if (access(OSRELEASE_PATH, F_OK) != -1) {
+		SAFE_FILE_LINES_SCANF(NULL, OSRELEASE_PATH, "ID=%s", distname);
+		tok = strtok(distname,"\0");
+		while (*tok) {
+			*tok = toupper((unsigned char) *tok);
+			tok++;
+		}
+		return distname;
+	}
+
 	return NULL;
 }
 
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
