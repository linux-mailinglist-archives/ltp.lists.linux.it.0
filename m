Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB483B05FE
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 15:40:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7E8503C8E67
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 15:40:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A18973C2298
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 15:40:48 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 09FBA600631
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 15:40:47 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 76C191FD36;
 Tue, 22 Jun 2021 13:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624369246;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/rbdMDii67ydSZ/92mATowgSLCXnEMdt9Lt4paho3yA=;
 b=B8Hg1yI78imJ156fWuW6hw2YJ4vjAAcDdHHLap3tfZV792ddPidPaGxyHUOnxkxwsy6/0e
 aMGEk2JskPk9xCHHZ3hsyrg7EZn1Gs1/E+43Lvf/wkrRbCu9+RqWRjvW/frbl6zGy/RDd3
 TSELWnsEnntdySYkwC7UYPDCZS2a2uw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624369246;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/rbdMDii67ydSZ/92mATowgSLCXnEMdt9Lt4paho3yA=;
 b=U4a2LaJ+FEn4ZBCfaNKu22KY9sCFuSqYaq+yNbPfSOaQqDkUcg80qqKLEZT2B0VmyR7+gR
 jVKJO0t2IY1VwSAg==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 4756EA3B85;
 Tue, 22 Jun 2021 13:40:46 +0000 (UTC)
References: <20210622122538.402907-1-liwang@redhat.com>
 <20210622122538.402907-3-liwang@redhat.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
Reviewed-by: Richard Palethorpe <rpalethorpe@suse.com>
Reviewed-by: Richard Palethorpe <rpalethorpe@suse.com>
Reviewed-by: Richard Palethorpe <rpalethorpe@suse.com>
In-reply-to: <20210622122538.402907-3-liwang@redhat.com>
Date: Tue, 22 Jun 2021 14:40:45 +0100
Message-ID: <87a6ni586a.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/3] tst_cgroup: make use of alias in
 safe_cgroup_has
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Li Wang <liwang@redhat.com> writes:

> This is to fix the check issue of 'memory.swap.max' on CGroup v1.
>
> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Richard Palethorpe <rpalethorpe@suse.com>
> ---
>  lib/tst_cgroup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
> index 18e3b6169..61cc02fa7 100644
> --- a/lib/tst_cgroup.c
> +++ b/lib/tst_cgroup.c
> @@ -1010,7 +1010,7 @@ int safe_cgroup_has(const char *const file, const int lineno,
>  		if (!(alias = cgroup_file_alias(cfile, *dir)))
>  		    continue;
>  
> -		if (!faccessat((*dir)->dir_fd, file_name, F_OK, 0))

Ah, dumb mistake by me!

> +		if (!faccessat((*dir)->dir_fd, alias, F_OK, 0))
>  			return 1;
>  
>  		if (errno == ENOENT)

Reviewed-by: Richard Palethorpe <rpalethorpe@suse.com>

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
