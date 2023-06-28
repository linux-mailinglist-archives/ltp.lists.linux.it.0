Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3367411EB
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jun 2023 15:07:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E2F2B3CC78D
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jun 2023 15:07:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 33AFD3CB175
 for <ltp@lists.linux.it>; Wed, 28 Jun 2023 15:07:47 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3C40D20098C
 for <ltp@lists.linux.it>; Wed, 28 Jun 2023 15:07:45 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8E6DF2188F;
 Wed, 28 Jun 2023 13:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1687957665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=gqeOwvgQbvSTIGvkDHbWxmNwqJ0litooR+XDr572N2I=;
 b=MS+F3Ab+Sp/rpKMCrL7wPp4tiywdIQ/kpVTGFExcTmLZMoy+wEJ3xYAHK6TfUc47KYm9Vq
 UCUpC79vQXnbwjvvg3eWt2be3p8J/v1IFtPTFA7PL/nez689cE8fSAdj984ZCC+kXE7oAK
 evUvXamcK1kiFupvXv4n2CT9GMaEusg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1687957665;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=gqeOwvgQbvSTIGvkDHbWxmNwqJ0litooR+XDr572N2I=;
 b=SURDYFJvu4Jp1Y3ohj3Rqsbbb+91srsZG/BUXR8JhShq6Zt/serqm4hBHBl78hJMo0vqZm
 hYlU0+EWnjnjKTDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 57408138E8;
 Wed, 28 Jun 2023 13:07:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HI35E6EwnGT/cgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 28 Jun 2023 13:07:45 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 28 Jun 2023 15:07:39 +0200
Message-Id: <20230628130742.155724-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/3] Remove O_DIRECT definition
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
Cc: NeilBrown <neilb@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

changes v1->v2:
Remove all O_DIRECT fallback definitions and add a note to define
_GNU_SOURCE to lapi header instead (v1 tried to add more archs, while
we could add current complete list it's error prone, using _GNU_SOURCE
is better).

Compilation tested:
https://github.com/pevik/ltp/actions/runs/5401264765

Kind regards,
Petr

Petr Vorel (3):
  lapi/fcntl.h: Remove O_DIRECT definition
  fsstress/global.h: Use _GNU_SOURCE
  ltpscsi/scsimain.c: Remove O_DIRECT fallback definition

 include/lapi/fcntl.h                        | 5 ++---
 testcases/kernel/fs/fsstress/global.h       | 8 +-------
 testcases/kernel/fs/scsi/ltpscsi/scsimain.c | 5 +----
 3 files changed, 4 insertions(+), 14 deletions(-)

-- 
2.40.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
