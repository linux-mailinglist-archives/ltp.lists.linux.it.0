Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8823F70EC
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 10:10:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 240973C30B9
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 10:10:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AD43B3C3016
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 10:09:42 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C21AB1400BED
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 10:09:41 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 114B0220F9;
 Wed, 25 Aug 2021 08:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629878981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8KAJvsrR18b9L8Y/g4O3+oRVAVUVSxIxlOreHoXujz4=;
 b=zwWCwX3876LaAf4FlaKaNdxv8Lo3HB0stsbqGw3SaEY9FfslVTar3dSliAKHCLmvPp6SVF
 KnBa83ng4dDrzrTkxNw1dLE/yHGihB6AgOmDkw2M/Vs+R1OrrlslvedleRDkOR/vvwlXAG
 c4RwKur8gjLZ4b7sx9v4TaQGhsn9Bts=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629878981;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8KAJvsrR18b9L8Y/g4O3+oRVAVUVSxIxlOreHoXujz4=;
 b=dQszWtQ03/Cco9G3hOQj+FW7yzKrx7tohr9isg3pxlR8J6mIBdxkPkqI1zeXsr8VDZTFq2
 z2Wirsbv7OWywZAg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id B31AC13929;
 Wed, 25 Aug 2021 08:09:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 01kgKcT6JWHwcQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 25 Aug 2021 08:09:40 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 25 Aug 2021 10:09:30 +0200
Message-Id: <20210825080933.12949-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 0/3] New API: Rename LTP_IPC_PATH -> TST_IPC_PATH
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Petr Vorel (3):
  lib: Move IPC_ENV_VAR definition into header
  C API: Rename LTP_IPC_PATH -> TST_IPC_PATH
  shell API: Rename LTP_IPC_PATH -> TST_IPC_PATH

 doc/c-test-api.txt                          |  2 +-
 include/tst_test.h                          |  4 +++-
 lib/tst_test.c                              |  2 --
 testcases/kernel/syscalls/execle/execle01.c |  2 --
 testcases/kernel/syscalls/execve/execve01.c |  2 --
 testcases/kernel/syscalls/prctl/prctl06.h   |  1 -
 testcases/lib/tst_test.sh                   | 12 ++++++------
 7 files changed, 10 insertions(+), 15 deletions(-)

-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
