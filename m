Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A661D1D49A7
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 11:32:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 636283C53C2
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 11:32:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 4E4E33C53A4
 for <ltp@lists.linux.it>; Fri, 15 May 2020 11:32:26 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A3AA96014A1
 for <ltp@lists.linux.it>; Fri, 15 May 2020 11:32:05 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2883FB1A1;
 Fri, 15 May 2020 09:32:28 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 15 May 2020 11:32:15 +0200
Message-Id: <20200515093216.829-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515093216.829-1-pvorel@suse.cz>
References: <20200515093216.829-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v4 3/4] INSTALL: Remove uClinux and "What's in a
 Path?" sections
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

uClinux is not active project any more.
And we have started to remove the code anyway.

Note about reasonable PATH it's kind of obvious, we don't have to
point that out.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 INSTALL | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/INSTALL b/INSTALL
index d493c523c..89ee81e8d 100644
--- a/INSTALL
+++ b/INSTALL
@@ -45,24 +45,6 @@ what to do next.
 Compiling LTP
 -------------------
 
-"What's in a Path?"
--------------------
-
-Before getting started, you should make sure that your build directory and
-source directory are as basic as possible: no commas, colons, semicolons,
-spaces, etc. In fact, this is a relatively good rule of thumb when dealing
-with any [Gnu?] make based opensource project.
-
-We won't `fix' the `issues' associated with these particular set of build
-errors resulting from non-sane pathnames, because it would introduce unneeded
-complexity into the build system and would require non-trivial effort to fix
-and validate the third-party packages, and thus wouldn't be a sustainable
-model to follow.
-
-So, we apologize for the inconvenience, but using other characters like
-underscores and dashes should help when disambiguating words between build
-and source pathnames.
-
 In-build-tree
 -------------------
 In-build-tree support is when you build binaries (applications, binary objects)
@@ -236,11 +218,6 @@ PKG_CONFIG_LIBDIR=/usr/lib/i386-linux-gnu/pkgconfig CFLAGS=-m32 LDFLAGS=-m32 ./c
 * Arch Linux
 PKG_CONFIG_LIBDIR=/usr/lib32/pkgconfig CFLAGS=-m32 LDFLAGS=-m32 ./configure
 
-uClinux Users
---------------
-Specify UCLINUX=1 when calling make; -DUCLINUX=1 use is deprecated and highly
-discouraged.
-
 Android Users
 -------------
 Specify ANDROID=1 when calling make. Many tests which would otherwise work are
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
