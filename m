Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A13456D4AB
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Jul 2022 08:24:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C69253CA5CB
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Jul 2022 08:24:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3279C3CA5B7
 for <ltp@lists.linux.it>; Mon, 11 Jul 2022 08:24:56 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9FD64600277
 for <ltp@lists.linux.it>; Mon, 11 Jul 2022 08:24:55 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CCA92226AA;
 Mon, 11 Jul 2022 06:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1657520694;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=37CePCJut22/VK/V/6+02rUaXcbiSC+APYzLBFCLvbY=;
 b=o4gQyTlFYOXRSsEp6WQ3PpjklcivrZTgcwlmJGgzU0CwB2WqRN6HYKttS/D7UjroQr/RUK
 YZxCm9UEJKs/HMP69Dt6jV8iFWi2JGaLQZSQYYD3lTC7F8fhtmOyYUj55ek0tfmeZkjFhM
 M1b0xfysYdSZApIql8o6HWY7nwBx2Vc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1657520694;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=37CePCJut22/VK/V/6+02rUaXcbiSC+APYzLBFCLvbY=;
 b=xEL/OPHUKJaLpRUozpND8c+U8z8onrgpPzHMGr4wa2UaI4R85FydHUwCcK9vXFPMOI/ma3
 CwvsxaFG8XilT9Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9E29513322;
 Mon, 11 Jul 2022 06:24:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jYzZJDbCy2LZcQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 11 Jul 2022 06:24:54 +0000
Date: Mon, 11 Jul 2022 08:24:52 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Avinesh Kumar <akumar@suse.de>
Message-ID: <YsvCNJpex4jwQYYH@pevik>
References: <20220709165000.27830-1-akumar@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220709165000.27830-1-akumar@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] open08.c: Docparse format and rewording of
 description
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

Hi Avinesh,

> + * Verify that open() fails with:
Here needs to be blank line otherwise the result would be wrongly formatted:

Verify that open() fails with: - EEXIST when pathname already exists and O_CREAT and O_EXCL were used - EISDIR when pathname refers to a directory and the access requested involved writing - ENOTDIR when O_DIRECTORY was specified and pathname was not a directory - ENAMETOOLONG when pathname was too long - EACCES when requested access to the file is not allowed - EFAULT when pathname points outside the accessible address space

Please next time verify the result (cd metadata && make && $BROWSER ../docparse/*.html

Merged with this fix, removed docs and space behind #define.

Kind regards,
Petr

> + * - EEXIST when pathname already exists and O_CREAT and O_EXCL were used.
> + * - EISDIR when pathname refers to a directory and the access requested
> + * involved writing.
> + * - ENOTDIR when O_DIRECTORY was specified and pathname was not a directory.
> + * - ENAMETOOLONG when pathname was too long.
> + * - EACCES when requested access to the file is not allowed.
> + * - EFAULT when pathname points outside the accessible address space.
>   */

>  #define _GNU_SOURCE		/* for O_DIRECTORY */

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
