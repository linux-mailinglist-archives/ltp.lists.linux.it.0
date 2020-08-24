Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3409924F296
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 08:36:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 860763C2EF0
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 08:36:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 816D13C267D
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 08:36:41 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 46BE760081A
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 08:36:39 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,347,1592841600"; d="scan'208";a="98448634"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 24 Aug 2020 14:36:32 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id EA5DC48990D5
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 14:36:30 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 24 Aug 2020 14:36:34 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 24 Aug 2020 14:36:24 +0800
Message-ID: <1598250984-5141-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: EA5DC48990D5.AF600
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] travis: Add centos7 build
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

I have this idea when I meet ALG_SET_AEAD_ASSOCLEN undefined error on centos7.
Add centos7 travis target, it is more friendly for centos7 user and it is more
meaningful than centos6.

I have tested this patch on my ltp fork:
https://travis-ci.org/github/xuyang0410/ltp/jobs/720541105

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 .travis.yml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.travis.yml b/.travis.yml
index e8e3189af..281ec9e96 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -47,6 +47,10 @@ matrix:
           env: DISTRO=centos:6 TREE=out
           compiler: gcc
 
+        - os: linux
+          env: DISTRO=centos:7 TREE=out
+          compiler: gcc
+
         - os: linux
           env: DISTRO=debian:testing
           compiler: gcc
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
