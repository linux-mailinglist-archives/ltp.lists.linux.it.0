Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C227945B539
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Nov 2021 08:19:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1A8463C6B59
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Nov 2021 08:19:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 20B9F3C0948
 for <ltp@lists.linux.it>; Wed, 24 Nov 2021 08:18:57 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5593B14012DC
 for <ltp@lists.linux.it>; Wed, 24 Nov 2021 08:18:56 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 952D51FD3A;
 Wed, 24 Nov 2021 07:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1637738335;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MKFlG3fylRuipipUDX3UVxBMODIaHYJIiiy+wYAnbTI=;
 b=x6YR8QnvXzUCHGdrSYSOQkAgDOC7eIa2FKbxc3A6mYFDd03IyxQn2KitbuEujDR0B9lT1Q
 F5TEjb77GZCY8/ulwCfuJdrtZ2lO0D53lA+wDOw3ZVbDUOscze6vKU+KWQUViz2USeDkPw
 gC17TXrxcqVRZBMz5GuP+w7Mxm7NZEA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1637738335;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MKFlG3fylRuipipUDX3UVxBMODIaHYJIiiy+wYAnbTI=;
 b=kZ8t6gIchjQCLdmeZD2jHKWjbccIRmy387MfOgTTtPKkRKqWR+SI+YBr4rcTsQQu76CYV7
 PoegEWy85sZv30BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5897A13EC4;
 Wed, 24 Nov 2021 07:18:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XLFTEV/nnWHdDgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 24 Nov 2021 07:18:55 +0000
Date: Wed, 24 Nov 2021 08:18:53 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YZ3nXUuDjePQxOt6@pevik>
References: <20211123124348.31073-1-rpalethorpe@suse.com>
 <20211123124348.31073-3-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211123124348.31073-3-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] doc: Add LTP-003 and LTP-004 static and tst
 API prefix rules
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

Hi Richie,

...
> +2.3 LTP-003: Externally visible library symbols have the tst_ prefix
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Functions, types and variables in the public test API should have the
> +tst_ prefix. With some exceptions for symbols already prefixed with
> +safe_ or ltp_.
BTW It'd be nice to have some check for shell library (maybe shellcheck would be
able to do it).

...

> +2.1.1 LTP-004: Test executable symbols are marked static
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Test executables should not export symbols unecessarily. This means
typo s/unecessarily/unnecessarily/

> +that all top-level variables and functions should be marked with the
> +static keyword. The only visible symbols should be those included from
> +shared object files.
> +

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
