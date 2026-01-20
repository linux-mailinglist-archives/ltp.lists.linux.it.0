Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBx/LcGjb2l7DgAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jan 2026 16:48:17 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D9446AD3
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jan 2026 16:48:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 872D53CAF5C
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jan 2026 13:43:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1C1173CAA5A
 for <ltp@lists.linux.it>; Tue, 20 Jan 2026 13:43:26 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8F7DF6009AE
 for <ltp@lists.linux.it>; Tue, 20 Jan 2026 13:43:25 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 068C23381A;
 Tue, 20 Jan 2026 12:43:25 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C855F3EA63;
 Tue, 20 Jan 2026 12:43:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id XBYnLmx4b2k3dQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Tue, 20 Jan 2026 12:43:24 +0000
Date: Tue, 20 Jan 2026 13:43:23 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <20260120124323.GA39038@pevik>
References: <20260120-file_attr05-v3-1-c3fd9fc0fcce@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260120-file_attr05-v3-1-c3fd9fc0fcce@suse.com>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Score: -4.00
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v3] syscalls: add file_attr05 test
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Linux Test Project <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	REPLYTO_EQ_FROM(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,linux.it:url,suse.com:email]
X-Rspamd-Queue-Id: 63D9446AD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Andrea,

> From: Andrea Cervesato <andrea.cervesato@suse.com>

> Verify that `file_setattr` is correctly raising EOPNOTSUPP when
> filesystem doesn't support FSX operations.

> Regression test for "474b155adf39 - fs: make vfs_fileattr_[get|set]
> return -EOPNOTSUPP".

Reason for changing approach in v3:
https://lore.kernel.org/ltp/DFTCS1EEBMDD.21X779ISM0MTF@suse.com/

> +++ b/testcases/kernel/syscalls/file_attr/file_attr05.c
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2025 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
> + */
> +
> +/*\
> + * Verify that `file_setattr` is correctly raising EOPNOTSUPP when filesystem
> + * doesn't support FSX operations.
> + *
> + * Regression test for "474b155adf39 - fs: make vfs_fileattr_[get|set] return
> + * -EOPNOTSUPP".
Why not added into .tags?
nit: Also the usual way of referring commits is:
474b155adf392 ("fs: make vfs_fileattr_[get|set] return -EOPNOTSUPP")

> + */
> +
> +#include "tst_test.h"
> +#include "lapi/fs.h"
> +
> +#define MNTPOINT "mntpoint"
> +#define FILEPATH (MNTPOINT "/ltp_file")
> +#define BLOCKS 128
> +#define PROJID 16
> +
> +static struct file_attr *attr_set;
> +
> +static void run(void)
> +{
> +	TST_EXP_FAIL(file_setattr(AT_FDCWD, FILEPATH,
> +			   attr_set, FILE_ATTR_SIZE_LATEST, 0), EOPNOTSUPP);
> +}
> +
> +static void setup(void)
> +{
> +	struct stat statbuf;
> +
> +	SAFE_TOUCH(FILEPATH, 0777, NULL);
> +
> +	SAFE_STAT(MNTPOINT, &statbuf);
> +
> +	attr_set->fa_xflags |= FS_XFLAG_EXTSIZE;
> +	attr_set->fa_xflags |= FS_XFLAG_COWEXTSIZE;
> +	attr_set->fa_extsize = BLOCKS * statbuf.st_blksize;
> +	attr_set->fa_cowextsize = BLOCKS * statbuf.st_blksize;
> +	attr_set->fa_projid = PROJID;
> +}
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.setup = setup,
> +	.mntpoint = MNTPOINT,
> +	.needs_root = 1,
> +	.mount_device = 1,
> +	.all_filesystems = 1,
> +	.format_device = 1,
> +	.skip_filesystems = (const char *const []) {
> +		"xfs",
> +		"fuse", /* EINVAL is raised before EOPNOTSUPP */
> +		"vfat", /* vfat is not implementing file_[set|get]attr */

Hm, funny, vfat not implementing also raises EOPNOTSUPP. I wonder if we should
keep it as well.

> +		NULL,
> +	},
> +	.bufs = (struct tst_buffers []) {
> +		{&attr_set, .size = sizeof(struct file_attr)},
Again, I'd put 474b155adf392 into tags. It's IMHO enough (no need for mentioning
it in the docs.

Kind regards,
Petr

> +		{}
> +	}
> +};

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
