Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5418F3CF59C
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 09:56:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B94AE3C81A6
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 09:56:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B8E203C2B48
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 09:56:18 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 427EA200923
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 09:56:17 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 286592238E;
 Tue, 20 Jul 2021 07:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626767777;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OnTEy19iuvDqsGks5ZBJ8kDbYuc4z+Js2KuNOkp0Ob8=;
 b=lKgTJUcbIxe0Xffj4c7DTNlSitYfY5rT7xFeCyx8OiqLXFZq4/uFiNrD+7eNlbL1qvtvKd
 fvHmiMLgHE1FsEA1xxtGu/PrAoEAUr9oSFH1KqPI5SiT+B8ZMmiydlDcGp8e1hKdCs71Xs
 U2yzfzJtMbramD/jCZrC3OGEzdZCPZQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626767777;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OnTEy19iuvDqsGks5ZBJ8kDbYuc4z+Js2KuNOkp0Ob8=;
 b=WuY2PWRvAdXC7uknju4BUVmsK7sFnw0JphNdBo6BIJxEvzzeZb4ZcIW5/635ptiMuZtlps
 Qz/+/gOpD95aydDw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id EFE46139A5;
 Tue, 20 Jul 2021 07:56:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 0J+eNqCB9mDkfAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Tue, 20 Jul 2021 07:56:16 +0000
Date: Tue, 20 Jul 2021 09:56:15 +0200
From: Petr Vorel <pvorel@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YPaBnxlp2SsxCaPE@pevik>
References: <20210720063852.1883-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210720063852.1883-1-zhanglianjie@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] stime: Only o32 system calls require 32-bit
 programs on mips
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

Hi zhanglianjie,

> The stime() system call is only o32, not n32 and n64. If you do not
> specify that the current program is compiled to 32-bit when compiling
> the program on mips, the stime() system call will fail when the
> program is running.
You're right that stime() is only on o32. But tst_syscall() should catch that.
Or does it set different errno than ENOSYS?

Kind regards,
Petr

...
> +#if defined(__mips__) && _MIPS_SZLONG == 32
>  		return tst_syscall(__NR_stime, ntime);
> +#else
> +		tst_brk(TCONF, "the stime() syscall only o32 ABI in mips, make sure the current program is 32-bit");
> +#endif

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
