Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3303E17F449
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 11:03:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 870FC3C6031
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 11:03:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 215D93C5FFE
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 11:03:20 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id A2A541A00926
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 11:03:18 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,536,1574092800"; d="scan'208";a="86104942"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Mar 2020 18:03:13 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id D6F9C406AB15
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 17:53:16 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 10 Mar 2020 18:03:12 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 10 Mar 2020 18:03:06 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 10 Mar 2020 18:02:57 +0800
Message-ID: <1583834577-21695-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: D6F9C406AB15.AF87F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] travis: Temporarily disable fedora:lastest
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

Docker hub image for fedora:lastest has problem, so it will
install x86_64 and i686 rpm together. It will lead to file
conflict as below:
 file /etc/bindresvport.blacklist from install of libtirpc-1.2.5-1.rc2.fc31.i686
conflicts with file from package libtirpc-1.2.5-0.fc31.x86_64

I have created a github issue[1] for it on fedora-cloud.

[1]https://github.com/fedora-cloud/docker-brew-fedora/issues/73

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 .travis.yml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index f7d73f051..68d98406d 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -43,11 +43,6 @@ matrix:
           compiler: gcc
           env: DISTRO=debian:testing
 
-        # other builds
-        - os: linux
-          env: DISTRO=fedora:latest MAKE_INSTALL=1
-          compiler: clang
-
         - os: linux
           env: DISTRO=centos:6 TREE=out
           compiler: gcc
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
