Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3311D64449A
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Dec 2022 14:33:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7E80C3CC193
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Dec 2022 14:33:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9C3D23C62EC
 for <ltp@lists.linux.it>; Tue,  6 Dec 2022 14:33:14 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C4C2E10018AA
 for <ltp@lists.linux.it>; Tue,  6 Dec 2022 14:33:13 +0100 (CET)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9D59B21C4D;
 Tue,  6 Dec 2022 13:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1670333591; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nesuv8pft0da6CQIb/sSGbIUL9k7MWRawPXdOVEUFzk=;
 b=bv32XDj64W25QhF5JbLRQq4e1nncZIgSn5gt4TPcP3YPner9KAP2MexvFdDCg6NRkNhsPp
 guIR8nQ23b3QitdpeVnZ24rRNCsfkErO4O93MmJ8ioGI/rf5IoaA9YMs26zU8W3OIsy4gz
 rtpL5MckFSHjfALUdo1vAW1bV1EoyyI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1670333591;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nesuv8pft0da6CQIb/sSGbIUL9k7MWRawPXdOVEUFzk=;
 b=ZWsU+SLvuirZiBZU0/IFU7R5cP7nfMEq3oO3BzKM06ZULGqwxAXjTjoirUHamp2jYDG0W6
 3mmfmSITo6U/5rBg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 886F213326;
 Tue,  6 Dec 2022 13:33:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id MYDlHpdEj2NtBgAAGKfGzw
 (envelope-from <chrubis@suse.cz>); Tue, 06 Dec 2022 13:33:11 +0000
Date: Tue, 6 Dec 2022 14:33:02 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <Y49EjvZHd1npsXS7@rei>
References: <20221206115329.17760-1-rpalethorpe@suse.com>
 <20221206115329.17760-2-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221206115329.17760-2-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] fill_fs: Ensure written data is not easily
 compressed
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
> --- a/lib/tst_fill_fs.c
> +++ b/lib/tst_fill_fs.c
> @@ -16,13 +16,20 @@ void tst_fill_fs(const char *path, int verbose)
>  {
>  	int i = 0;
>  	char file[PATH_MAX];
> -	char buf[4096];
> +	static char buf[4096];

I'm not sure if caching the random data is worth here, I bet that
reading the random data would be neglectible to the rest of the write
operations we do.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
