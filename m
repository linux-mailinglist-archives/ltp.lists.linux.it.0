Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F3E9E6B0C
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Dec 2024 10:50:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6DA083E6861
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Dec 2024 10:50:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D496A3CEFC7
 for <ltp@lists.linux.it>; Fri,  6 Dec 2024 10:49:58 +0100 (CET)
Authentication-Results: in-5.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3E2CF610238
 for <ltp@lists.linux.it>; Fri,  6 Dec 2024 10:49:57 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2466821190;
 Fri,  6 Dec 2024 09:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1733478597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=JQPTKpu9TbL1L43mjI1YRu1GbZcGQWD/ef4nrUL/8sA=;
 b=jqjK9GLJ6w3uIejuVqerWmu77qSdYmE/BwbGEGQL9LJwPLlywebLY2QpcvI/TFJXXA9JgA
 4uwYz4Gl4Why3yO/JCfmSQTSdbWcMgVrnibcr+jc3vZp1e8ag94+B9A7r2O2EYGD5hbuKd
 ea1kBbM/Mb+7rttSYtDSxWUaqF2Cg+I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1733478597;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=JQPTKpu9TbL1L43mjI1YRu1GbZcGQWD/ef4nrUL/8sA=;
 b=ZqdNH2fuHHG9OlZQhCacsUO2yQuNRjtd4l27Bw3+psUu4bbI2+z5YCGSptvJc6B/AaoBOD
 7cIieCXaN1iRXbAg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=jqjK9GLJ;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=ZqdNH2fu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1733478597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=JQPTKpu9TbL1L43mjI1YRu1GbZcGQWD/ef4nrUL/8sA=;
 b=jqjK9GLJ6w3uIejuVqerWmu77qSdYmE/BwbGEGQL9LJwPLlywebLY2QpcvI/TFJXXA9JgA
 4uwYz4Gl4Why3yO/JCfmSQTSdbWcMgVrnibcr+jc3vZp1e8ag94+B9A7r2O2EYGD5hbuKd
 ea1kBbM/Mb+7rttSYtDSxWUaqF2Cg+I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1733478597;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=JQPTKpu9TbL1L43mjI1YRu1GbZcGQWD/ef4nrUL/8sA=;
 b=ZqdNH2fuHHG9OlZQhCacsUO2yQuNRjtd4l27Bw3+psUu4bbI2+z5YCGSptvJc6B/AaoBOD
 7cIieCXaN1iRXbAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EB35B13647;
 Fri,  6 Dec 2024 09:49:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id B4BhOMTIUmehEwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 06 Dec 2024 09:49:56 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  6 Dec 2024 10:49:34 +0100
Message-ID: <20241206094938.92895-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Rspamd-Queue-Id: 2466821190
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_COUNT_TWO(0.00)[2]; ARC_NA(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCPT_COUNT_THREE(0.00)[4]; DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 0/4] ci: run shell loader tests
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

Tested: https://github.com/pevik/ltp/actions/runs/12196430765

Petr Vorel (4):
  testcases/lib/run_tests.sh: Check expected results
  Makefile: Add target to run shell loader
  build.sh: Allow to run shell loader tests
  ci: Add shell loader tests

 .github/workflows/ci-docker-build.yml |   5 ++
 Makefile                              |   7 ++
 build.sh                              |  19 +++--
 testcases/lib/run_tests.sh            | 115 +++++++++++++++++++++-----
 4 files changed, 117 insertions(+), 29 deletions(-)

-- 
2.45.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
