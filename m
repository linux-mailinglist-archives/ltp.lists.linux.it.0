Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A773A97EB
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 12:42:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 486A73C7189
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 12:42:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D6BBC3C1C51
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 12:42:25 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6B8C7200C68
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 12:42:25 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E6AFB1FD47;
 Wed, 16 Jun 2021 10:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623840144;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kPIS9IfVMPlQrSQx3lIPi8mzuyQctD4h8cOr+6hjLZk=;
 b=VgYR6A553r0WdnCCSZpf6wWyrYgl5MwtapfOWM8WY6QSqFgUyQVo634sJZdk7FL79yFnI0
 zOp3zrjtdd/NUzLwjod3KaZo0v2USCh9eWCNZkntqAwo6m+hxx19p/1ywjw+1J0Hy+uZD5
 7hDmhjpNdeObqSimUdIojVMa0txz2fM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623840144;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kPIS9IfVMPlQrSQx3lIPi8mzuyQctD4h8cOr+6hjLZk=;
 b=Ff5GwCQLtoeIDQTOk8iMyOyZi12YUWTQg7Wg1YE5GM+jAiaDkE7oareGJ+N/Ag5hTK1bK0
 k0w8NxXL0B9f+UDA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 9F573118DD;
 Wed, 16 Jun 2021 10:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623840144;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kPIS9IfVMPlQrSQx3lIPi8mzuyQctD4h8cOr+6hjLZk=;
 b=VgYR6A553r0WdnCCSZpf6wWyrYgl5MwtapfOWM8WY6QSqFgUyQVo634sJZdk7FL79yFnI0
 zOp3zrjtdd/NUzLwjod3KaZo0v2USCh9eWCNZkntqAwo6m+hxx19p/1ywjw+1J0Hy+uZD5
 7hDmhjpNdeObqSimUdIojVMa0txz2fM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623840144;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kPIS9IfVMPlQrSQx3lIPi8mzuyQctD4h8cOr+6hjLZk=;
 b=Ff5GwCQLtoeIDQTOk8iMyOyZi12YUWTQg7Wg1YE5GM+jAiaDkE7oareGJ+N/Ag5hTK1bK0
 k0w8NxXL0B9f+UDA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id IsTOJJDVyWB/VQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 16 Jun 2021 10:42:24 +0000
Date: Wed, 16 Jun 2021 12:42:22 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YMnVjvuMnymDD2cA@pevik>
References: <20210615163307.10755-1-pvorel@suse.cz>
 <20210615163307.10755-3-pvorel@suse.cz> <YMnLEjDAVQqwH7Wq@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YMnLEjDAVQqwH7Wq@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 2/3] lib: Add $LTPROOT/testcases/bin into PATH
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
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>,
 Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> I guess that we can also fairly simplify the code by expecting that PATH
> is never unset from the start, maybe we should just check it and WARN if
> it's not. Also we can assume that if LTPROOT is set we do not have to
> add the start_dir since the start_dir is only useful when tests are
> executed from the git checkout.

I'm sorry to sent patchset with full of bugs, thanks for all your explanation.
While your suggestion could work, it's a question if my effort help to anything
(as Li noted). My intend was to require only LTPROOT, but even we expect
script/binary is called by full path (otherwise adjusting PATH would be required
anyway) fix work only for C API. tst_test.sh PATH is missing for shell API :(.
(discussed with Li under 3rd patch)

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
