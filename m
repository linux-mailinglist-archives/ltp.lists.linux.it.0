Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2703D130D
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jul 2021 17:58:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 73C1A3C976D
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jul 2021 17:58:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5755D3C6C29
 for <ltp@lists.linux.it>; Wed, 21 Jul 2021 17:58:43 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D56D3200359
 for <ltp@lists.linux.it>; Wed, 21 Jul 2021 17:58:42 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5189A22578;
 Wed, 21 Jul 2021 15:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626883122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T2MkuXBJp0xnni3jv3GohO5I6S4ydixAQRgwB7guKD0=;
 b=uYPwxWrcDGkCjpGYOXDzAJqd9W8Nz2wfv0pBKK9Ilgsw7fPISFGRqe7BrIi/Vhz0VDTpK6
 Cjiv2XCgnfbQC84jorAClNNS99VWeIqNIoFUbhLfakB3Goz9JB+n/YSDhPo+k1tc/wKj5e
 SSu/rflA0bXpgto6KhILO6vzVFmkQjs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626883122;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T2MkuXBJp0xnni3jv3GohO5I6S4ydixAQRgwB7guKD0=;
 b=wjNIqSey2Am6hGqAPGWbpXfnu6aKYyONJ/NMg5O42JBK/dXohs5zVj4j/zfqi5RDSn1QoA
 J6wgEg7HG0H7FrBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 37D11139FD;
 Wed, 21 Jul 2021 15:58:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id phwTDTJE+GDaEgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 21 Jul 2021 15:58:42 +0000
Date: Wed, 21 Jul 2021 17:33:15 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <YPg+O2s0y/uUWiS7@yuki>
References: <20201111163114.GB23576@yuki.lan>
 <1615550541-21714-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1615550541-21714-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1615550541-21714-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 3/5] syscalls/msgstress02: Convert into new api
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
Generally looks much better, comments inline.

> -static int dotest(key_t key, int child_process)
> +static void dotest(key_t key, int child_process, int id)
>  {
> -	int id, pid;
> -	int i, count, status, exit_status;
> -
> -	sighold(SIGTERM);
> -	if ((id = msgget(key, IPC_CREAT | S_IRUSR | S_IWUSR)) < 0) {
> -		printf("msgget() error in child %d: %s\n",
> -			child_process, strerror(errno));
> -		return FAIL;
> -	}
> -	tid = id;
> -	sigrelse(SIGTERM);
> -
> -	exit_status = PASS;
> +	int pid, i, count;
>  
>  	for (i = 0; i < nkids; i++) {
> -		fflush(stdout);
> -		if ((pid = FORK_OR_VFORK()) < 0) {
> -			printf("Fork failure in the first child of child group %d\n",
> +		pid = fork();

Why don't we use SAFE_FORK() here as well?

I guess that the main point is to make sure that we cleanup the message
queueus that would otherwise stayed on the system.

...

> +	SAFE_SIGNAL(SIGTERM, SIG_IGN);

And here as well, I do not get why we ignore SIGTERM at all.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
