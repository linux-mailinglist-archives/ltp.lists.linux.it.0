Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 667FF4C4301
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Feb 2022 12:02:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 24B133CA16C
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Feb 2022 12:02:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5CE943CA10E
 for <ltp@lists.linux.it>; Fri, 25 Feb 2022 12:02:02 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 92EE320A6C2
 for <ltp@lists.linux.it>; Fri, 25 Feb 2022 12:02:01 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 99FC721128;
 Fri, 25 Feb 2022 11:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1645786920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=40vjwyWwC9d0mkHwHSE7G7Jb+sFVFYAZalZqRRC0fuM=;
 b=m5OeuCyTiKUXPXfHlzd7ywPf6bfPkveoogE3ynpj38B6G4hRswG85tl5/33i6EpbocE4rq
 JyA7/PVbhnN7JE77GmW7Me9lKV4woXDl2LOyGfu8rQ7vorUukP2nqG+t0RWfIya98XJIAS
 qB4QNoHe8FV4dnFPgaMEeGS5qz7IvN0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1645786920;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=40vjwyWwC9d0mkHwHSE7G7Jb+sFVFYAZalZqRRC0fuM=;
 b=d7TOg+Ixmr8Bujblups2IXURs1ZWgvmgYY+qoseqzOSDeEQLe2ufsURFXGgHeSnXVfHwoN
 DffKrkmGOarcR5Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4CBB713519;
 Fri, 25 Feb 2022 11:02:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Esm1ECi3GGJOBAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 25 Feb 2022 11:02:00 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 25 Feb 2022 12:01:52 +0100
Message-Id: <20220225110152.26098-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] ci/debian: Temporarily not require libmm-dev
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

It has been removed from Debian testing, thus it breaks build:
E: Unable to locate package libmm-dev
Error: Process completed with exit code 100.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi all,

do we even need libmm-dev?

https://packages.debian.org/sid/amd64/libmm-dev/filelist
...
/usr/bin/mm-config
/usr/include/mm.h
/usr/lib/libmm.a
/usr/lib/libmm.so

Kind regards,
Petr

 ci/debian.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ci/debian.sh b/ci/debian.sh
index f3dcb6e8d4..fb4c46f0a8 100755
--- a/ci/debian.sh
+++ b/ci/debian.sh
@@ -37,7 +37,6 @@ $apt \
 	libjson-perl \
 	libkeyutils-dev \
 	libkeyutils1 \
-	libmm-dev \
 	libmnl-dev \
 	libnuma-dev \
 	libnuma1 \
@@ -49,6 +48,7 @@ $apt \
 	lsb-release \
 	pkg-config
 
+$apt libmm-dev || true
 $apt ruby-asciidoctor-pdf || true
 $apt asciidoc-dblatex || true
 
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
