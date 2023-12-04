Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A382803D6B
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Dec 2023 19:48:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E6DDC3CFB66
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Dec 2023 19:48:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F3BD43CC7B1
 for <ltp@lists.linux.it>; Mon,  4 Dec 2023 19:48:34 +0100 (CET)
Received: from 66-220-144-179.mail-mxout.facebook.com
 (66-220-144-179.mail-mxout.facebook.com [66.220.144.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 003D11A00E21
 for <ltp@lists.linux.it>; Mon,  4 Dec 2023 19:48:33 +0100 (CET)
Received: by devbig1114.prn1.facebook.com (Postfix, from userid 425415)
 id 148D1105A5B35; Mon,  4 Dec 2023 10:48:20 -0800 (PST)
From: Stefan Roesch <shr@devkernel.io>
To: kernel-team@fb.com
Date: Mon,  4 Dec 2023 10:48:16 -0800
Message-Id: <20231204184817.3570465-2-shr@devkernel.io>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20231204184817.3570465-1-shr@devkernel.io>
References: <20231204184817.3570465-1-shr@devkernel.io>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.6 required=7.0 tests=HELO_MISC_IP,RDNS_DYNAMIC,
 SPF_HELO_PASS,SPF_NEUTRAL,TVD_RCVD_IP,T_SCC_BODY_TEXT_LINE
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/2] mem: disable KSM smart scan for ksm tests
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
Cc: linux-mm@kvack.org, david@redhat.com, oliver.sang@intel.com,
 shr@devkernel.io, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This disables the "smart scan" KSM feature to make sure that the volatile
count remains at 0.

Signed-off-by: Stefan Roesch <shr@devkernel.io>
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202311161132.13d8ce5a-oliver.sang@intel.com
---
 testcases/kernel/mem/ksm/ksm01.c | 2 ++
 testcases/kernel/mem/ksm/ksm02.c | 2 ++
 testcases/kernel/mem/ksm/ksm03.c | 2 ++
 testcases/kernel/mem/ksm/ksm04.c | 2 ++
 testcases/kernel/mem/ksm/ksm05.c | 2 ++
 testcases/kernel/mem/ksm/ksm06.c | 2 ++
 6 files changed, 12 insertions(+)

diff --git a/testcases/kernel/mem/ksm/ksm01.c b/testcases/kernel/mem/ksm/ksm01.c
index bcd095865..e2d3d9e00 100644
--- a/testcases/kernel/mem/ksm/ksm01.c
+++ b/testcases/kernel/mem/ksm/ksm01.c
@@ -86,6 +86,8 @@ static struct tst_test test = {
 			TST_SR_SKIP_MISSING | TST_SR_TCONF_RO},
 		{"/sys/kernel/mm/ksm/merge_across_nodes", "1",
 			TST_SR_SKIP_MISSING | TST_SR_TCONF_RO},
+		{"/sys/kernel/mm/ksm/smart_scan", "0",
+			TST_SR_SKIP_MISSING | TST_SR_TBROK_RO},
 		{}
 	},
 	.needs_kconfigs = (const char *const[]){
diff --git a/testcases/kernel/mem/ksm/ksm02.c b/testcases/kernel/mem/ksm/ksm02.c
index bce639dce..3707de95d 100644
--- a/testcases/kernel/mem/ksm/ksm02.c
+++ b/testcases/kernel/mem/ksm/ksm02.c
@@ -107,6 +107,8 @@ static struct tst_test test = {
 			TST_SR_SKIP_MISSING | TST_SR_TCONF_RO},
 		{"/sys/kernel/mm/ksm/merge_across_nodes", "1",
 			TST_SR_SKIP_MISSING | TST_SR_TCONF_RO},
+		{"/sys/kernel/mm/ksm/smart_scan", "0",
+			TST_SR_SKIP_MISSING | TST_SR_TBROK_RO},
 		{}
 	},
 	.needs_kconfigs = (const char *const[]){
diff --git a/testcases/kernel/mem/ksm/ksm03.c b/testcases/kernel/mem/ksm/ksm03.c
index 4a733269f..cff74700d 100644
--- a/testcases/kernel/mem/ksm/ksm03.c
+++ b/testcases/kernel/mem/ksm/ksm03.c
@@ -89,6 +89,8 @@ static struct tst_test test = {
 			TST_SR_SKIP_MISSING | TST_SR_TCONF_RO},
 		{"/sys/kernel/mm/ksm/merge_across_nodes", "1",
 			TST_SR_SKIP_MISSING | TST_SR_TCONF_RO},
+		{"/sys/kernel/mm/ksm/smart_scan", "0",
+			TST_SR_SKIP_MISSING | TST_SR_TBROK_RO},
 		{}
 	},
 	.needs_kconfigs = (const char *const[]){
diff --git a/testcases/kernel/mem/ksm/ksm04.c b/testcases/kernel/mem/ksm/ksm04.c
index 4f1f2f721..9935e32d7 100644
--- a/testcases/kernel/mem/ksm/ksm04.c
+++ b/testcases/kernel/mem/ksm/ksm04.c
@@ -109,6 +109,8 @@ static struct tst_test test = {
 			TST_SR_SKIP_MISSING | TST_SR_TCONF_RO},
 		{"/sys/kernel/mm/ksm/merge_across_nodes", "1",
 			TST_SR_SKIP_MISSING | TST_SR_TCONF_RO},
+		{"/sys/kernel/mm/ksm/smart_scan", "0",
+			TST_SR_SKIP_MISSING | TST_SR_TBROK_RO},
 		{}
 	},
 	.needs_kconfigs = (const char *const[]){
diff --git a/testcases/kernel/mem/ksm/ksm05.c b/testcases/kernel/mem/ksm/ksm05.c
index 1f58c8325..61e740843 100644
--- a/testcases/kernel/mem/ksm/ksm05.c
+++ b/testcases/kernel/mem/ksm/ksm05.c
@@ -89,6 +89,8 @@ static struct tst_test test = {
 	.test_all = test_ksm,
 	.save_restore = (const struct tst_path_val[]) {
 		{"/sys/kernel/mm/ksm/run", "1", TST_SR_TBROK},
+		{"/sys/kernel/mm/ksm/smart_scan", "0",
+			TST_SR_SKIP_MISSING | TST_SR_TBROK_RO},
 		{}
 	},
 	.needs_kconfigs = (const char *const[]){
diff --git a/testcases/kernel/mem/ksm/ksm06.c b/testcases/kernel/mem/ksm/ksm06.c
index 0b159e5c7..80fdf1e47 100644
--- a/testcases/kernel/mem/ksm/ksm06.c
+++ b/testcases/kernel/mem/ksm/ksm06.c
@@ -142,6 +142,8 @@ static struct tst_test test = {
 		{"/sys/kernel/mm/ksm/run", NULL, TST_SR_TBROK},
 		{"/sys/kernel/mm/ksm/sleep_millisecs", NULL, TST_SR_TBROK},
 		{"/sys/kernel/mm/ksm/merge_across_nodes", NULL, TST_SR_TCONF},
+		{"/sys/kernel/mm/ksm/smart_scan", "0",
+			TST_SR_SKIP_MISSING | TST_SR_TBROK_RO},
 		{}
 	},
 	.needs_kconfigs = (const char *const[]){
-- 
2.39.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
