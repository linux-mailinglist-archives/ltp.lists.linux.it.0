Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB47C6CC074
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Mar 2023 15:18:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B54A33CCB0E
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Mar 2023 15:18:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C19B23CA2F9
 for <ltp@lists.linux.it>; Tue, 28 Mar 2023 15:18:25 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BF6671A00CCF
 for <ltp@lists.linux.it>; Tue, 28 Mar 2023 15:18:24 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 037DA1F8B8
 for <ltp@lists.linux.it>; Tue, 28 Mar 2023 13:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1680009504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=oiTaI5SOs/Nc+Xg4DwpipqwJIPgDid5J7wWiClcaj+I=;
 b=AExvG5ngbXvP9MuXin56dn/1wnUPYK1vjgiQhUL6KaiX9hud/bFxzu2iKfZxuUYwIN7Avx
 yJuKy+5ic88OXqWDy9J450pJXPoHsu1rr6b5XG9Vs3qK29XSTJvN/yJUfHayXeYF06pB1q
 H7ttE1CdVUIwImKPj1sokZNPItCDEbk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1680009504;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=oiTaI5SOs/Nc+Xg4DwpipqwJIPgDid5J7wWiClcaj+I=;
 b=ea0Zn9XSra09A6Dot8xpLel+JWXic40SA/1nrYLGoWZd0OoMi+j6f8ie7Ur84NAEiF6Rbm
 pfqHEQ/HG4n5VDDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D75DE1390D
 for <ltp@lists.linux.it>; Tue, 28 Mar 2023 13:18:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /wVLMx/pImQQUQAAMHmgww
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Tue, 28 Mar 2023 13:18:23 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 28 Mar 2023 15:19:31 +0200
Message-Id: <20230328131935.21945-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 0/4] Minor fixes for tst_device
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

Cyril Hrubis (4):
  lib: include tst_device.h in tst_device.c
  lib: tst_device: Make find_stat_file() static
  lib: tst_device: Switch to SPDX
  lib: tst_device: Constify array members

 include/tst_device.h |  2 +-
 lib/tst_device.c     | 27 +++++----------------------
 2 files changed, 6 insertions(+), 23 deletions(-)

-- 
2.39.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
