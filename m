Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 442D1903979
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2024 13:02:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 02E1E3D0B56
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2024 13:02:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 88FBE3C0123
 for <ltp@lists.linux.it>; Tue, 11 Jun 2024 13:02:11 +0200 (CEST)
Authentication-Results: in-5.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E0FC160FB3A
 for <ltp@lists.linux.it>; Tue, 11 Jun 2024 13:02:10 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9AD86336F0;
 Tue, 11 Jun 2024 11:02:09 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 06F00137DF;
 Tue, 11 Jun 2024 11:02:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id t5fVNrAuaGaGEQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Tue, 11 Jun 2024 11:02:08 +0000
Date: Tue, 11 Jun 2024 13:02:03 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20240611110203.GA34462@pevik>
References: <20240603123455.7968-1-chrubis@suse.cz>
 <20240603123455.7968-2-chrubis@suse.cz>
 <85b362c0-9126-45cb-90af-9fe09b848661@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <85b362c0-9126-45cb-90af-9fe09b848661@suse.cz>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 9AD86336F0
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/2] lib: tst_test: Add per filesystem mkfs and
 mount opts
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin, Cyril,

> Hi,
> a design note below.

...
> > + * @fss: A NULL type terminated array of per file system type options. If
> > + *       tst_test.all_filesystems is not set the array describes a list of
> > + *       file systems to test along with parameters to pass to mkfs and mount.
> > + *       If tst_test.all_filesystems is set the mkfs and mount options are
> > + *       taken from tst_test.fs unless there is an override for a given
> > + *       file system type defined in this array.

> I like the general idea but I don't see the point of having separate .fs and
> .fss. You could simply use .fss[0] for the same purpose as .fs.

Look at the second patch where it is used (quotactl08.c):

static struct tst_test test = {
	...
	.fs = {
		.mkfs_opts = (const char *const[]){
			"-O quota", NULL
		},
		.type = "ext4",
	},

So would you set it as array?

static struct tst_test test = {
	...
	.fss = (struct tst_fs[]){
		{
			.mkfs_opts = (const char *const[]){
				"-O quota", NULL
			},
			.type = "ext4",
		},
		{}
	},

It's a bit verbose, but maybe having separate .fs is slightly more confusing.

Also having only array, we could use .fs name for it.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
