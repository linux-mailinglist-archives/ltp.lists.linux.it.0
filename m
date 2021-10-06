Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8179D423B8A
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Oct 2021 12:31:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3B81A3C9ACD
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Oct 2021 12:31:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C0D463C7016
 for <ltp@lists.linux.it>; Wed,  6 Oct 2021 12:31:08 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D1CB71A00900
 for <ltp@lists.linux.it>; Wed,  6 Oct 2021 12:31:07 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 154F920365;
 Wed,  6 Oct 2021 10:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1633516267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=bhI8v0dWLz4v8mTrfH8TZlqOSCTA2uCpFWtGIM/0/vU=;
 b=KoCemSL3rVZ/f/MtybUr0MH1F1RkKIiCsMcSrCL3DsflFjW74kmsDyUXmIXuMhaL7kVpqL
 l+S0PaGeA6K5CjIGe7VcgjH2IiAgBnC8pHsYz2za45ukYTlhUNlO/dgBlZuzj+v3pv0r70
 +JVsvZ8mehGz4hxitkIeNe0Ck5eJ22U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1633516267;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=bhI8v0dWLz4v8mTrfH8TZlqOSCTA2uCpFWtGIM/0/vU=;
 b=z3/0AXJGp64+5kSHcu7cSlh3Lcx4shuGPYcVYmL642YCsHt7u8bwkU9+ATC7bUL5kcLRAG
 R3dqnJgPvQzO3ZBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C0C6A13E19;
 Wed,  6 Oct 2021 10:31:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cSLHLOp6XWF/dAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 06 Oct 2021 10:31:06 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  6 Oct 2021 12:30:56 +0200
Message-Id: <20211006103059.9617-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v8 0/3] IMA: Add tests for uid, gid, fowner,
 and fgroup options
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
Cc: linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

changes v7->v8:
* Add missing ;; case separator

Alex Henrie (3):
  IMA: Move check_policy_writable() to ima_setup.sh and rename it
  IMA: Move ima_check to ima_setup.sh
  IMA: Add tests for uid, gid, fowner, and fgroup options

 runtest/ima                                   |  1 +
 .../integrity/ima/tests/ima_conditionals.sh   | 63 +++++++++++++++++++
 .../integrity/ima/tests/ima_measurements.sh   | 31 +--------
 .../integrity/ima/tests/ima_policy.sh         | 16 +----
 .../security/integrity/ima/tests/ima_setup.sh | 38 +++++++++++
 5 files changed, 107 insertions(+), 42 deletions(-)
 create mode 100755 testcases/kernel/security/integrity/ima/tests/ima_conditionals.sh

-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
