Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 956C51A98E4
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 11:29:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 255FD3C2B28
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 11:29:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id F2C213C2AF5
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 11:28:23 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 754FC1A01183
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 11:28:23 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B1458AE5A;
 Wed, 15 Apr 2020 09:28:21 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 15 Apr 2020 11:28:06 +0200
Message-Id: <20200415092809.20240-6-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200415092809.20240-1-pvorel@suse.cz>
References: <20200415092809.20240-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 5/8] hugepage: Fix linking error with -fno-common
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

by moving definitions to tst_hugepage.c and adding extern declarations
to tst_hugepage.h.

Fixes: 156f91396 ("hugetlb: move nr_opt to tst_hugepage.h")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 include/tst_hugepage.h | 4 ++--
 lib/tst_hugepage.c     | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/tst_hugepage.h b/include/tst_hugepage.h
index 30e00a377..60c03c5c5 100644
--- a/include/tst_hugepage.h
+++ b/include/tst_hugepage.h
@@ -9,8 +9,8 @@
 #define PATH_HUGEPAGES	"/sys/kernel/mm/hugepages/"
 #define PATH_NR_HPAGES	"/proc/sys/vm/nr_hugepages"
 
-char *nr_opt; /* -s num   Set the number of the been allocated hugepages */
-char *Hopt;   /* -H /..   Location of hugetlbfs, i.e.  -H /var/hugetlbfs */
+extern char *nr_opt; /* -s num   Set the number of the been allocated hugepages */
+extern char *Hopt;   /* -H /..   Location of hugetlbfs, i.e.  -H /var/hugetlbfs */
 
 /*
  * Try the best to request a specified number of huge pages from system,
diff --git a/lib/tst_hugepage.c b/lib/tst_hugepage.c
index 34fd27ede..52667a14e 100644
--- a/lib/tst_hugepage.c
+++ b/lib/tst_hugepage.c
@@ -9,6 +9,8 @@
 #include "tst_hugepage.h"
 
 unsigned long tst_hugepages;
+char *nr_opt;
+char *Hopt;
 
 unsigned long tst_request_hugepages(unsigned long hpages)
 {
-- 
2.26.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
