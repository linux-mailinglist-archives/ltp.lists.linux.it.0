Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2823C4DB3E4
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Mar 2022 16:04:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA76F3C93FD
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Mar 2022 16:04:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 489DE3C0EA4
 for <ltp@lists.linux.it>; Wed, 16 Mar 2022 16:04:34 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 55F491000ED3
 for <ltp@lists.linux.it>; Wed, 16 Mar 2022 16:04:33 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6009321123;
 Wed, 16 Mar 2022 15:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1647443073; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=aHTCEfiMj6KyAtc1C2N7f+v+mOSFGbSpGRPJs8XZoSQ=;
 b=kQ0Q83w2GAc25XZk24/nKvjTDJvp6zrI+sZu+Dw0FWmJ/fVE0KA7Gy2uvjPe1SbiOTjg/j
 GSyFMKq78Md+g51xrBwVMqD4wG0MzN0XH7ELQ9fYkrkFMgjLLe9fPdzAfQinzSlWAa8fpi
 iWz8PP4IOZbhcYiobJRUvFEH44+TCoQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1647443073;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=aHTCEfiMj6KyAtc1C2N7f+v+mOSFGbSpGRPJs8XZoSQ=;
 b=1jKbYMslJJo0Fd55l0H3YyWBZEO6GqTxifKZ3VoOyzV5pgHqhVLb9z2UhRde8yoKf9+dwr
 ii3J/M5KRuuEnMDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1472A139BD;
 Wed, 16 Mar 2022 15:04:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 23nnAIH8MWJcHQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 16 Mar 2022 15:04:33 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 16 Mar 2022 16:04:29 +0100
Message-Id: <20220316150429.2873-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [RFC][PATCH 1/1] ci: Ubuntu xenial -> bionic
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

Ubuntu 16.04 LTS xenial EOL was in 2021-04.
Replace it with 18.04 LTS bionic (EOL 2023-04).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

according to distrowatch.com xenial EOL was in 2021-04 [1].
Looking into Ubuntu docs, Xenial is in Extended Security Maintenance
(ESM) phase. That explain why repos are still available.
Do we want to move on to bionic (or even focal)?

Kind regards,
Petr

[1] https://distrowatch.com/table.php?distribution=ubuntu
[2] https://ubuntu.com/about/release-cycle

 .github/workflows/ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index c268ba41c7..fe28e4d055 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -99,7 +99,7 @@ jobs:
               METADATA: asciidoctor
               TREE: out
 
-          - container: "ubuntu:xenial"
+          - container: "ubuntu:bionic"
             env:
               CC: gcc
               METADATA: asciidoc-pdf
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
