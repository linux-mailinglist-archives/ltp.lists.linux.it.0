Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD5B3D1274
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jul 2021 17:33:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ABDCD3C9772
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jul 2021 17:33:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9A10E3C61CD
 for <ltp@lists.linux.it>; Wed, 21 Jul 2021 17:33:14 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id ABDAA2000BE
 for <ltp@lists.linux.it>; Wed, 21 Jul 2021 17:33:13 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CDF191FEBC;
 Wed, 21 Jul 2021 15:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626881592; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OdDcHzeS6hAExpZDeunq+KjXggP6975NkkZq0cLKn90=;
 b=vx78qwnO75JKBx1NXQh7oQgc/zsXBdefe1OswvYofogWhiEuaVKWqs6MkxCkfh08ng0ZY4
 FOI3Mr3DABKI2xTUiMxb4eAaVtzMdEsLIgAJ3NnTmHI+SHGAsTH5DmWCXQSHjYrbglvypN
 kW0kDNmUD3ImCstwKsknphlqf+09wnk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626881592;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OdDcHzeS6hAExpZDeunq+KjXggP6975NkkZq0cLKn90=;
 b=4RWK184wr4J6O2PL8+vwQ3ZGoWzrDCM+smuIT3RXU8bbgcmxMNmiBxrxnYzy25lkAdwb8V
 ZOmeU/oC80Q4ivCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B9CFA139F8;
 Wed, 21 Jul 2021 15:33:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PoVtLDg++GAUCwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 21 Jul 2021 15:33:12 +0000
Date: Wed, 21 Jul 2021 17:07:45 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <YPg4QQ4D+Zm18ErR@yuki>
References: <20201111163114.GB23576@yuki.lan>
 <1615550541-21714-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1615550541-21714-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1615550541-21714-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 2/5] syscalls/msgstress01: Convert into new api
 and merge msgstress03 into it
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
The code looks much better there are just two minor things.

> 2)Ignore SIGTERM instead of empty signhanlder and sighold/sigrelease

I wonder why do we ingore SIGTERM in the first place?

>  msgctl06 msgctl06
>  msgstress01 msgstress01
>  msgstress02 msgstress02
> -msgstress03 msgstress03
> +msgstress03 msgstress01 -n 10000 -l 10000
>  msgstress04 msgstress04
>  msgctl12 msgctl12
>  
> diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
> index 68fff4038..8adb686c1 100644
> --- a/runtest/syscalls-ipc
> +++ b/runtest/syscalls-ipc
> @@ -6,7 +6,7 @@ msgctl05 msgctl05
>  msgctl06 msgctl06
>  msgstress01 msgstress01
>  msgstress02 msgstress02
> -msgstress03 msgstress03
> +msgstress03 msgstress01 -n 10000 -l 10000

I'm also not sure if we should call it msgstress03, maybe it would be
cleaner if we named these two tests with msgstress01 with some suffix.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
