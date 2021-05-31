Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECB43965EC
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 18:51:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C8FC83C909F
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 18:51:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CFA103C2A0E
 for <ltp@lists.linux.it>; Mon, 31 May 2021 18:51:00 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DB691200C00
 for <ltp@lists.linux.it>; Mon, 31 May 2021 18:50:59 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 076672191B;
 Mon, 31 May 2021 16:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622479859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4NKqHgVo3lxYZS6QkPYburYU1nO7C1M051mqycWjn80=;
 b=jft3Akv1t8pzhpF+d37VYUVnFPTbkSiXr1OIu96RjpXYWwpmBDQ6AQGLl/DpfciQ8Cm7np
 3B367dXeYLqHBwe58tAcwlW4fN9KoXdF9rZtmKsOmmYjynpKX2atGwZifO4gvn+Kl5dIBe
 pusxKGbo+aAxuGXNWNV0Gi82miSPLSs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622479859;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4NKqHgVo3lxYZS6QkPYburYU1nO7C1M051mqycWjn80=;
 b=onjusQuXQPsQxpLMJrCHYisrys6s9NxA0sXt2bRNYjBN2j1rvnOGr23PtlY49t+S0pMq3X
 +dKiv6uEODGyC4AA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 4ADF9118DD;
 Mon, 31 May 2021 16:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622479858; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4NKqHgVo3lxYZS6QkPYburYU1nO7C1M051mqycWjn80=;
 b=GdHDUANNycmN4Sou1rNgt/IgUdkwejeJTmT5dou9kR64gj8bJNuJbBJeUb2MTJcC5wpjhF
 dpFC5PeBuOnYBoaNOmPdEFfzYhlqCY1LKrhPM3s0lwb98RDZWyjWM6x+adWqvq7VR7Xuhq
 hYmcvBVNFIcTpz1B6cmILg3sVW1EAxg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622479858;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4NKqHgVo3lxYZS6QkPYburYU1nO7C1M051mqycWjn80=;
 b=vKOBTuO9BrNBpNIeshqaVJp7JZ4aHnLjjrx+r5veQ7GZMLLkMDzSXjrDIGkvMfPrrGNHI4
 ZT74x2tury0fcqAA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id nx2WDvITtWBISQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 31 May 2021 16:50:58 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 31 May 2021 18:50:49 +0200
Message-Id: <20210531165052.8731-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: imap.suse.de;
	none
X-Spam-Score: 4.00
X-Spamd-Result: default: False [4.00 / 100.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 BROKEN_CONTENT_TYPE(1.50)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; RCPT_COUNT_SEVEN(0.00)[7];
 MID_CONTAINS_FROM(1.00)[]; RCVD_NO_TLS_LAST(0.10)[];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_COUNT_TWO(0.00)[2]
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 0/3] CI: Move from Travis to GitHub Actions
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

Hi,

Travis often false positive due "pull rate limit" issue [1],
thus I decided to finally switch to GitHub Actions.

Also using GitHub native CI allows more advanced features
(e.g. update wiki with doc/*.txt, nightly build docparser doc).

Whole thing is tested [2].

I rewritten build.sh, added -r step.
It's ugly, using commands in yaml would be more readable. But I'd prefer
1) not writting shell in yaml 2) have build script for local use.

Please comment, test.

Kind regards,
Petr

[1] https://github.com/linux-test-project/ltp/issues/761
[2] https://github.com/pevik/ltp/actions/runs/893331703

Petr Vorel (3):
  build.sh: Rewrite to allow running certain step
  CI: Rename travis script directory
  CI: Move from Travis to GitHub Actions

 .github/workflows/ci.yml               | 154 +++++++++++++++++++
 .travis.yml                            | 131 ----------------
 build.sh                               | 198 ++++++++++++++-----------
 {travis => ci}/alpine.sh               |   0
 {travis => ci}/centos.sh               |   0
 {travis => ci}/debian.cross-compile.sh |   0
 {travis => ci}/debian.i386.sh          |   0
 {travis => ci}/debian.minimal.sh       |   0
 {travis => ci}/debian.sh               |   0
 {travis => ci}/fedora.sh               |   0
 {travis => ci}/opensuse.sh             |   0
 {travis => ci}/tumbleweed.sh           |   0
 {travis => ci}/ubuntu.sh               |   0
 13 files changed, 262 insertions(+), 221 deletions(-)
 create mode 100644 .github/workflows/ci.yml
 delete mode 100644 .travis.yml
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

-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
