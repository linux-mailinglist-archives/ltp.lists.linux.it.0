Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1289CFBB
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2019 14:42:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 22AAE3C1CFC
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2019 14:42:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id B8B0C3C02A0
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 14:42:12 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CCC8F1A011EA
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 14:42:11 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 95F6630832E1
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 12:42:10 +0000 (UTC)
Received: from dhcp-3-207.nay.redhat.com (dhcp-3-207.nay.redhat.com
 [10.66.3.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C35D2600CE
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 12:42:09 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Mon, 26 Aug 2019 20:42:05 +0800
Message-Id: <20190826124205.14943-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Mon, 26 Aug 2019 12:42:10 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] move_pages12: add comment for a new
 regression
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

Signed-off-by: Li Wang <liwang@redhat.com>
---
 .../kernel/syscalls/move_pages/move_pages12.c      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/testcases/kernel/syscalls/move_pages/move_pages12.c b/testcases/kernel/syscalls/move_pages/move_pages12.c
index 5d7afad8e..c2927fb86 100644
--- a/testcases/kernel/syscalls/move_pages/move_pages12.c
+++ b/testcases/kernel/syscalls/move_pages/move_pages12.c
@@ -25,6 +25,7 @@
  *   mm/hugetlb: take page table lock in follow_huge_pmd()
  *
  *  Test #2:
+ *   #2.1:
  *   This is a regression test for the race condition, where move_pages()
  *   and soft offline are called on a single hugetlb page concurrently.
  *
@@ -36,6 +37,19 @@
  *
  *   mm, hugetlb: use pte_present() instead of pmd_present() in
  *   follow_huge_pmd()
+ *
+ *   #2.2:
+ *   This is also a regression test for an race condition causing SIGBUS
+ *   in hugepage migration/fault.
+ *
+ *   This bug was fixed by:
+ *
+ *   commit 4643d67e8cb0b3536ef0ab5cddd1cedc73fa14ad
+ *   Author: Mike Kravetz <mike.kravetz@oracle.com>
+ *   Date:   Tue Aug 13 15:38:00 2019 -0700
+ *
+ *   hugetlbfs: fix hugetlb page migration/fault race causing SIGBUS
+ *
  */
 
 #include <errno.h>
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
