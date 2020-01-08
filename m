Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9320134126
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jan 2020 12:48:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6AC9F3C2516
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jan 2020 12:48:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id B290F3C24D3
 for <ltp@lists.linux.it>; Wed,  8 Jan 2020 12:48:45 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 267D81000B48
 for <ltp@lists.linux.it>; Wed,  8 Jan 2020 12:48:44 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 44429ABED;
 Wed,  8 Jan 2020 11:48:44 +0000 (UTC)
Date: Wed, 8 Jan 2020 12:48:42 +0100
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20200108114842.GA29068@dell5510>
References: <20200108103413.29096-1-pvorel@suse.cz>
 <20200108103413.29096-4-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200108103413.29096-4-pvorel@suse.cz>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/4] travis: Merge debian.cross-compile.*.sh
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
Cc: Daniel Gryniewicz <dang@redhat.com>, Mike Frysinger <vapier@gentoo.org>,
 Steve Dickson <SteveD@redhat.com>, libtirpc-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

this needs to be fixed, otherwise Debian cross compile jobs fail.

Kind regards,
Petr

diff --git travis/debian.cross-compile.sh travis/debian.cross-compile.sh
index 2f2b7a70c..8557b832b 100755
--- travis/debian.cross-compile.sh
+++ travis/debian.cross-compile.sh
@@ -3,10 +3,16 @@
 set -e
 
 if [ -z "$ARCH" ]; then
-	echo "missing \$ARCH!"
+	echo "missing \$ARCH!" >&2
 	exit 1
 fi
 
+case "$ARCH" in
+arm64) gcc_arch="aarch64";;
+ppc64el) gcc_arch="powerpc64le";;
+*) echo "unsupported arch: '$1'!" >&2; exit 1;;
+esac
+
 dpkg --add-architecture $ARCH
 apt update
 
@@ -17,6 +23,6 @@ none) EXTRA_PACKAGES=;;
 esac
 
 apt install -y --no-install-recommends \
-	gcc-${ARCH}-linux-gnu \
+	gcc-${gcc_arch}-linux-gnu \
 	libc6-dev-${ARCH}-cross \
 	$EXTRA_PACKAGES

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
