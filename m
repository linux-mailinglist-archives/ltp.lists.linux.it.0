Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 316428014F1
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Dec 2023 22:10:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7ED183CF613
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Dec 2023 22:10:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 892063CD315
 for <ltp@lists.linux.it>; Fri,  1 Dec 2023 22:09:51 +0100 (CET)
Received: from 66-220-144-179.mail-mxout.facebook.com
 (66-220-144-179.mail-mxout.facebook.com [66.220.144.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 68A9B1A01960
 for <ltp@lists.linux.it>; Fri,  1 Dec 2023 22:09:50 +0100 (CET)
Received: by devbig1114.prn1.facebook.com (Postfix, from userid 425415)
 id 21E3D10340489; Fri,  1 Dec 2023 13:09:34 -0800 (PST)
From: Stefan Roesch <shr@devkernel.io>
To: kernel-team@fb.com
Date: Fri,  1 Dec 2023 13:09:29 -0800
Message-Id: <20231201210930.2651725-2-shr@devkernel.io>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20231201210930.2651725-1-shr@devkernel.io>
References: <20231201210930.2651725-1-shr@devkernel.io>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.6 required=7.0 tests=HELO_MISC_IP,RDNS_DYNAMIC,
 SPF_HELO_PASS,SPF_NEUTRAL,TVD_RCVD_IP,T_SCC_BODY_TEXT_LINE
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] mem: disable KSM smart scan for ksm tests
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

Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202311161132.13d8ce5a-oliver.sang@intel.com
---
 testcases/kernel/mem/ksm/ksm01.c | 2 ++
 testcases/kernel/mem/ksm/ksm02.c | 2 ++
 testcases/kernel/mem/ksm/ksm03.c | 2 ++
 testcases/kernel/mem/ksm/ksm04.c | 2 ++
 4 files changed, 8 insertions(+)

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
-- 
2.39.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
