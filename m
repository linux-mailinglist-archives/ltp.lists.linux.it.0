Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C88974EC
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Aug 2019 10:28:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AB5A43C1D01
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Aug 2019 10:28:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 771EA3C1C90
 for <ltp@lists.linux.it>; Wed, 21 Aug 2019 10:28:11 +0200 (CEST)
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BD31E6005D4
 for <ltp@lists.linux.it>; Wed, 21 Aug 2019 10:28:12 +0200 (CEST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
 [147.11.189.40])
 by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7L8Rao6030529
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Wed, 21 Aug 2019 01:27:47 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.468.0; Wed, 21 Aug 2019 01:27:25 -0700
From: <zhe.he@windriver.com>
To: <ltp@lists.linux.it>, <jstancek@redhat.com>
Date: Wed, 21 Aug 2019 16:27:24 +0800
Message-ID: <1566376044-175216-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2] cve: Fix kernel symbol finding for meltdown case
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

From: He Zhe <zhe.he@windriver.com>

meltdown case fails as below.
safe_file_ops.c:219: BROK: Expected 3 conversions got 2 at meltdown.c:272

find_kernel_symbol is defined to try twice with each of /proc/kallsyms and
/boot/System.map-%s. Currently if the symbol is not found in /proc/kallsyms,
when kernel option CONFIG_KALLSYMS_ALL is disabled, it would stop the case
immediately due to SAFE_FILE_LINES_SCANF.

This patch turns to use FILE_LINES_SCANF to give find_kernel_symbol second
chance.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 testcases/cve/meltdown.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/cve/meltdown.c b/testcases/cve/meltdown.c
index f78c38b..2d66c1e 100644
--- a/testcases/cve/meltdown.c
+++ b/testcases/cve/meltdown.c
@@ -255,7 +255,7 @@ find_symbol_in_file(const char *filename, const char *symname)
 
 	sprintf(fmt, "%%lx %%c %s%%c", symname);
 
-	ret = SAFE_FILE_LINES_SCANF(filename, fmt, &addr, &type, &read);
+	ret = FILE_LINES_SCANF(filename, fmt, &addr, &type, &read);
 	if (ret)
 		return 0;
 
-- 
2.7.4


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
