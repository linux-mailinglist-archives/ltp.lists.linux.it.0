Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC567A7806
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Sep 2023 11:54:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 67DDB3CE305
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Sep 2023 11:54:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D059C3CDEC0
 for <ltp@lists.linux.it>; Wed, 20 Sep 2023 11:53:24 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6A03A1A02397
 for <ltp@lists.linux.it>; Wed, 20 Sep 2023 11:53:23 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 374B71FE9B;
 Wed, 20 Sep 2023 09:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1695203603; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XSTBoCI06chwtZlwyZQgubkZgkXGogGp7HD7XhK+JfE=;
 b=BhUyoeVwgc8Dbk5ynPWipRCf0Frvzu8JbfxtjrtjHs+D+72uYpjkabkdX8seZfSJ8UtkE+
 sOJVsb9ocVhqL902fW0RXV6QMqw5AUjUIJywx71iUfPXwPUSsrwSFdYuQpeCmMbaTPsA7g
 nWT9uStjsu6Uz2qhfn0jLkdXocxcfQg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1695203603;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XSTBoCI06chwtZlwyZQgubkZgkXGogGp7HD7XhK+JfE=;
 b=R7ztMay/XZMDUmbYLVrg2NHi9qGPwtwQbRlcFjNh23isDhm741F27FJnc7RkQ+ksskwStU
 Mb30+AjMPDjif+BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F36A41333E;
 Wed, 20 Sep 2023 09:53:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KDSwORLBCmVpBQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 20 Sep 2023 09:53:22 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 20 Sep 2023 11:53:18 +0200
Message-Id: <20230920095318.340582-6-pvorel@suse.cz>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920095318.340582-1-pvorel@suse.cz>
References: <20230920095318.340582-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 5/5] doc: Update release procedure
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>,
 Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

* Mention release preparation (Li Wang).
* Replace skeleton commands with the release scripts.
* Update link to the release announcement.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 doc/LTP-Release-Procedure.asciidoc | 111 +++++++++++++++++++++--------
 1 file changed, 80 insertions(+), 31 deletions(-)

diff --git a/doc/LTP-Release-Procedure.asciidoc b/doc/LTP-Release-Procedure.asciidoc
index cd7682fb8..26d85d1fa 100644
--- a/doc/LTP-Release-Procedure.asciidoc
+++ b/doc/LTP-Release-Procedure.asciidoc
@@ -5,54 +5,103 @@ This page contains quick summary of what needs to be done to do a LTP release. I
 
 NOTE: The string YYYYMMDD should be substituted to the current date.
 
-1. Tag the git
+1. Release eve work
+-------------------
+
+a. Collecting the (must have) patch list for new release
+b. Reviewing and merging the patch list of (a.)
+c. Widely testing, explicitly post results
+d. Tiny fix according to release testing
+e. Writing release note
+
+2. Tag the git
 --------------
 
+Use './tools/tag-release.sh' script, which creates the tag and push it to github.
 [source,sh]
 --------------------------------------------------------------------
-cd ltp
-echo YYYYMMDD > VERSION
-git commit -s -m 'LTP YYYYMMDD' VERSION
-git tag -a YYYYMMDD -m 'LTP YYYYMMDD'
---------------------------------------------------------------------
+$ ./tools/tag-release.sh
+===== git push =====
+echo "new tag: '20230516', previous tag: '20230127'"
+tag 20230516
+Tagger: Person-who-released LTP <foo@example.com>
+Date:   Tue May 16 07:08:27 2023 +0200
 
