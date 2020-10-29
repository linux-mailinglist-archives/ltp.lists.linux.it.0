Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C03E29F24F
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Oct 2020 17:54:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 576C33C5595
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Oct 2020 17:54:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 71FEE3C30C4
 for <ltp@lists.linux.it>; Thu, 29 Oct 2020 17:54:36 +0100 (CET)
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 11CB960046D
 for <ltp@lists.linux.it>; Thu, 29 Oct 2020 17:54:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=3dGUrM1x5xJKFL5Qxu
 GXpdLS//0NCPGb3vhiKAIWcOo=; b=JYYaZb/eZMJc49qW4Sk9RpvwXapT7YMs58
 6ot2CNaSEN5nDN9gkipuF8xE8JFl9JluiAa0VVQcZYbH4r6FRabMOfFR+jZMtUDZ
 3bpZiNpwoabFo/JNuhnr3t9U4kdAR9HM/TmspgD+e/6zX6grvYMbiCUDiUMeS7+j
 TV/8JM/As=
Received: from localhost.localdomain (unknown [112.22.71.202])
 by smtp7 (Coremail) with SMTP id C8CowABnp4MG8Jpfz5tNGA--.27070S2;
 Fri, 30 Oct 2020 00:38:31 +0800 (CST)
From: Yang Xu <xuyang_jy_0410@163.com>
To: ltp@lists.linux.it
Date: Fri, 30 Oct 2020 00:35:44 +0800
Message-Id: <20201029163545.9829-1-xuyang_jy_0410@163.com>
X-Mailer: git-send-email 2.18.1
X-CM-TRANSID: C8CowABnp4MG8Jpfz5tNGA--.27070S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTR2FAdDUUUU
X-Originating-IP: [112.22.71.202]
X-CM-SenderInfo: p0x1t05jbm5saquriqqrwthudrp/1tbiQgfMhFaD82juVQAAs4
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] tst_kvercmp: Add rhel7,8 support
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

Signed-off-by: Yang Xu <xuyang_jy_0410@163.com>
---
 lib/tst_kvercmp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/tst_kvercmp.c b/lib/tst_kvercmp.c
index 5d56e30b9..8bf65d309 100644
--- a/lib/tst_kvercmp.c
+++ b/lib/tst_kvercmp.c
@@ -146,6 +146,12 @@ const char *tst_kvcmp_distname(const char *kver)
 	if (strstr(kver, ".el6"))
 		return "RHEL6";
 
+	if (strstr(kver, ".el7"))
+		return "RHEL7";
+
+	if (strstr(kver, ".el8"))
+		return "RHEL8";
+
 	if (access(OSRELEASE_PATH, F_OK) != -1) {
 		SAFE_FILE_LINES_SCANF(NULL, OSRELEASE_PATH, "ID=%s", distname);
 
-- 
2.18.1



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
