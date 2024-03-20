Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8865A880F32
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Mar 2024 11:00:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3CA6A3CE6CF
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Mar 2024 11:00:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 30EE83CE744
 for <ltp@lists.linux.it>; Wed, 20 Mar 2024 11:00:30 +0100 (CET)
Authentication-Results: in-2.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=chrubis@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 64E1F602AD3
 for <ltp@lists.linux.it>; Wed, 20 Mar 2024 11:00:26 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CE8EB20C3B
 for <ltp@lists.linux.it>; Wed, 20 Mar 2024 10:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1710928825; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=PMxxeVdiJ9y2tVi4kQru0woDLpJ4n4+k0vo7yHh/4qs=;
 b=p5kD6zD8jRgzdl97LCc4WwS92Nig1UPSMqSc2A7bIljC6oA1fVUF/ONl6ZwRIVFDXF8Nnb
 EhRpZmiqUNbDcobre1zD37gL9ZPTdZ8bgjm+cJcSsjp+WDd5KthkoLCk6938hJhny+tI8o
 isWRUh8UZAgnXq+U20G9lGYNCcOakVM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1710928825;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=PMxxeVdiJ9y2tVi4kQru0woDLpJ4n4+k0vo7yHh/4qs=;
 b=QzYTXNxBkjXX1iLiH0UPa0SAu464maYOdAuv9hCXZVnXNPyIodqql73yf3l8MdrkTdRLlh
 8ei4FDv0dofX+5AA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1710928825; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=PMxxeVdiJ9y2tVi4kQru0woDLpJ4n4+k0vo7yHh/4qs=;
 b=p5kD6zD8jRgzdl97LCc4WwS92Nig1UPSMqSc2A7bIljC6oA1fVUF/ONl6ZwRIVFDXF8Nnb
 EhRpZmiqUNbDcobre1zD37gL9ZPTdZ8bgjm+cJcSsjp+WDd5KthkoLCk6938hJhny+tI8o
 isWRUh8UZAgnXq+U20G9lGYNCcOakVM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1710928825;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=PMxxeVdiJ9y2tVi4kQru0woDLpJ4n4+k0vo7yHh/4qs=;
 b=QzYTXNxBkjXX1iLiH0UPa0SAu464maYOdAuv9hCXZVnXNPyIodqql73yf3l8MdrkTdRLlh
 8ei4FDv0dofX+5AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BE84E136D6
 for <ltp@lists.linux.it>; Wed, 20 Mar 2024 10:00:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SIR8Lbmz+mXBYAAAD6G6ig
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Wed, 20 Mar 2024 10:00:25 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 20 Mar 2024 10:59:25 +0100
Message-ID: <20240320095927.19973-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Spam-Score: 3.66
X-Spamd-Result: default: False [3.66 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain];
 PREVIOUSLY_DELIVERED(0.00)[ltp@lists.linux.it];
 BROKEN_CONTENT_TYPE(1.50)[]; RCPT_COUNT_ONE(0.00)[1];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 TO_DN_NONE(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.04)[58.20%]
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_MISSING,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 0/2] Add splice tests fro /dev/{zero,null,full}
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

We came around this when we were doing pre-release testing for the
splice07 test, the support for splicing to/from some dev files was
likely unintentionaly removed and added back later on. This patchset
implements first two basic splice tests for these device files.

Cyril Hrubis (2):
  syscalls: Add test for splicing from /dev/zero and /dev/full
  syscalls: Add test for splicing to /dev/zero and /dev/null

 runtest/syscalls                            |  2 +
 testcases/kernel/syscalls/splice/.gitignore |  2 +
 testcases/kernel/syscalls/splice/splice08.c | 88 +++++++++++++++++++++
 testcases/kernel/syscalls/splice/splice09.c | 55 +++++++++++++
 4 files changed, 147 insertions(+)
 create mode 100644 testcases/kernel/syscalls/splice/splice08.c
 create mode 100644 testcases/kernel/syscalls/splice/splice09.c

-- 
2.43.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
