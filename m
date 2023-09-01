Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CEA78FDC5
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Sep 2023 14:53:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D4C683CBD17
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Sep 2023 14:53:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A0DDB3CB66E
 for <ltp@lists.linux.it>; Fri,  1 Sep 2023 14:53:24 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DCC5A601931
 for <ltp@lists.linux.it>; Fri,  1 Sep 2023 14:53:23 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D688521862;
 Fri,  1 Sep 2023 12:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1693572802; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7mRp39UPyi9gCLdYSkLGdKZAPoJl0E6DUFMYnrakoJg=;
 b=pJSZEE6ORu84NBslY/zc4d15k17jurQeEp3TnTGUMKmoEn8U7SBJIUDw5T7/40tdWUs8hX
 +cQT7alOFsfmwBKPNsKZLqCPUgCb1oeyITjo7MmwD4vl9loSEb7HLlnk5cxw2YU8mirq8H
 Jv3kbGBx+DB+KTwNY+4NYWR1lpBh1Kg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1693572802;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7mRp39UPyi9gCLdYSkLGdKZAPoJl0E6DUFMYnrakoJg=;
 b=6WHubaVXREpMWeKK8Wq2bTy/JbGiPJPndoa1F9FyaIc0VjrtR3W1WwyLGw7V2GIiiV2EJr
 3LELZs7Cuam7WuAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C00651358B;
 Fri,  1 Sep 2023 12:53:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LtL6LMLe8WR+MAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 01 Sep 2023 12:53:22 +0000
Date: Fri, 1 Sep 2023 14:53:58 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <ZPHe5jRwRI9ZGJI0@yuki>
References: <20230829073821.2580-1-andrea.cervesato@suse.de>
 <ZO8d3GO_jFgNAXNY@rei> <20230901103758.GC323151@pevik>
 <ZPHWK_Msrqbpmvtt@yuki> <20230901123126.GA343678@pevik>
 <ZPHayoB7_I6Xy8-k@yuki>
 <7058a129-f1b8-4a52-a6b2-7c0fd6643dee@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7058a129-f1b8-4a52-a6b2-7c0fd6643dee@suse.com>
X-Virus-Scanned: clamav-milter 1.0.1 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] Add process_madvise01 test
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
> >> BTW I wonder if we should add 'vmstat' or 'cat /proc/meminfo' to ver_linux.
> > cat /proc/meminfo sounds like a good idea.
> >
> Maybe do we need a flag in tst_test to check if swap is available or 
> not? Something similar to .min_mem_avail.

Sounds reasonable to me, that way we would get the information
propagated into metadata as well. Feel free to send a patch.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
