Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 937C899F51E
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Oct 2024 20:21:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5AD5B3C674F
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Oct 2024 20:21:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B56AA3C223C
 for <ltp@lists.linux.it>; Tue, 15 Oct 2024 20:20:55 +0200 (CEST)
Authentication-Results: in-5.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 457C962E056
 for <ltp@lists.linux.it>; Tue, 15 Oct 2024 20:20:54 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6D37821CC3;
 Tue, 15 Oct 2024 18:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1729016454;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XXYoqpVrwxAeH9ZP5OirwlVGb1VvJTQFZUMmv0amuEs=;
 b=cO5siCwaZ1SrO3ycLoi53EppZha+YJrN7QzT6h3748kt9xAYBGf40unYRPyqjNvb2UYH7A
 HW4JMQqXvyuUSfJx3QOEVb648frhJmpvfXXYR5gO94+0I6EXF6sQTxcpMVFHl4b/KQW5H0
 XwzWpzsoaMzzZLSyHbrPgNBulSbd+vk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1729016454;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XXYoqpVrwxAeH9ZP5OirwlVGb1VvJTQFZUMmv0amuEs=;
 b=fjGvBGXUIAYppo+vmupi5WGHo8KrDobS3SXVzXlv7N1X9dwO52cEWfqz5DVfhUauxboHez
 6z2uA8PoI6j06+Bw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1729016454;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XXYoqpVrwxAeH9ZP5OirwlVGb1VvJTQFZUMmv0amuEs=;
 b=cO5siCwaZ1SrO3ycLoi53EppZha+YJrN7QzT6h3748kt9xAYBGf40unYRPyqjNvb2UYH7A
 HW4JMQqXvyuUSfJx3QOEVb648frhJmpvfXXYR5gO94+0I6EXF6sQTxcpMVFHl4b/KQW5H0
 XwzWpzsoaMzzZLSyHbrPgNBulSbd+vk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1729016454;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XXYoqpVrwxAeH9ZP5OirwlVGb1VvJTQFZUMmv0amuEs=;
 b=fjGvBGXUIAYppo+vmupi5WGHo8KrDobS3SXVzXlv7N1X9dwO52cEWfqz5DVfhUauxboHez
 6z2uA8PoI6j06+Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DECB513A53;
 Tue, 15 Oct 2024 18:20:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id u8rkMYWyDmcDSgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Tue, 15 Oct 2024 18:20:53 +0000
Date: Tue, 15 Oct 2024 20:20:47 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Zhijian <lizhijian@fujitsu.com>
Message-ID: <20241015182047.GA46536@pevik>
References: <20241015055004.123864-1-lizhijian@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241015055004.123864-1-lizhijian@fujitsu.com>
X-Spam-Score: -7.50
X-Spamd-Result: default: False [-7.50 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[99.99%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCPT_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; MISSING_XM_UA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; REPLYTO_EQ_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] testcases: Add a few missing gitignore files
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

Hi Li,

> After a out-of-tree build, git status complains:
> Untracked files:
>   (use "git add <file>..." to include in what will be committed)
>         testcases/commands/insmod/.Module.symvers.cmd
>         testcases/commands/insmod/.modules.order.cmd
>         testcases/commands/lsmod/.Module.symvers.cmd
>         testcases/commands/lsmod/.modules.order.cmd
>         testcases/kernel/syscalls/delete_module/.Module.symvers.cmd
>         testcases/kernel/syscalls/delete_module/.modules.order.cmd
>         testcases/kernel/syscalls/finit_module/..module-common.o.cmd
>         testcases/kernel/syscalls/finit_module/.Module.symvers.cmd
>         testcases/kernel/syscalls/finit_module/.finit_module.ko.cmd
>         testcases/kernel/syscalls/finit_module/.finit_module.mod.cmd
>         testcases/kernel/syscalls/finit_module/.finit_module.mod.o.cmd
>         testcases/kernel/syscalls/finit_module/.finit_module.o.cmd
>         testcases/kernel/syscalls/finit_module/.modules.order.cmd
>         testcases/kernel/syscalls/finit_module/Module.symvers
>         testcases/kernel/syscalls/finit_module/finit_module.mod.c
>         testcases/kernel/syscalls/finit_module/modules.order
>         testcases/kernel/syscalls/init_module/.Module.symvers.cmd
>         testcases/kernel/syscalls/init_module/.modules.order.cmd

Thanks, merged!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
