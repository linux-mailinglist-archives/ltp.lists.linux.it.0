Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 066F620AEBE
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 11:09:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0EA0A3C5848
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 11:09:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 51E343C0ECB
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 11:09:52 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id F27F56018C3
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 11:09:51 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1FF12AEC8
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 09:09:51 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 26 Jun 2020 11:10:12 +0200
Message-Id: <20200626091012.11960-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] [COMMITTED] libltpvdso: Fix build on Centos 6
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

Since for loop initial declaration are not allowed on old gcc.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 libs/libltpvdso/parse_vdso.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/libs/libltpvdso/parse_vdso.c b/libs/libltpvdso/parse_vdso.c
index 03ba47e85..7bbd168b6 100644
--- a/libs/libltpvdso/parse_vdso.c
+++ b/libs/libltpvdso/parse_vdso.c
@@ -232,8 +232,10 @@ void *vdso_sym(const char *version, const char *name)
 
 void vdso_init_from_auxv(void *auxv)
 {
+	int i;
+
 	ELF(auxv_t) *elf_auxv = auxv;
-	for (int i = 0; elf_auxv[i].a_type != AT_NULL; i++) {
+	for (i = 0; elf_auxv[i].a_type != AT_NULL; i++) {
 		if (elf_auxv[i].a_type == AT_SYSINFO_EHDR) {
 			vdso_init_from_sysinfo_ehdr(elf_auxv[i].a_un.a_val);
 			return;
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
