Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8959B4617BD
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Nov 2021 15:14:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 534DD3C4DD2
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Nov 2021 15:14:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7148E3C2A88
 for <ltp@lists.linux.it>; Mon, 29 Nov 2021 15:14:26 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DDBAA601195
 for <ltp@lists.linux.it>; Mon, 29 Nov 2021 15:14:25 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E6DD621709;
 Mon, 29 Nov 2021 14:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1638195264; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nLjThjrkkrKdMwtiZK26y/jWPnmPDJjaJJzhW3C38XI=;
 b=Pf6ndHvAGUIZEbHe8b8S1Zud4L3L7HCC11tbm+wxgPFA34WJiEm2SK6xjdo0Nzous7xV18
 J8n8xw1bG1t12pmepT3uCEtp5YTz8v/P72NSlIY/DAynFiUmH0z34Cg2VzCeOQEuj0sQVr
 YGOWc91dm95bfLeJsQLIkfla2xVRrWc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1638195264;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nLjThjrkkrKdMwtiZK26y/jWPnmPDJjaJJzhW3C38XI=;
 b=0NvosQtHcJFvMLRDZh/ILZdSqMhjcdDC8TP9+neqZcAqkrhjBxTabwg2+/KkV9oot+2Ng6
 u0CMdTv0bW2N0RAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D365213B15;
 Mon, 29 Nov 2021 14:14:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id t1lLMkDgpGHYeAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 29 Nov 2021 14:14:24 +0000
Date: Mon, 29 Nov 2021 15:15:35 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <YaTghxZ06GNiNaY1@yuki>
References: <bd1156e573b0ea8bbf1feeee2cc2b5f84953c1ae.1638192701.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bd1156e573b0ea8bbf1feeee2cc2b5f84953c1ae.1638192701.git.jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] open_posix_testsuite/lio_listio/2-1: increase
 number of requests
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
> -#define NUM_AIOCBS	10
> +#define NUM_AIOCBS	256
>  #define BUF_SIZE	1024
>  
>  static volatile int received_selected;
> @@ -98,7 +98,7 @@ int main(void)
>  		memset(aiocbs[i], 0, sizeof(struct aiocb));
>  
>  		aiocbs[i]->aio_fildes = fd;
> -		aiocbs[i]->aio_offset = 0;
> +		aiocbs[i]->aio_offset = i * BUF_SIZE;

The only concern I have is that if the filesystem does not support
sparse files this will eat up 256MB right?

>  		aiocbs[i]->aio_buf = &bufs[i * BUF_SIZE];
>  		aiocbs[i]->aio_nbytes = BUF_SIZE;
>  		aiocbs[i]->aio_lio_opcode = LIO_WRITE;

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
