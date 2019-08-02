Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EB97FCF5
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 17:05:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 10E1D3C20A6
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 17:05:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id C3B933C2018
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 17:04:54 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D4307141725C
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 17:04:53 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 821D0B606;
 Fri,  2 Aug 2019 15:04:53 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  2 Aug 2019 17:04:44 +0200
Message-Id: <20190802150445.10984-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802150445.10984-1-pvorel@suse.cz>
References: <20190802150445.10984-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 3/4] build.sh: Respect user defined CFLAGS and
 LDFLAGS
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

Therefore it was needed to export them and not pass as a parameter.

It will be used for travis settings in next commit, but also can be
handy for using build.sh in local development.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 build.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/build.sh b/build.sh
index 634ef51b5..3da2adf55 100755
--- a/build.sh
+++ b/build.sh
@@ -21,7 +21,8 @@ CC=gcc
 build_32()
 {
 	echo "===== 32-bit ${1}-tree build into $PREFIX ====="
-	build $1 CFLAGS="-m32" LDFLAGS="-m32"
+	export CFLAGS="-m32 $CFLAGS" LDFLAGS="-m32 $LDFLAGS"
+	build $1
 }
 
 build_native()
@@ -63,7 +64,7 @@ build_out_tree()
 
 	mkdir -p $build
 	cd $build
-	run_configure $tree/configure $CONFIGURE_OPTS_OUT_TREE CC="$CC" $@
+	run_configure $tree/configure $CONFIGURE_OPTS_OUT_TREE CC="$CC" CFLAGS="$CFLAGS" CXXFLAGS="$CXXFLAGS" LDFLAGS="$LDFLAGS" $@
 
 	echo "=== build ==="
 	make $make_opts
-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
