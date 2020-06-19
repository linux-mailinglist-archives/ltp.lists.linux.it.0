Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 53804201594
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 18:29:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B334A3C5F1F
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 18:29:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 323663C1419
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 18:29:25 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1F265600BE6
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 18:28:35 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 81FDFAB76
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 16:29:23 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 19 Jun 2020 18:29:21 +0200
Message-Id: <20200619162922.20465-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] Add tst_get_hugepage_size() to LTP library
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Simple helper function for the Hugepage CoW test.

 include/tst_hugepage.h | 5 +++++
 lib/tst_hugepage.c     | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/tst_hugepage.h b/include/tst_hugepage.h
index 60c03c5c5..e08a2daa2 100644
--- a/include/tst_hugepage.h
+++ b/include/tst_hugepage.h
@@ -12,6 +12,11 @@
 extern char *nr_opt; /* -s num   Set the number of the been allocated hugepages */
 extern char *Hopt;   /* -H /..   Location of hugetlbfs, i.e.  -H /var/hugetlbfs */
 
+/*
+ * Get the default hugepage size. Returns 0 if hugepages are not supported.
+ */
+size_t tst_get_hugepage_size(void);
+
 /*
  * Try the best to request a specified number of huge pages from system,
  * it will store the reserved hpage number in tst_hugepages.
diff --git a/lib/tst_hugepage.c b/lib/tst_hugepage.c
index f2bf5d20e..3a8dcca90 100644
--- a/lib/tst_hugepage.c
+++ b/lib/tst_hugepage.c
@@ -12,6 +12,15 @@ unsigned long tst_hugepages;
 char *nr_opt;
 char *Hopt;
 
+size_t tst_get_hugepage_size(void)
+{
+	if (access(PATH_HUGEPAGES, F_OK)) {
+		return 0;
+	}
+
+	return SAFE_READ_MEMINFO("Hugepagesize:") * 1024;
+}
+
 unsigned long tst_request_hugepages(unsigned long hpages)
 {
 	unsigned long val, max_hpages;
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
