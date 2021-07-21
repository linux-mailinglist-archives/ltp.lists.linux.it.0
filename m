Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F2F3D1184
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jul 2021 16:37:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 229E93C81A2
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jul 2021 16:37:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A14863C61D6
 for <ltp@lists.linux.it>; Wed, 21 Jul 2021 16:37:31 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C054E1000D4D
 for <ltp@lists.linux.it>; Wed, 21 Jul 2021 16:37:30 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EDF2B2255A;
 Wed, 21 Jul 2021 14:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626878249;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oX0d45Supwr9RoBn2cy2XV0pBVKUdCwCnr9CIj36JZ8=;
 b=BRv+9a16CdnT7Pq2gsLW+8MhY0J9RjkY+w5RFzMtMS/6yqSQpQCvhnQTmQq+hcPek5ETtz
 WdgLRz5MFTmSQip9wm9eNzQh3lQbbd9TM1OyfpEN6cf0M/ATLNXgNgXfJBzKCSzIwKyQzi
 6HG1fb+nFM/TAMvI1FuUXY9YKj6bkBc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626878249;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oX0d45Supwr9RoBn2cy2XV0pBVKUdCwCnr9CIj36JZ8=;
 b=qfsSwBbx4kU99gcKpe+M8XkHB1Ay3/rcLsfu2LKcGCEC/rrrBlb2jXn3ul+LF1/kxCPMEt
 ZFs9d6UoEf6ul5Dg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 899CE13BF7;
 Wed, 21 Jul 2021 14:37:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id oHAWICkx+GCHJQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 21 Jul 2021 14:37:29 +0000
Date: Wed, 21 Jul 2021 16:37:27 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Leo Liang <ycliang@andestech.com>
Message-ID: <YPgxJwx795fhXgLa@pevik>
References: <20210719092239.GA1475@atcfdc88>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210719092239.GA1475@atcfdc88>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4,
 2/2] cgroup/cgroup_regression_test: Fix umount failure
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
Cc: richiejp@f-m.fm, Alan Quey-Liang Kao <alankao@andestech.com>, metan@ucw.cz,
 ycliang@cs.nctu.edu.tw, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Leo,

Reviewed-by: Petr Vorel <pvorel@suse.cz>

>  	rmdir cgroup/0 cgroup/1
> -	umount cgroup/
> +	tst_umount cgroup/	# Avoid possible EBUSY error
>  }

>  #---------------------------------------------------------------------------
> @@ -193,7 +193,7 @@ test3()
>  	wait $pid2 2>/dev/null

>  	rmdir $cpu_subsys_path/0 2> /dev/null
> -	umount cgroup/ 2> /dev/null
> +	tst_umount cgroup/ 2> /dev/null		# Avoid possible EBUSY error
I'd prefer: # keep "/" to avoid possible EBUSY error
But that can be changed before merge.

More I'm interested if other maintainers agree with me about this approach.
(keep / here instead of in tst_umount())

>  	check_kernel_bug
>  }

> @@ -222,7 +222,7 @@ test4()
>  	mount -t cgroup -o none,name=foo cgroup cgroup/
>  	mkdir cgroup/0
>  	rmdir cgroup/0
> -	umount cgroup/
> +	tst_umount cgroup/		# Avoid possible EBUSY error

>  	if dmesg | grep -q "MAX_LOCKDEP_SUBCLASSES too low"; then
>  		tst_res TFAIL "lockdep BUG was found"
> @@ -254,7 +254,7 @@ test5()
>  	mount -t cgroup none cgroup 2> /dev/null
>  	mkdir cgroup/0
>  	rmdir cgroup/0
> -	umount cgroup/ 2> /dev/null
> +	tst_umount cgroup/ 2> /dev/null		# Avoid possible EBUSY error
I'd drop stderr redirection here. It was here originally, but I suppose it's not
needed when using tst_umount. But that can be done during merge.

...

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
