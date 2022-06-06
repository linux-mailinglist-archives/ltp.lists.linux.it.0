Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C335953E515
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jun 2022 16:33:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A9C343C8D4A
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jun 2022 16:33:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E03EA3C00D5
 for <ltp@lists.linux.it>; Mon,  6 Jun 2022 16:33:14 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3D928140075B
 for <ltp@lists.linux.it>; Mon,  6 Jun 2022 16:33:13 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 575DE1F939;
 Mon,  6 Jun 2022 14:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1654525993; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oni46wNQn12v2Hjy7U0tDVzuCSiwgJIyUpV6Gqlox6M=;
 b=zWBWGkEjWHdIrFkrBPjg513Buajtq1n9IL6C4h0kUuluZRFoOIrL4dDXjbjYx0J44mzVC6
 OO0mkAAPxZ8XX5efByRXzuyHH9MVMJ38QxEG9kpEoxVMfZ9dUIkZrXUweSlkKxUMTgRBsG
 Arl8heSDp7zePAtNp+sNupo5sRdEsio=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1654525993;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oni46wNQn12v2Hjy7U0tDVzuCSiwgJIyUpV6Gqlox6M=;
 b=hU7YKiEzqRXZUw97NYFIFOjqxD3Jt0cNXe8AiMNjxl5ESYfCTz6giA6/DFAOCR8TG6S8d+
 yOwk7RpDViJoPdAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 44F07139F5;
 Mon,  6 Jun 2022 14:33:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6uIZECkQnmKbYgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 06 Jun 2022 14:33:13 +0000
Date: Mon, 6 Jun 2022 16:35:18 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: zhaogongyi <zhaogongyi@huawei.com>
Message-ID: <Yp4Qpt5ho7UR8CPP@yuki>
References: <c9aee645b8c146aa9b87b2cb26a6dfd1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c9aee645b8c146aa9b87b2cb26a6dfd1@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] futex_waitv04: Add test for futex_waitv syscall
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> I also wondered whether to add these two testcases into
> futex_waitv01.c, there is a consideration that there are alse two

Will you send a patch that adds these cases to the futext_waitv01.c
then?

> other testcases need to be added according to linux manual:
> 1. A signal was sent to the sleeping task, returning -ERESTARTSYS.
> 2. Some futex at the list was woken, returning the index of some waked futex.

Feel free to send more patches, adding more test coverage is always
welcomed.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
