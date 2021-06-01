Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6D7397034
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 11:19:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6FE703C8019
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 11:19:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D450D3C291C
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 11:19:51 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0D62E1A01118
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 11:19:50 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 50B412191F;
 Tue,  1 Jun 2021 09:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622539190; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=IotyAk/zzIMH/V3aDIEx1l2B3DezMiyk4YMpEvpWJtI=;
 b=DIqdlgnTjed8Gjjrkm4+xqVv/vyWvoyJ0NR1LvDXkpOt8FP3WHtShLiM+UGR5lCZOQ9WO8
 yjY8g+j39AsjCJ7LNj9urH8iTQftAL4LHSSEwfyiRh7vJC97UKgtqkl0AlAaEpWMRt3n+Z
 n/Nurv6IP9tYe7VjeOBTUMj6mTe02xk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622539190;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=IotyAk/zzIMH/V3aDIEx1l2B3DezMiyk4YMpEvpWJtI=;
 b=QzbE6bYD95O1RzsESZ+VBMdK+TxqLxb9KEyLDtaX3cUVXQ5QGj/TWkT0xCfOb81GrRBU+r
 TaLjwIneny6r45Cw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 95831118DD;
 Tue,  1 Jun 2021 09:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622539189; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=IotyAk/zzIMH/V3aDIEx1l2B3DezMiyk4YMpEvpWJtI=;
 b=W+U4ZgmV14qW3zT/I736RcQ0GqR1sf3LhsLvmlO0/YKwTenUW5w5reVtp/Qz4m75/fSm/0
 ZvBF6O5u7SYZFk0G43+yAsQX5aIQSeZEFrgNNgJ3VuR/vYe/4pX0khDB22QlI121OIeyth
 cPwOuSfQLMMV8WuKivZNQ6XDmGBO4jQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622539189;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=IotyAk/zzIMH/V3aDIEx1l2B3DezMiyk4YMpEvpWJtI=;
 b=iGJ87hV+qM7avKpgDqq4w9Mb56XO8OIsCUgMhsA/PzsKd8M1NSZSssachaMpxnPvgzxnMt
 Nm1na2x/3ZR13ICg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id feHXIrX7tWBkZQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 01 Jun 2021 09:19:49 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  1 Jun 2021 11:19:43 +0200
Message-Id: <20210601091943.6300-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Spam-Score: 4.00
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] CI/debian: Install dblatex
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

To fix missing dependencies:

checking for dblatex... no
configure: WARNING: PDF metadata generation skipped due missing suitable
generator, specify correct generator with
--with-metadata-generator=asciidoc|asciidoctor or use
--disable-metadata|--disable-metadata-html|--disable-metadata-pdf

Fixes: ff9c528f2 ("travis: Install docparse dependencies")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

to be applied on the top of "CI: Move from Travis to GitHub Actions" [1]
(older problem, but fixing on GitHub actions).

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/list/?series=246505

 ci/debian.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ci/debian.sh b/ci/debian.sh
index 743b79001..a609da887 100755
--- a/ci/debian.sh
+++ b/ci/debian.sh
@@ -46,5 +46,6 @@ $apt \
 	pkg-config
 
 $apt ruby-asciidoctor-pdf || true
+$apt asciidoc-dblatex || true
 
 df -hT
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