-2. Push changes to github
--------------------------
-[source,sh]
---------------------------------------------------------------------
-git push
-git push --tags
+LTP 20230516
+-----BEGIN PGP SIGNATURE-----
+
+iQJDBAABCAAtFiEEIBb+pIWLHDazLoM6wN7C7nLzOl8FAmRjD8sPHHB2b3JlbEBz
+...
+-----END PGP SIGNATURE-----
+
+commit 3ebc2dfa85c2445bb68d8c0d66e33c4da1e1b3a7
+gpg: Signature made Tue 16 May 2023 07:08:08 AM CEST
+gpg:                using RSA key 2016FEA4858B1C36B32E833AC0DEC2EE72F33A5F
+...
+Primary key fingerprint: 2016 FEA4 858B 1C36 B32E  833A C0DE C2EE 72F3 3A5F
+Author: Person-who-released LTP <foo@example.com>
+Date:   Tue May 16 07:08:08 2023 +0200
+
+    LTP 20230516
+
+    Signed-off-by: Person-who-released LTP <foo@example.com>
+
+diff --git a/VERSION b/VERSION
+index af4c41fec..ae488c0e7 100644
+--- a/VERSION
++++ b/VERSION
+@@ -1 +1 @@
+-20230127
++20230516
+
+Please check tag and signature. Proceed? [N/y]: y
+===== Creating skeleton file for release notes =====
+Skeleton file for release notes: /tmp/ltp-release-20230516
+
+Pushing changes to upstream git. Proceed? [N/y]: y
+Enumerating objects: 1, done.
+Counting objects: 100% (1/1), done.
+Writing objects: 100% (1/1), 811 bytes | 811.00 KiB/s, done.
+Total 1 (delta 0), reused 1 (delta 0), pack-reused 0
+To github.com:linux-test-project/ltp.git
+ * [new tag]             20230516 -> 20230516
 --------------------------------------------------------------------
 
-3. Prepare tarballs
--------------------
+3. Prepare tarballs and metadata documentation
+----------------------------------------------
 [source,sh]
+Use './tools/create-tarballs-metadata.sh' script.
 --------------------------------------------------------------------
-cd ..
-git clone ltp ltp-full-YYYYMMDD
-cd ltp-full-YYYYMMDD
-# Update mce-inject submodule
-git submodule init
-git submodule update
-# Generate configure script
-make autotools
-# Prepare the archives
-cd ..
-tar -cjf ltp-full-YYYYMMDD.tar.bz2 ltp-full-YYYYMMDD --exclude .git
-tar -cJf ltp-full-YYYYMMDD.tar.xz ltp-full-YYYYMMDD --exclude .git
+$ ./tools/create-tarballs-metadata.sh
+===== git clone =====
+Cloning into 'ltp-full-20230516'...
+done.
+Submodule 'testcases/kernel/mce-test' (git://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/mce-test.git) registered for path 'testcases/kernel/mce-test'
+...
+make[1]: Leaving directory '/home/foo/ltp-release-20230516/ltp-full-20230516/testcases/open_posix_testsuite'
+===== Creating tarballs =====
+===== Creating checksums =====
+===== Creating metadata documentation =====
+checking for a BSD-compatible install... /usr/bin/install -c
+...
+asciidoctor -d book metadata.txt -b xhtml
+make[1]: Leaving directory '/home/foo/ltp-release-20230516/ltp-full-20230516/docparse'
+make: Leaving directory '/home/foo/ltp-release-20230516/ltp-full-20230516/metadata'
+'docparse/metadata.html' -> '/home/foo/ltp-release-20230516/metadata.20230516.html'
+Generated files are in '/home/foo/ltp-release-20230516', upload them to github
 --------------------------------------------------------------------
 
-4. Upload the tarballs to GitHub
---------------------------------
+4. Upload the generated files to GitHub
+---------------------------------------
 
 Click on 'releases' then switch to 'tags' then click on 'Add release notes' there should be 'Attach binaries ...' link at the bottom of the page.
 
-Don't forget to upload md5 and sha-1 sums for the tarballs as well.
+Don't forget to upload checksums for the tarballs and metadata documentation as well.
 
 5. Send release announcement
 ----------------------------
 
-Have a look at http://sourceforge.net/p/ltp/mailman/message/34429656/ to get the idea how it should look.
+Have a look at https://lore.kernel.org/ltp/ZGNiQ1sMGvPU_ETp@yuki/ to get the idea how it should look.
 
 The announcement is send to:
 
@@ -64,4 +113,4 @@ CCed to:
 
 * lwn at lwn.net
 * akpm at linux-foundation.org
-* torvalds at linux-foundation.org.
\ No newline at end of file
+* torvalds at linux-foundation.org.
-- 
2.40.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
