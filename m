Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 522463C9C09
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 11:38:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 957A43C8642
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 11:38:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 78F3C3C65D4
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 11:38:27 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 782F8200FC1
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 11:38:26 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CAE3022978;
 Thu, 15 Jul 2021 09:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626341905;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4Ar4XmBbczgFDfsgZBgwXbeBzG2+8H1My194hNh2Le0=;
 b=ntTec2PmNQCh3IXfvgiEJPNNYuVSzfudZYQ9ayeWQH1PdEWflbFgNX5zXx1X+o94f1mvaN
 1CnQqUqCJ91TpfAAl8mz/JsbN8JwgDv/LJsAGNUrbFx0f5A+GP78f/Mcfs7TGEsGGO+zdm
 4K29KJ9mnw88FUQT3uxblZzTKi6nrdw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626341905;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4Ar4XmBbczgFDfsgZBgwXbeBzG2+8H1My194hNh2Le0=;
 b=JGkrD1Mt2dUwaCRC08t5qbBk5omkyj8RZzbr2wsjPLQkbSHp3gXrQm0NcEQjEQ890lmPHt
 5J/HqiwSj+13fmDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9B14F13C30;
 Thu, 15 Jul 2021 09:38:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id n9QiIxEC8GDRCQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 15 Jul 2021 09:38:25 +0000
Date: Thu, 15 Jul 2021 11:38:23 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <YPACD9fqq2HpD3gC@pevik>
References: <20210715083052.7138-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210715083052.7138-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 0/5] 	Run tests in CI
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

Hi Cyril,

> Hi,

> changes v5->v6:
> * add new commit suggested by Cyril: "lib: Print Summary: into stderr"
> * fix final error evaluation for C tests in runtest.sh
> * run C and shell test separately (test-c and test-shell instead of
>   test). Having them separate helps to easily navigate in CI. This
>   required to add support to build.sh.

> Hope this is a final version.

Verified slightly modified version (see diff below):
https://github.com/pevik/ltp/actions/runs/1033374720

FYI I'd probably keep first commit "ib: Print Summary: into stderr" although it
should not be needed for CI as 1>&2 redirection fixed the output.

Can I merge it with your ack?

Kind regards,
Petr

diff --git ci/debian.sh ci/debian.sh
index a609da887..e929452ff 100755
--- ci/debian.sh
+++ ci/debian.sh
@@ -22,6 +22,7 @@ $apt \
 	clang \
 	gcc \
 	git \
+	iproute2 \
 	libacl1 \
 	libacl1-dev \
 	libaio-dev \
diff --git ci/fedora.sh ci/fedora.sh
index 959f3af20..dc1293aa5 100755
--- ci/fedora.sh
+++ ci/fedora.sh
@@ -13,6 +13,7 @@ $yum \
 	gcc \
 	git \
 	findutils \
+	iproute \
 	numactl-devel \
 	libtirpc \
 	libtirpc-devel \
diff --git ci/tumbleweed.sh ci/tumbleweed.sh
index ab622e05c..f1e7252f2 100755
--- ci/tumbleweed.sh
+++ ci/tumbleweed.sh
@@ -13,6 +13,7 @@ $zyp \
 	gcc \
 	git \
 	gzip \
+	iproute2 \
 	make \
 	kernel-default-devel \
 	keyutils-devel \
diff --git lib/newlib_tests/runtest.sh lib/newlib_tests/runtest.sh
index bd7995f3b..a11d6ed1a 100755
--- lib/newlib_tests/runtest.sh
+++ lib/newlib_tests/runtest.sh
@@ -79,7 +79,7 @@ run_tests()
 
 	for i in $vars; do
 		runtest_res TINFO "* $i"
-		./$i
+		./$i 1>&2
 		res=$?
 
 		[ $res -ne 0 -a $res -ne 32 ] && ret=1
@@ -94,7 +94,6 @@ run_tests()
 			*) runtest_brk TBROK "Error: unknown failure, exit code: $res";;
 		esac
 		runtest_res
-		sync
 	done
 
 	runtest_res TINFO "=== $target TEST RESULTS ==="

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
