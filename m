Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D159D1D395F
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 20:49:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4C65F3C542F
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 20:49:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 888FF3C23C2
 for <ltp@lists.linux.it>; Thu, 14 May 2020 20:49:13 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A05C11A014B4
 for <ltp@lists.linux.it>; Thu, 14 May 2020 20:49:12 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E2190AE47
 for <ltp@lists.linux.it>; Thu, 14 May 2020 18:49:14 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 14 May 2020 20:49:02 +0200
Message-Id: <20200514184904.4537-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514184904.4537-1-pvorel@suse.cz>
References: <20200514184904.4537-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/4] INSTALL: Document 32bit and cross-compilation
 setup
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

which requires also to set pkg-config environment variables.

This setup is needed since c7d2a7458 ("rpc-tirpc: Detect libtirpc with
pkg-config")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 INSTALL | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/INSTALL b/INSTALL
index e4fa1adf3..f73bec54c 100644
--- a/INSTALL
+++ b/INSTALL
@@ -219,14 +219,28 @@ contributions are welcome.
 
 Cross compiling
 ---------------
-
 To cross compile, you must specify the correct variables when running configure.
-e.g. CC, LDFLAGS, etc...
+e.g. CC, LDFLAGS, etc.
+For correct pkgconf / pkg-config detection you need to set
+PKG_CONFIG_SYSROOT_DIR=$SYSROOT
 
 After configure has run, it will generate include/mk/config.mk. You can tweak
 settings in there if need be, but you should not specificy settings on the
 command-line when running make.
 
+32 bit build on 64 bit machine
+------------------------------
+You need to set CFLAGS=-m32 LDFLAGS=-m32 and PKG_CONFIG_LIBDIR
+
+* RPM based distributions (openSUSE, Fedora, etc.)
+PKG_CONFIG_LIBDIR=/usr/lib/pkgconfig CFLAGS=-m32 LDFLAGS=-m32 ./configure
+
+* Debian / Ubuntu and derivates
+PKG_CONFIG_LIBDIR=/usr/lib/i386-linux-gnu/pkgconfig CFLAGS=-m32 LDFLAGS=-m32 ./configure
+
+* Arch Linux
+PKG_CONFIG_LIBDIR=/usr/lib32/pkgconfig CFLAGS=-m32 LDFLAGS=-m32 ./configure
+
 uClinux Users
 --------------
 Specify UCLINUX=1 when calling make; -DUCLINUX=1 use is deprecated and highly
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
