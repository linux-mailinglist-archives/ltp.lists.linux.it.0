Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D34A85614
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Apr 2025 10:03:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 423A63CB57B
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Apr 2025 10:03:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 79F7C3CB5AF
 for <ltp@lists.linux.it>; Fri, 11 Apr 2025 10:03:01 +0200 (CEST)
Authentication-Results: in-2.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=andrea.cervesato@suse.de; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E73F168044E
 for <ltp@lists.linux.it>; Fri, 11 Apr 2025 10:03:00 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B6F011F458;
 Fri, 11 Apr 2025 08:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744358562; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gaGMAR1CUML2NyxeaBK2twGK0BSThgMMlTdPZ4LlkIw=;
 b=Z/0Dftz1BNEkkGRf/zl3VYdW5Bde/C/dRsEPo2FKRO8XGqgDJlXYsH4wTDyC16/H9gyB9l
 dQ8ny9lOQLF/4V0B3nCATlQ2YE2Na+MQ84V7un4Tw9vNhREVrep1DKm21W3XuNXX/LbTge
 st+JeFJe5B72OmO+wJWEOUmddM7USS8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744358562;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gaGMAR1CUML2NyxeaBK2twGK0BSThgMMlTdPZ4LlkIw=;
 b=lSpnvgJ9JOsoNGgHJL65hfUZKpKVJ1kIjMTvFGwrL72+vhyT2k/DqF7cQ+88K0+zHFO/gL
 v240toZuC2XvOoAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744358562; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gaGMAR1CUML2NyxeaBK2twGK0BSThgMMlTdPZ4LlkIw=;
 b=Z/0Dftz1BNEkkGRf/zl3VYdW5Bde/C/dRsEPo2FKRO8XGqgDJlXYsH4wTDyC16/H9gyB9l
 dQ8ny9lOQLF/4V0B3nCATlQ2YE2Na+MQ84V7un4Tw9vNhREVrep1DKm21W3XuNXX/LbTge
 st+JeFJe5B72OmO+wJWEOUmddM7USS8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744358562;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gaGMAR1CUML2NyxeaBK2twGK0BSThgMMlTdPZ4LlkIw=;
 b=lSpnvgJ9JOsoNGgHJL65hfUZKpKVJ1kIjMTvFGwrL72+vhyT2k/DqF7cQ+88K0+zHFO/gL
 v240toZuC2XvOoAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A260136A4;
 Fri, 11 Apr 2025 08:02:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CHTJI6LM+GeKDAAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Fri, 11 Apr 2025 08:02:42 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Fri, 11 Apr 2025 10:01:59 +0200
MIME-Version: 1.0
Message-Id: <20250411-patchwork_ci-v4-4-7f3c5ba298a1@suse.com>
References: <20250411-patchwork_ci-v4-0-7f3c5ba298a1@suse.com>
In-Reply-To: <20250411-patchwork_ci-v4-0-7f3c5ba298a1@suse.com>
To: ltp@lists.linux.it
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744358562; l=2208;
 i=andrea.cervesato@suse.com; s=20240812; h=from:subject:message-id;
 bh=3pM43+RhzqH9Otanr+M9tTbHr/GyqgnxFI52qrQ0Y3g=;
 b=I1tvSAs5K8vDtuo7D3u74AZ/gLn1qnL8qbQLfqyo97iweg+/d8VSjAxl3pxg4JO7Sk9SlijLv
 9kPOVl7fOVRBaooAFLDDS5iGUjqrVN7bIpA41OWrGbikkqNtdn/+5SQ
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=RG/nLJ5snb1tLKGwSORQXBJ5XA4juT0WF2Pc/lq9meo=
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v4 4/4] ci: apply patchwork series in ci-docker-build
 workflow
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

From: Andrea Cervesato <andrea.cervesato@suse.com>

Modify ci-docker-build workflow in order to apply untested new
patchwork patch-series inside the current branch and to send back
results in the patchwork instance.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 .github/workflows/ci-docker-build.yml | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/.github/workflows/ci-docker-build.yml b/.github/workflows/ci-docker-build.yml
index 44dcca055018a1fb06541a788e3152239aea2e66..ebb588a43e2a5d34df5bff2e325cfb28f3e06d08 100644
--- a/.github/workflows/ci-docker-build.yml
+++ b/.github/workflows/ci-docker-build.yml
@@ -1,7 +1,19 @@
 # Copyright (c) 2021-2024 Petr Vorel <pvorel@suse.cz>
 
 name: "Test building in various distros in Docker"
-on: [push, pull_request]
+on:
+  push:
+  pull_request:
+  workflow_dispatch:
+    inputs:
+      SERIES_ID:
+        description: LTP patch series ID
+        required: false
+        default: ''
+      SERIES_MBOX:
+        description: LTP patch series URL
+        required: false
+        default: ''
 
 permissions:
   contents: read # to fetch code (actions/checkout)
@@ -125,6 +137,12 @@ jobs:
     - name: Compiler version
       run: $CC --version
 
+    - name: Apply Patchwork series
+      if: inputs.SERIES_ID != '' && inputs.SERIES_MBOX != ''
+      env:
+        PATCHWORK_TOKEN: ${{ secrets.PATCHWORK_TOKEN }}
+      run: ./ci/patchwork-ci.sh apply ${{ inputs.SERIES_ID }} ${{ inputs.SERIES_MBOX }}
+
     - name: ver_linux
       run: ./ver_linux
 
@@ -158,3 +176,14 @@ jobs:
       run: |
         if [ "$MAKE_INSTALL" = 1 ]; then INSTALL_OPT="-i"; fi
         ./build.sh -r install -o ${TREE:-in} $INSTALL_OPT
+
+    - name: Send results to Patchwork
+      if: always() && inputs.SERIES_ID != '' && inputs.SERIES_MBOX != ''
+      env:
+        PATCHWORK_TOKEN: ${{ secrets.PATCHWORK_TOKEN }}
+      run: |
+        ./ci/patchwork-ci.sh check \
+          "${{ inputs.SERIES_ID }}" \
+          "${{ github.server_url }}/${{ github.repository }}/actions/runs/${{ github.run_id }}" \
+          "${{ matrix.container }}" \
+          "${{ job.status }}"

-- 
2.43.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
