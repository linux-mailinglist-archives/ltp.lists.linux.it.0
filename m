Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA4E1CBD87
	for <lists+linux-ltp@lfdr.de>; Sat,  9 May 2020 06:42:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1EC373C567A
	for <lists+linux-ltp@lfdr.de>; Sat,  9 May 2020 06:42:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id C0ECD3C250E
 for <ltp@lists.linux.it>; Sat,  9 May 2020 06:42:47 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 226E51400993
 for <ltp@lists.linux.it>; Sat,  9 May 2020 06:42:42 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,370,1583164800"; d="scan'208";a="91791272"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 May 2020 12:42:35 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 1D9AC50A997D;
 Sat,  9 May 2020 12:42:35 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sat, 9 May 2020 12:42:35 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Sat, 9 May 2020 12:42:37 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <pvorel@suse.cz>
Date: Sat, 9 May 2020 12:42:54 +0800
Message-ID: <1588999374-22808-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 1D9AC50A997D.A0A2D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] travis: Enable fedora:lastest again
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

fedora:lastest docker image has been updated, it doesn't have file
conflicts problem with libtirpc rpm. So enable fedora:lastest again.

url:
https://travis-ci.org/github/xuyang0410/ltp/jobs/684940178

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 .travis.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.travis.yml b/.travis.yml
index f918f6e40..9505ed9ba 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -45,7 +45,7 @@ matrix:
 
         # other builds
         - os: linux
-          env: DISTRO=fedora:rawhide MAKE_INSTALL=1
+          env: DISTRO=fedora:latest MAKE_INSTALL=1
           compiler: clang
 
         - os: linux
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
