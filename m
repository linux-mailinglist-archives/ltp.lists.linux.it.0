Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F5E2C5218
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 11:34:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0C9ED3C5E0E
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 11:34:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id EFD153C2246
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 11:34:02 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 498226008D6
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 11:34:01 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,371,1599494400"; d="scan'208";a="101778771"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 26 Nov 2020 18:34:00 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 3DD354CE4BCB;
 Thu, 26 Nov 2020 18:33:59 +0800 (CST)
Received: from G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 26 Nov 2020 18:33:57 +0800
Received: from Fedora-31.g08.fujitsu.local (10.167.220.31) by
 G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Thu, 26 Nov 2020 18:33:57 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 26 Nov 2020 18:13:44 +0800
Message-ID: <20201126101344.550472-1-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 3DD354CE4BCB.AC600
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] travis: Remove obsolete CentOS 6
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

We are planning to remove the support of old distros(e.g. CentOS 6).

Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 .travis.yml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 281ec9e96..3c5ff99b7 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -43,10 +43,6 @@ matrix:
           env: DISTRO=fedora:latest MAKE_INSTALL=1
           compiler: clang
 
-        - os: linux
-          env: DISTRO=centos:6 TREE=out
-          compiler: gcc
-
         - os: linux
           env: DISTRO=centos:7 TREE=out
           compiler: gcc
-- 
2.25.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
