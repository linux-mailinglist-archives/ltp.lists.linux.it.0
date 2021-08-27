Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0A43F9829
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Aug 2021 12:35:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 47B423C2DDB
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Aug 2021 12:35:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 03ADE3C28F2
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 12:35:45 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 570276018C7
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 12:35:45 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id C07901FEEE;
 Fri, 27 Aug 2021 10:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1630060544;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EAD8T6M9GZ4qBcOQnQk6J665WWOoVE35n+5KshoCKF4=;
 b=eL4kxECvJN4uw3RzS292CQlZeDe5S1Dk4xXmw+sR/4/EhST8Hor16FN3DO0Z4CyFfQ+TpZ
 26oXMHHp7XZxRK/5IfwTpCocF7XpU1b3Ectk2xnpwwux5H9L1YLWktxTqLk0bVBa9yojOJ
 NCksYHnPGJbAtHcqPIa1E6GZEVAKLdY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1630060544;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EAD8T6M9GZ4qBcOQnQk6J665WWOoVE35n+5KshoCKF4=;
 b=dp/QDZO6LVWeNk3vB1h20KDCHm0Y4NFFOgKRz/ucE/L5NwNG8AuQsn4lQNFmCXaV4+JPr5
 voxAR6vgIcEe3yCQ==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 893C5A3B97;
 Fri, 27 Aug 2021 10:35:44 +0000 (UTC)
References: <1628144855-5924-1-git-send-email-xuyang2018.jy@fujitsu.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
In-reply-to: <1628144855-5924-1-git-send-email-xuyang2018.jy@fujitsu.com>
Date: Fri, 27 Aug 2021 11:35:43 +0100
Message-ID: <87h7fbkwe8.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] userns/userns08.c: Enable userns in
 max_user_namespaces file
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

Hello Yang,

Yang Xu <xuyang2018.jy@fujitsu.com> writes:

> On old distros ie centos7, the default value of max_user_namespaces is set to 0.
> Enable it by increasing this value.
>
> Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>

Looks good, except for very minor point below.

Reviewed-by: Richard Palethorpe <rpalethorpe@suse.com>

> ---
>  testcases/kernel/containers/userns/userns08.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/testcases/kernel/containers/userns/userns08.c b/testcases/kernel/containers/userns/userns08.c
> index aedfc6c4e..0910ea7d4 100644
> --- a/testcases/kernel/containers/userns/userns08.c
> +++ b/testcases/kernel/containers/userns/userns08.c
> @@ -120,6 +120,11 @@ static void setup(void)
>  
>  	SAFE_WRITE(fd, 1, "\n", 1);
>  	SAFE_CLOSE(fd);
> +
> +	/* The default value of max_user_namespaces is set to 0 on some distros,
> +	 * We need to change the default value to call clone().
> +	 */

We don't need inline comments like this. In this case the commit message
and git-blame is fine. Other times the style guide requests it goes in
the comment at the top.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
