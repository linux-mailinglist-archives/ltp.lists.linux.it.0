Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1413D74B5
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 14:03:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 266CB3C9118
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 14:03:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DA6FC3C60CD
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 14:03:45 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0A7D71A010BD
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 14:03:44 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0F2942216C;
 Tue, 27 Jul 2021 12:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627387424;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pZ/se20ZFFLCh/53BkKxRvZ5VxT5gHzNLD8jlsk8tBE=;
 b=FD5Hbxj7vPBg5jwc/kNydB0HPGIQWOAsOy5+uKVaTAsUhHfWGF+/cHgltvGHBXh4hZXftZ
 A2iXRbGtz5yMNuHJgSn+cZ5meTHFAPD9KtVyatz6A3Lf8QKqtbbv08Je3ZMWjPPeHHTZ9N
 IK3B1cjLe/Je4IadrmGKhinszIwH7TI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627387424;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pZ/se20ZFFLCh/53BkKxRvZ5VxT5gHzNLD8jlsk8tBE=;
 b=gh0jWmdnW/Dycuh81bP0Eie4zJ5AaobytWjgOro1VGMLOVrP/X7/tcC1Krwboy9zOHUk0N
 w/NAPyh3+ul3Q8CQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id B26D3133DE;
 Tue, 27 Jul 2021 12:03:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id FSeSKB/2/2CjXgAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Tue, 27 Jul 2021 12:03:43 +0000
Date: Tue, 27 Jul 2021 14:03:42 +0200
From: Petr Vorel <pvorel@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YP/2HhUaQVQc1oAV@pevik>
References: <20210722125219.31895-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210722125219.31895-1-zhanglianjie@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi zhanglianjie,

> With mips architecture, 64-bit programs cannot call o32 system calls.
> For example, __NR_stime, __NR_socketcall, __NR_time, etc.
@Thomas or somebody from MIPS folks, could you please confirm this?

> Better solve the problem described in commit: 22c2c9e2f

LGTM.
Reviewed-by: Petr Vorel <pvorel@suse.cz>

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
