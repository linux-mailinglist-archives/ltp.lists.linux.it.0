Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7B52B2408
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 19:50:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E86D63C657C
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 19:50:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 904DC3C4FAA
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 19:50:15 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2C9F4601D1E
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 19:50:14 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 00446AC0C
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 18:50:13 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 13 Nov 2020 19:50:07 +0100
Message-Id: <20201113185007.13662-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [COMMITTED][PATCH 1/1] travis: Use latest (Fedora 33)
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

to fix Travis CI build, as Rawhide is currently failing on autoconf:

/usr/bin/autoconf: This script requires a shell more modern than all
/usr/bin/autoconf: the shells that I found on your system.
/usr/bin/autoconf: Please tell bug-autoconf@gnu.org about your system,
/usr/bin/autoconf: including any error possibly output before this
/usr/bin/autoconf: message. Then install a modern shell, or manually run
/usr/bin/autoconf: the script under such a shell if you do have one.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Fixing travis again.

Kind regards,
Petr

 .travis.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.travis.yml b/.travis.yml
index b19a3b1c6..281ec9e96 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -40,7 +40,7 @@ matrix:
 
         # other builds
         - os: linux
-          env: DISTRO=fedora:rawhide MAKE_INSTALL=1
+          env: DISTRO=fedora:latest MAKE_INSTALL=1
           compiler: clang
 
         - os: linux
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
