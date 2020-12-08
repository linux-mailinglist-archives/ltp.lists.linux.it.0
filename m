Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 668A72D2872
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Dec 2020 11:08:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 04C903C4B8F
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Dec 2020 11:08:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 9BF4D3C2350
 for <ltp@lists.linux.it>; Tue,  8 Dec 2020 11:07:57 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id E78C01000A5A
 for <ltp@lists.linux.it>; Tue,  8 Dec 2020 11:07:56 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,402,1599494400"; d="scan'208";a="102176859"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 08 Dec 2020 18:07:53 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 37C9C4CE6009
 for <ltp@lists.linux.it>; Tue,  8 Dec 2020 18:07:49 +0800 (CST)
Received: from RHEL74GA.g08.fujitsu.local (10.167.220.75) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 8 Dec 2020 18:07:48 +0800
From: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 8 Dec 2020 05:07:46 -0500
Message-ID: <1607422067-15500-2-git-send-email-zhufy.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1607422067-15500-1-git-send-email-zhufy.jy@cn.fujitsu.com>
References: <1607422067-15500-1-git-send-email-zhufy.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.75]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 37C9C4CE6009.A7D5E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhufy.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] lapi/msg.h: Add MSG_STAT_ANY
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

Signed-off-by: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
---
 include/lapi/msg.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/lapi/msg.h b/include/lapi/msg.h
index d649f33..0295111 100644
--- a/include/lapi/msg.h
+++ b/include/lapi/msg.h
@@ -12,4 +12,8 @@
 # define MSG_COPY  040000  /* copy (not remove) all queue messages */
 #endif
 
+#ifndef MSG_STAT_ANY
+# define MSG_STAT_ANY 13
+#endif
+
 #endif
-- 
1.8.3.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
