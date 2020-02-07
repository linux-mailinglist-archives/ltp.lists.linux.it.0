Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7F0155BC0
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Feb 2020 17:28:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C50613C23C8
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Feb 2020 17:28:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 8B17B3C2385
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 17:28:45 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EC87914052F5
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 17:28:44 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4BD4EAD6F
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 16:28:44 +0000 (UTC)
Date: Fri, 7 Feb 2020 17:28:42 +0100
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20200207162842.GB27725@dell5510>
References: <20200207160831.27493-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207160831.27493-1-pvorel@suse.cz>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] build: Disable make install for most of builds
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> build.sh: add -i option which enables make install (default off)
> Enable it in Debian powerpc64le cross-compilation (out of tree)
> and latest Fedora.

Hm, it requires a fix, below.

Script is getting ugly, but it's just a build script.

Verification:
https://travis-ci.org/pevik/ltp/builds/647410565

diff --git build.sh build.sh
index e12a0b27d..e3d268c83 100755
--- build.sh
+++ build.sh
@@ -24,13 +24,13 @@ build_32()
 {
 	echo "===== 32-bit ${1}-tree build into $PREFIX ====="
 	CFLAGS="-m32 $CFLAGS" LDFLAGS="-m32 $LDFLAGS"
-	build $1
+	build $1 $2
 }
 
 build_native()
 {
 	echo "===== native ${1}-tree build into $PREFIX ====="
-	build $1
+	build $1 $2
 }
 
 build_cross()
@@ -40,7 +40,7 @@ build_cross()
 		{ echo "Missing CC variable, pass it with -c option." >&2; exit 1; }
 
 	echo "===== cross-compile ${host} ${1}-tree build into $PREFIX ====="
-	build $1 "--host=$host" CROSS_COMPILE="${host}-"
+	build $1 $2 "--host=$host" CROSS_COMPILE="${host}-"
 }
 
 build()
@@ -85,6 +85,9 @@ build_out_tree()
 
 build_in_tree()
 {
+	local install="$1"
+	shift
+
 	run_configure ./configure $CONFIGURE_OPTS_IN_TREE --prefix=$PREFIX $@
 
 	echo "=== build ==="

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
