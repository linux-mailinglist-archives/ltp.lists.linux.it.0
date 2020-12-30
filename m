Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 131702E7754
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Dec 2020 10:09:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A2B9F3C56B2
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Dec 2020 10:09:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id B4DF03C28E3
 for <ltp@lists.linux.it>; Wed, 30 Dec 2020 10:09:29 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id CCCCB10006C5
 for <ltp@lists.linux.it>; Wed, 30 Dec 2020 10:09:28 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,460,1599494400"; d="scan'208";a="103078518"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Dec 2020 17:09:26 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 4DF0D4CE5CE3
 for <ltp@lists.linux.it>; Wed, 30 Dec 2020 17:09:25 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 30 Dec 2020 17:09:24 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 30 Dec 2020 17:09:29 +0800
Message-ID: <1609319369-8153-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 4DF0D4CE5CE3.AFFD7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [COMMITTED] lapi/sem.h: Adjust "sys/sem.h" position
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

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 include/lapi/sem.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/lapi/sem.h b/include/lapi/sem.h
index 7cef3d5a7..8ba92de36 100644
--- a/include/lapi/sem.h
+++ b/include/lapi/sem.h
@@ -2,12 +2,11 @@
 /*
  * Copyright (c) 2015 Linux Test Project
  */
-
-#include <sys/sem.h>
-
 #ifndef LAPI_SEM_H
 #define LAPI_SEM_H
 
+#include <sys/sem.h>
+
 #if defined(__GNU_LIBRARY__) && !defined(_SEM_SEMUN_UNDEFINED)
 /* union semun is defined by including <sys/sem.h> */
 #else
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
