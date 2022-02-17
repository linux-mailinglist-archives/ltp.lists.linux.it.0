Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3CA4B9C36
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Feb 2022 10:40:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 379613C9F19
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Feb 2022 10:40:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2D1F83C23B0
 for <ltp@lists.linux.it>; Thu, 17 Feb 2022 10:40:35 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 247F7200DEA
 for <ltp@lists.linux.it>; Thu, 17 Feb 2022 10:40:34 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1AA101F383;
 Thu, 17 Feb 2022 09:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1645090834; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=par63/FR9F0L/1vSXTdbL1MRNNPz8a9EIJtPr6UY9Uk=;
 b=ncyUkO91Rs67B0LBV5Gvx95/zepy8nugj+noLwhWZkF2mRz6yp9/LKeJgAs//KMP5NsElg
 mgnI/pYHvzj3dkCtBAQOjyu0E9tqBCCQ1r1W/dRO7KmEAj2ahfTAVFcD53DZZk7WrNqVhH
 sMMXC9/mtlu3kc/yXmJZT5eU8IwLnKo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1645090834;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=par63/FR9F0L/1vSXTdbL1MRNNPz8a9EIJtPr6UY9Uk=;
 b=8OSwOG8kcvVRVT6eIKDH9IGg5QqyMc3pjG6kJBYHsmYC5+fjMmnqbYEwOIKxgyF9gRmEfU
 QgDjW2QY7wx7iQBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 066FD13BBF;
 Thu, 17 Feb 2022 09:40:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EWBGABIYDmKiKAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 17 Feb 2022 09:40:34 +0000
Date: Thu, 17 Feb 2022 10:42:41 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <Yg4YkbUB3moje7Y8@yuki>
References: <20220203170522.22051-1-pvorel@suse.cz>
 <20220203170522.22051-2-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220203170522.22051-2-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] sctputil.h: Fix some formatting
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
Cc: Vlad Yasevich <vyasevich@gmail.com>,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Neil Horman <nhorman@tuxdriver.com>, ltp@lists.linux.it,
 linux-sctp@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
>  static inline void *test_malloc(size_t size)
>  {
>  	void *buf = malloc(size);
> -        if (NULL == buf)
> -                tst_brkm(TBROK, tst_exit, "malloc failed");
> +
> +	if (NULL == buf)
> +		tst_brkm(TBROK, tst_exit, "malloc failed");

This one has still constant on the right and I would rather change this
to the more common if (!buf) variant as well.

Other than that it's pretty obviously fine:

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

>  	return buf;
>  }
>  
> -- 
> 2.35.1
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
