Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5291B98BB68
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Oct 2024 13:41:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 416CB3C58E7
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Oct 2024 13:41:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A96033C5814
 for <ltp@lists.linux.it>; Tue,  1 Oct 2024 13:40:59 +0200 (CEST)
Authentication-Results: in-7.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.131; helo=smtp-out2.suse.de;
 envelope-from=chrubis@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8D6A82000FD
 for <ltp@lists.linux.it>; Tue,  1 Oct 2024 13:40:59 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3DF711FCF4;
 Tue,  1 Oct 2024 11:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1727782858; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u5P/mZaDcXUJN1RY3Pv3GbC6qQPQfK8afLU3jIXi/rk=;
 b=IoEropVV3R6CNF6MUiAF+PPiwHfmGcUwAU700KP04gcT1h9pPe/+eKj/yqEVYNNXEJShgi
 oG3SQLvCwBqVgJIJ6c0K+TbAZpOiOzowFsqQG8CSmvCRzz2NIQM6brYgIXH/zdv0NXPtTf
 kr+K/EJ90B1uS2I288pdMN95cIoE/a8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1727782858;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u5P/mZaDcXUJN1RY3Pv3GbC6qQPQfK8afLU3jIXi/rk=;
 b=KzaAxsYjxlu6hsHYXkpLESU6lE6kfgYB5ObofpcWfnRMAewn7pg3Neq7Te81OJ9xyfz6/3
 tM43I/GgVjCeN+Aw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=IoEropVV;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=KzaAxsYj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1727782858; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u5P/mZaDcXUJN1RY3Pv3GbC6qQPQfK8afLU3jIXi/rk=;
 b=IoEropVV3R6CNF6MUiAF+PPiwHfmGcUwAU700KP04gcT1h9pPe/+eKj/yqEVYNNXEJShgi
 oG3SQLvCwBqVgJIJ6c0K+TbAZpOiOzowFsqQG8CSmvCRzz2NIQM6brYgIXH/zdv0NXPtTf
 kr+K/EJ90B1uS2I288pdMN95cIoE/a8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1727782858;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u5P/mZaDcXUJN1RY3Pv3GbC6qQPQfK8afLU3jIXi/rk=;
 b=KzaAxsYjxlu6hsHYXkpLESU6lE6kfgYB5ObofpcWfnRMAewn7pg3Neq7Te81OJ9xyfz6/3
 tM43I/GgVjCeN+Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 04D0713A73;
 Tue,  1 Oct 2024 11:40:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id E11HNcjf+2YvawAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Tue, 01 Oct 2024 11:40:56 +0000
Date: Tue, 1 Oct 2024 13:39:52 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <ZvvfiHR0Fr76SbuO@yuki.lan>
References: <20240924-ioctl_ficlone01_fix-v1-1-7741e2e13cc2@suse.com>
 <ZvVMJQhI_4tTFfYB@yuki.lan>
 <cc358271-b656-4314-9cc7-83429b24aba2@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cc358271-b656-4314-9cc7-83429b24aba2@suse.cz>
X-Rspamd-Queue-Id: 3DF711FCF4
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; ARC_NA(0.00)[]; MISSING_XM_UA(0.00)[];
 RCVD_TLS_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCPT_COUNT_THREE(0.00)[3];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_COUNT_TWO(0.00)[2];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] Fix ioctl_ficlone on XFS without reflink support
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
> > I suppose that we need to add .mkfs_ver string to the struct tst_fs and
> > possibly .kernel_ver as well so that we can add both checks to the
> > structures as:
> > 
> > 	{
> > 		.type = "xfs",
> > 		.mkfs_ver = ">= 5.1.0",
> > 		.kernel_ver = ">= 4.9.0",
> > 		...
> > 	}
> 
> It'd be simpler to add .skip_if_unsupported flag to struct tst_fs and 
> then simply TCONF the single filesystem if mount() returns EOPNOTSUPP. 
> That way we don't need hardcoded version checks for the kernel. MKFS 
> versions checks would still be needed, though.

That's not a 100% correct either, with that we will not catch if the
functionality was disabled in the kernel by a mistake.

So I think that we need:

- minimal kernel version where the functionality was added in upstream
  in the tst_fs structure
- try to mount the fs
- if we get EOPNOTSUPP and current kernel is older than the minimal
  version report TCONF
- otherwise report TFAIL

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
