Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC29A2AD7F0
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Nov 2020 14:46:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 29EDA3C5365
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Nov 2020 14:46:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 7B3CC3C2F4B
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 14:46:28 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 052E81A00A21
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 14:46:27 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 287B1ABCC;
 Tue, 10 Nov 2020 13:46:27 +0000 (UTC)
Date: Tue, 10 Nov 2020 14:46:25 +0100
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20201110134625.GA6482@pevik>
References: <20201110120035.20543-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201110120035.20543-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] travis: Add libefivar support
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

Hi,

> Travis CI:
> https://travis-ci.org/github/pevik/ltp/builds/742684375

Looks like Debian does not ship libefivar-dev for ppc64el
https://travis-ci.org/github/pevik/ltp/jobs/742684377

Kind regards,
Petr

Fix:
diff --git travis/debian.cross-compile.sh travis/debian.cross-compile.sh
index e27c6c9bc..69ddf225c 100755
--- travis/debian.cross-compile.sh
+++ travis/debian.cross-compile.sh
@@ -2,6 +2,8 @@
 # Copyright (c) 2018-2020 Petr Vorel <pvorel@suse.cz>
 set -ex
 
+apt="apt install -y --no-install-recommends"
+
 if [ -z "$ARCH" ]; then
 	echo "missing \$ARCH!" >&2
 	exit 1
@@ -17,9 +19,11 @@ esac
 dpkg --add-architecture $ARCH
 apt update
 
-apt install -y --no-install-recommends \
+$apt \
 	gcc-${gcc_arch}-linux-gnu \
 	libc6-dev-${ARCH}-cross \
-	libefivar-dev:$ARCH \
 	libmnl-dev:$ARCH \
 	libtirpc-dev:$ARCH
+
+# efivar is currently missing on ppc64el
+$apt libefivar-dev:$ARCH || true

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
