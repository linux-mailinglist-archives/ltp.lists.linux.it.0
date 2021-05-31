Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3326D3965F0
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 18:51:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C15743C97DA
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 18:51:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 12C3E3C2A0E
 for <ltp@lists.linux.it>; Mon, 31 May 2021 18:51:01 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 801A0600683
 for <ltp@lists.linux.it>; Mon, 31 May 2021 18:51:00 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 115811FD30;
 Mon, 31 May 2021 16:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622479860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xdKhzwGnH/cKjRx+OFci4wuI8qfbV2Bppmm53tgkk4A=;
 b=b0s5a3LzLk6WD32VTLXT5m/u5qjhYPpE52ZEOygcJr9+TGzOufx/PcZk3of4EJobsHVkHN
 drr7Wkv3xAIG7mj0w9JNLsThe7lRgAsymNRdZDg5jnvyn/Flgu11zfNwkMdT9fiRR5RhoE
 k3xZe/ZRQUHM2GglSnNGmbep+qrhOkU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622479860;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xdKhzwGnH/cKjRx+OFci4wuI8qfbV2Bppmm53tgkk4A=;
 b=kcXC11Fq9YfyEj5Tpey0rnW/09cM/qYMXzgMI615s4fLFffKY6lXpS+m0defLhKS4fHX2j
 DpeJLDJCYRHDzHCA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 8E066118DD;
 Mon, 31 May 2021 16:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622479859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xdKhzwGnH/cKjRx+OFci4wuI8qfbV2Bppmm53tgkk4A=;
 b=gkvvGx0tKQWbmEROlQTV+j9cPBORgJAZ+CbIRIoJuMFkjfEFkuM/OBoQQyX2wNhWQMx/01
 Qp8QZOjUEvX1O70Z63q7s+hrW50RMLwgx5Mnx1aTZDzsIonuVm1oUdHEv4QL4X49SjSOFF
 Tx9STBujjFTQzvmH4IvtUTDMO2YvMUI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622479859;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xdKhzwGnH/cKjRx+OFci4wuI8qfbV2Bppmm53tgkk4A=;
 b=MwAfBI+1AImm5eD4Cr3IV2PKl3eg/BQTjJhp4Hx+VEIX+4A/51i2ag0OBs6iGokxQEmcqU
 EMt8EpjpgsnDu9BA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id OKqhIfMTtWBISQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 31 May 2021 16:50:59 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 31 May 2021 18:50:51 +0200
Message-Id: <20210531165052.8731-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210531165052.8731-1-pvorel@suse.cz>
References: <20210531165052.8731-1-pvorel@suse.cz>
MIME-Version: 1.0
Authentication-Results: imap.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.00
X-Spamd-Result: default: False [0.00 / 100.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 REPLY(-4.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; RCPT_COUNT_SEVEN(0.00)[7];
 MID_CONTAINS_FROM(1.00)[]; RCVD_NO_TLS_LAST(0.10)[];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_COUNT_TWO(0.00)[2]
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] CI: Rename travis script directory
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
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a preparation for moving from Travis CI to GitHub Actions.

Link: https://github.com/linux-test-project/ltp/issues/761

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 .travis.yml                            | 2 +-
 {travis => ci}/alpine.sh               | 0
 {travis => ci}/centos.sh               | 0
 {travis => ci}/debian.cross-compile.sh | 0
 {travis => ci}/debian.i386.sh          | 0
 {travis => ci}/debian.minimal.sh       | 0
 {travis => ci}/debian.sh               | 0
 {travis => ci}/fedora.sh               | 0
 {travis => ci}/opensuse.sh             | 0
 {travis => ci}/tumbleweed.sh           | 0
 {travis => ci}/ubuntu.sh               | 0
 11 files changed, 1 insertion(+), 1 deletion(-)
 rename {travis => ci}/alpine.sh (100%)
 rename {travis => ci}/centos.sh (100%)
 rename {travis => ci}/debian.cross-compile.sh (100%)
 rename {travis => ci}/debian.i386.sh (100%)
 rename {travis => ci}/debian.minimal.sh (100%)
 rename {travis => ci}/debian.sh (100%)
 rename {travis => ci}/fedora.sh (100%)
 rename {travis => ci}/opensuse.sh (100%)
 rename {travis => ci}/tumbleweed.sh (100%)
 rename {travis => ci}/ubuntu.sh (100%)

diff --git a/.travis.yml b/.travis.yml
index 5d759dab4..d0c88da45 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -128,4 +128,4 @@ script:
     - if [ "$METADATA" = "asciidoctor-pdf" ]; then CONFIGURE_OPT_EXTRA="--with-metadata-generator=asciidoctor --enable-metadata-pdf"; fi
     - if [ ! "$TREE" ]; then TREE="in"; fi
     - case $VARIANT in cross-compile*) BUILD="cross";; i386) BUILD="32";; *) BUILD="native";; esac
-    - $CONTAINER run $CONTAINER_ARGS -t ltp /bin/sh -c "cd travis && ./$INSTALL.sh && if [ \"$VARIANT\" ]; then ARCH=\"$ARCH\" ./$INSTALL.$VARIANT.sh; fi && CONFIGURE_OPT_EXTRA=\"$CONFIGURE_OPT_EXTRA\" ../build.sh -o $TREE -t $BUILD -c $CC $INSTALL_OPT"
+    - $CONTAINER run $CONTAINER_ARGS -t ltp /bin/sh -c "cd ci && ./$INSTALL.sh && if [ \"$VARIANT\" ]; then ARCH=\"$ARCH\" ./$INSTALL.$VARIANT.sh; fi && CONFIGURE_OPT_EXTRA=\"$CONFIGURE_OPT_EXTRA\" ../build.sh -o $TREE -t $BUILD -c $CC $INSTALL_OPT"
diff --git a/travis/alpine.sh b/ci/alpine.sh
similarity index 100%
rename from travis/alpine.sh
rename to ci/alpine.sh
diff --git a/travis/centos.sh b/ci/centos.sh
similarity index 100%
rename from travis/centos.sh
rename to ci/centos.sh
diff --git a/travis/debian.cross-compile.sh b/ci/debian.cross-compile.sh
similarity index 100%
rename from travis/debian.cross-compile.sh
rename to ci/debian.cross-compile.sh
diff --git a/travis/debian.i386.sh b/ci/debian.i386.sh
similarity index 100%
rename from travis/debian.i386.sh
rename to ci/debian.i386.sh
diff --git a/travis/debian.minimal.sh b/ci/debian.minimal.sh
similarity index 100%
rename from travis/debian.minimal.sh
rename to ci/debian.minimal.sh
diff --git a/travis/debian.sh b/ci/debian.sh
similarity index 100%
rename from travis/debian.sh
rename to ci/debian.sh
diff --git a/travis/fedora.sh b/ci/fedora.sh
similarity index 100%
rename from travis/fedora.sh
rename to ci/fedora.sh
diff --git a/travis/opensuse.sh b/ci/opensuse.sh
similarity index 100%
rename from travis/opensuse.sh
rename to ci/opensuse.sh
diff --git a/travis/tumbleweed.sh b/ci/tumbleweed.sh
similarity index 100%
rename from travis/tumbleweed.sh
rename to ci/tumbleweed.sh
diff --git a/travis/ubuntu.sh b/ci/ubuntu.sh
similarity index 100%
rename from travis/ubuntu.sh
rename to ci/ubuntu.sh
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
