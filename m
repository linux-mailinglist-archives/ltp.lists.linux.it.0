Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B8C44456E
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Nov 2021 17:08:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 55DAA3C72C7
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Nov 2021 17:08:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 733E63C0EBB
 for <ltp@lists.linux.it>; Wed,  3 Nov 2021 17:08:25 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 59662200763
 for <ltp@lists.linux.it>; Wed,  3 Nov 2021 17:08:20 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 99621218D9;
 Wed,  3 Nov 2021 16:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635955699; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=r9QT5w/szyrsCs3RcnV4fuV71Eqo2Y4fM7f086UKgq8=;
 b=y1Hw9/gtBpiT4EANtzRMfKKDCGVv3Ky8vMzUiHIeJe3ADv9xFnGjQno7d/Myi9YVRunHQl
 WjLmykM/Ag76cW+rCHXHxMP+PmpCU+T0T61WozEBG04t2J/6E2+4XYNrezaQTN9m5/KhZV
 8WzujMRsYF+BZ/P9wj4NQFpT/Su4870=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635955699;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=r9QT5w/szyrsCs3RcnV4fuV71Eqo2Y4fM7f086UKgq8=;
 b=WtPIFe5j8/lr0MeKsK1IkLYJjEV5sDD21oLRRNQjf8ts+7pYbIplA270AhNUUSGFrGHY55
 qogr2EImObbgMcAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7083B13C91;
 Wed,  3 Nov 2021 16:08:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JwItGPOzgmEMTgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 03 Nov 2021 16:08:19 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  3 Nov 2021 17:08:15 +0100
Message-Id: <20211103160815.20282-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 1/1] configure.ac: Print lib & docparse summary
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

Due many checks of structs, members etc are library presence and
docparser config results quite hidden. Print them in the end.

Disadvantage of this is need to keep sync m4 macros with configure.ac
also quite easily results can be misinterpreted.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

If we want some summary I don't see much better way how to achieve it
with autoconf. Maybe we could introduce extra variables in m4 macros
which would be used in configure.ac.

Kind regards,
Petr

 configure.ac | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/configure.ac b/configure.ac
index 5bf3c52ec..a8b9c6b90 100644
--- a/configure.ac
+++ b/configure.ac
@@ -375,3 +375,22 @@ test "x$with_tirpc" = xyes && LTP_CHECK_TIRPC
 LTP_DETECT_HOST_CPU
 
 AC_OUTPUT
+
+cat << EOF
+
+LIBRARIES
+keyutils: ${have_keyutils:-no}
+libacl: ${have_libacl:-no}
+libaio: ${have_libaio:-no} (aio: ${have_aio:-no})
+libcap: $cap_libs (newer: ${has_newer_libcap:-no})
+libcrypto: $have_libcrypto (sha: ${have_sha:-no})
+libmnl: ${have_libmnl:-no}
+libnuma: ${have_libnuma:-no} (headers: ${have_numa_headers:-no}, v2 headers: ${have_numa_headers_v2:-no})
+libtirpc: ${have_libtirpc:-no}
+glibc SUN-RPC: ${have_rpc_glibc:-no}
+
+METADATA
+metadata generator: $with_metadata_generator
+HTML metadata: $with_metadata_html
+PDF metadata: $with_metadata_pdf
+EOF
-- 
2.33.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
