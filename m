Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C2415A2C107
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Feb 2025 11:56:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 709253C9374
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Feb 2025 11:56:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B1BC13C2F48
 for <ltp@lists.linux.it>; Fri,  7 Feb 2025 11:56:04 +0100 (CET)
Authentication-Results: in-7.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.131; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id F2096201105
 for <ltp@lists.linux.it>; Fri,  7 Feb 2025 11:56:03 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5C18C1F443;
 Fri,  7 Feb 2025 10:56:03 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3242F13AC1;
 Fri,  7 Feb 2025 10:56:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EMI2C8PmpWddeQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 07 Feb 2025 10:56:03 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  7 Feb 2025 11:55:47 +0100
Message-ID: <20250207105551.1736356-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250207105551.1736356-1-pvorel@suse.cz>
References: <20250207105551.1736356-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 5C18C1F443
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 2/6] github: Stop building asciidoc{,
 tor} documentation
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

It will be removed.

$CONFIGURE_OPT_EXTRA is kept in build.sh, if somebody wants to use it
for a local build (unused in CI).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 .github/workflows/ci-docker-build.yml | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/.github/workflows/ci-docker-build.yml b/.github/workflows/ci-docker-build.yml
index f33dd83566..44dcca0550 100644
--- a/.github/workflows/ci-docker-build.yml
+++ b/.github/workflows/ci-docker-build.yml
@@ -49,7 +49,6 @@ jobs:
           - container: "alpine:latest"
             env:
               CC: gcc
-              METADATA: asciidoctor
 
           # build with minimal dependencies
           - container: "debian:stable"
@@ -66,13 +65,11 @@ jobs:
           - container: "quay.io/centos/centos:stream9"
             env:
               CC: gcc
-              METADATA: asciidoc-pdf
               TREE: out
 
           - container: "debian:testing"
             env:
               CC: gcc
-              METADATA: asciidoctor-pdf
 
           - container: "debian:oldstable"
             env:
@@ -83,33 +80,27 @@ jobs:
             env:
               CC: clang
               MAKE_INSTALL: 1
-              METADATA: asciidoctor-pdf
 
           - container: "opensuse/leap:latest"
             env:
               CC: gcc
-              METADATA: asciidoc-pdf
 
           - container: "debian:oldstable"
             env:
               CC: gcc
-              METADATA: asciidoctor
 
           - container: "debian:testing"
             env:
               CC: clang
-              METADATA: asciidoctor-pdf
 
           - container: "ubuntu:jammy"
             env:
               CC: gcc
-              METADATA: asciidoctor
               TREE: out
 
           - container: "ubuntu:bionic"
             env:
               CC: gcc
-              METADATA: asciidoc-pdf
 
     container:
       image: ${{ matrix.container }}
@@ -142,11 +133,8 @@ jobs:
 
     - name: Configure
       run: |
-        if [ "$METADATA" = "asciidoc-pdf" ]; then CONFIGURE_OPT_EXTRA="--with-metadata-generator=asciidoc --enable-metadata-pdf"; fi
-        if [ "$METADATA" = "asciidoctor" ]; then CONFIGURE_OPT_EXTRA="--with-metadata-generator=asciidoctor"; fi
-        if [ "$METADATA" = "asciidoctor-pdf" ]; then CONFIGURE_OPT_EXTRA="--with-metadata-generator=asciidoctor --enable-metadata-pdf"; fi
         case "$VARIANT" in cross-compile*) BUILD="cross";; i386) BUILD="32";; *) BUILD="native";; esac
-        CONFIGURE_OPT_EXTRA="$CONFIGURE_OPT_EXTRA" ./build.sh -r configure -o ${TREE:-in} -t $BUILD -c $CC
+        ./build.sh -r configure -o ${TREE:-in} -t $BUILD -c $CC
 
     - name: Compile
       run: ./build.sh -r build -o ${TREE:-in}
-- 
2.47.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
