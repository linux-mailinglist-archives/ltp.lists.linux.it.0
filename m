Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A783DD391
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 12:21:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AFB3C3C8AB1
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 12:21:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EC6153C57C1
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 12:21:00 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3C5E31400457
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 12:20:59 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CA6EC21F69;
 Mon,  2 Aug 2021 10:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627899658;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7SEXvXUCajFi+e7i+XmB9GjxEo1M+oYN6jcWeIOSaqI=;
 b=jH3yTovejrKKgLfFcDjlLW4y3GX+M7HgT81pE3QSwh3C9u7CnI9npdREBBbqYvxc2nI22o
 IKV66uACJ04D726DyAcmvzjDzCBdY8s2FtQN/27LjFaVWMpXI/H2UOwvmMvRbcKcQwVLVj
 jQRdaDBGAVZRPhhGuz7LlR8lndmOjZE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627899658;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7SEXvXUCajFi+e7i+XmB9GjxEo1M+oYN6jcWeIOSaqI=;
 b=mVA5eHC5IBdltDanlpdPw5gf4biqOY+CbyN1yN1L2pKA+zQTj6fHBnMuZtr4/A6gjwuIDO
 unh+0UdiL/1YybDQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id AB99D13882;
 Mon,  2 Aug 2021 10:20:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 2an5JQrHB2EOLgAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Mon, 02 Aug 2021 10:20:58 +0000
Date: Mon, 2 Aug 2021 12:20:56 +0200
From: Petr Vorel <pvorel@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YQfHCAsCQ2mvguWA@pevik>
References: <20210722125219.31895-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210722125219.31895-1-zhanglianjie@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] regen.sh: Limit mips o32 system calls
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

> With mips architecture, 64-bit programs cannot call o32 system calls.
> For example, __NR_stime, __NR_socketcall, __NR_time, etc.
> Better solve the problem described in commit: 22c2c9e2f

Merged your fix and reverted 22c2c9e2f, which is not needed now.

Thanks!

Kind regards,
Petr

> Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>

> diff --git a/include/lapi/syscalls/regen.sh b/include/lapi/syscalls/regen.sh
> index 7a4f0cf44..8ac80440c 100755
> --- a/include/lapi/syscalls/regen.sh
> +++ b/include/lapi/syscalls/regen.sh
> @@ -80,7 +80,7 @@ for arch in $(cat "${srcdir}/order") ; do
>  		s390) echo "#if defined(__s390__) && !defined(__s390x__)" ;;
>  		mips_n32) echo "#if defined(__mips__) && defined(_ABIN32)" ;;
>  		mips_n64) echo "#if defined(__mips__) && defined(_ABI64)" ;;
> -		mips_o32) echo "#if defined(__mips__) && defined(_ABIO32)" ;;
> +		mips_o32) echo "#if defined(__mips__) && defined(_ABIO32) && _MIPS_SZLONG == 32" ;;
>  		*) echo "#ifdef __${arch}__" ;;
>  	esac
>  	while read line ; do

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
