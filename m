Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BD63FDDA7
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 16:08:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7773B3C2B78
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 16:08:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 51EF13C2A05
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 16:08:02 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 76B5D600D78
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 16:08:02 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B316220233;
 Wed,  1 Sep 2021 14:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630505281;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mBWQwaRhx8OvAY5JRFRKcpQ7S+spqG1XEc3VVkGp1ik=;
 b=MS9f89jIDKi7KJIpP7CqOwKScVdWANX67nd7rMd77i72l5zOzEUJMFtHxPMHbPFjww907q
 9T2yeQyAy8gYw2lM+GsK030JFXv672522qhflijNF6YVOZ06j9xtKupeX36yGrAKPKKCNp
 AS0hWkc7plC8ycY0dstmTWO5tUuJjdg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630505281;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mBWQwaRhx8OvAY5JRFRKcpQ7S+spqG1XEc3VVkGp1ik=;
 b=B5ptVyFyi2DHokuToIq2+kHTuSFZ27D55ryUPGXaz0nCmTAvBqHxbSA2EXX6Gr922zKvQU
 wsTqyj4v7HM+E5AA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 8051213AD6;
 Wed,  1 Sep 2021 14:08:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id eeZXHUGJL2E4aAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 01 Sep 2021 14:08:01 +0000
Date: Wed, 1 Sep 2021 16:08:00 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Dai Shili <daisl.fnst@fujitsu.com>
Message-ID: <YS+JQLNhte4E3jxM@pevik>
References: <1629294657-28375-1-git-send-email-daisl.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1629294657-28375-1-git-send-email-daisl.fnst@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/pread01: Convert to new API
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Dai,

> diff --git a/testcases/kernel/syscalls/pwrite/pwrite01.c b/testcases/kernel/syscalls/pwrite/pwrite01.c
...
> -/*
> - * Test Name: pwrite01
> +/*\
> + * [Description]
>   *
> - * Test Description:
>   *  Verify the functionality of pwrite() by writing known data using pwrite()
>   *  to the file at various specified offsets and later read from the file from
>   *  various specified offsets, comparing the data written aganist the data
>   *  read using read().

You kept 2 spaces between * and text. That'll lead in docparse formatting (which
uses markdown) to formatted as code, which is wrong. It must be without space:

/*\
 * [Description]
 *
 * Verify the functionality of pwrite() by writing known data using pwrite()
 * to the file at various specified offsets and later read from the file from
 * various specified offsets, comparing the data written aganist the data
 * read using read().
 */

Again, I have already prepared fixes, just wait for others to review.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
