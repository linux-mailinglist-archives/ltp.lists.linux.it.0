Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7145D9FF34
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Aug 2019 12:14:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E26BE3C1CFE
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Aug 2019 12:14:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 00C253C1D00
 for <ltp@lists.linux.it>; Wed, 28 Aug 2019 12:14:48 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id E347C140200A
 for <ltp@lists.linux.it>; Wed, 28 Aug 2019 12:14:47 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,440,1559491200"; d="scan'208";a="74451900"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 28 Aug 2019 18:14:45 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 7AC0C4CDDB0D
 for <ltp@lists.linux.it>; Wed, 28 Aug 2019 18:14:43 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 28 Aug 2019 18:14:42 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 28 Aug 2019 18:14:15 +0800
Message-ID: <1566987255-3010-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1566987255-3010-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1566987255-3010-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 7AC0C4CDDB0D.A1A32
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] runtest/numa: add migrate_pages*
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

Since migrate_pages must depend on numa, add it into
runtest/numa.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 runtest/numa | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/runtest/numa b/runtest/numa
index 7885be90c..45d15e768 100644
--- a/runtest/numa
+++ b/runtest/numa
@@ -12,6 +12,10 @@ move_pages10 move_pages10
 move_pages11 move_pages11
 move_pages12 move_pages12
 
+migrate_pages01 migrate_pages01
+migrate_pages02 migrate_pages02
+migrate_pages03 migrate_pages03
+
 set_mempolicy01 set_mempolicy01
 set_mempolicy02 set_mempolicy02
 set_mempolicy03 set_mempolicy03
-- 
2.18.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
