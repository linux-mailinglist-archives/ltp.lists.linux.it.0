Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0079947D1
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Oct 2024 13:57:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 954C13C1B3A
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Oct 2024 13:57:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3C6EE3C1A29
 for <ltp@lists.linux.it>; Tue,  8 Oct 2024 13:55:50 +0200 (CEST)
Authentication-Results: in-6.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.131; helo=smtp-out2.suse.de;
 envelope-from=chrubis@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 800C01401106
 for <ltp@lists.linux.it>; Tue,  8 Oct 2024 13:55:49 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D675B1FB3F;
 Tue,  8 Oct 2024 11:55:48 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C7D461340C;
 Tue,  8 Oct 2024 11:55:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id j8m9L8QdBWcBagAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Tue, 08 Oct 2024 11:55:48 +0000
Date: Tue, 8 Oct 2024 13:54:48 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <ZwUdiB8tkEpzdUE2@yuki.lan>
References: <20241008-listmount_statmount-v5-0-66f4e1a9e7db@suse.com>
 <20241008-listmount_statmount-v5-7-66f4e1a9e7db@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241008-listmount_statmount-v5-7-66f4e1a9e7db@suse.com>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: D675B1FB3F
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v5 07/16] Add statmount01 test
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> +static void run(void)
> +{
> +	memset(st_mount, 0, sizeof(struct statmount));
> +
> +	TST_EXP_PASS(statmount(root_id, 0, st_mount, sizeof(struct statmount), 0));
> +
> +	if (TST_RET == -1)
> +		return;

I asked for this to be changed to if (!TST_PASS)

> +	TST_EXP_EQ_LI(st_mount->size, sizeof(struct statmount));
> +	TST_EXP_EQ_LI(st_mount->mask, 0);
> +	TST_EXP_EQ_LI(st_mount->sb_dev_major, 0);
> +	TST_EXP_EQ_LI(st_mount->sb_dev_minor, 0);
> +	TST_EXP_EQ_LI(st_mount->sb_magic, 0);
> +	TST_EXP_EQ_LI(st_mount->sb_flags, 0);
> +	TST_EXP_EQ_LI(st_mount->fs_type, 0);
> +	TST_EXP_EQ_LI(st_mount->mnt_id, 0);
> +	TST_EXP_EQ_LI(st_mount->mnt_parent_id, 0);
> +	TST_EXP_EQ_LI(st_mount->mnt_id_old, 0);
> +	TST_EXP_EQ_LI(st_mount->mnt_parent_id_old, 0);
> +	TST_EXP_EQ_LI(st_mount->mnt_attr, 0);
> +	TST_EXP_EQ_LI(st_mount->mnt_propagation, 0);
> +	TST_EXP_EQ_LI(st_mount->mnt_peer_group, 0);
> +	TST_EXP_EQ_LI(st_mount->mnt_master, 0);
> +	TST_EXP_EQ_LI(st_mount->propagate_from, 0);
> +	TST_EXP_EQ_LI(st_mount->mnt_root, 0);
> +	TST_EXP_EQ_LI(st_mount->mnt_point, 0);
> +}
> +
> +static void setup(void)
> +{
> +	struct ltp_statx sx;
> +
> +	SAFE_STATX(AT_FDCWD, MNTPOINT, 0, STATX_MNT_ID_UNIQUE, &sx);
> +
> +	root_id = sx.data.stx_mnt_id;

And here to be changed to mntpoint_id

> +}
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.setup = setup,
> +	.min_kver = "6.8",
> +	.mount_device = 1,
> +	.mntpoint = MNTPOINT,
> +	.all_filesystems = 1,
> +	.skip_filesystems = (const char *const []) {
> +		"fuse",
> +		NULL
> +	},

And here I suggested that there is no point in running this for all
filesystems.

None of these has been addressed in v5.

> +	.bufs = (struct tst_buffers []) {
> +		{&st_mount, .size = sizeof(struct statmount)},
> +		{}
> +	}
> +};
> 
> -- 
> 2.43.0
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
