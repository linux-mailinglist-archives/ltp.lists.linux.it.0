Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 074DCBBD644
	for <lists+linux-ltp@lfdr.de>; Mon, 06 Oct 2025 10:53:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 943753CE046
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Oct 2025 10:53:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1CD913C5372
 for <ltp@lists.linux.it>; Mon,  6 Oct 2025 10:53:04 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7431710005BF
 for <ltp@lists.linux.it>; Mon,  6 Oct 2025 10:53:03 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 78FF53373F;
 Mon,  6 Oct 2025 08:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1759740782; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H0bOCAX8byjNQYXYgUOmcs3fTd6LRj2f+rsyzAGSDeg=;
 b=lJd3XZjkCKhtl73UUcnTP0AS3mgXtITxHIpfNL6mrQKaQyyDWB8GG1PFBKTPA5ObNg+Xxv
 k6dp/B21qPoSzqehV6mCTjsxWvMEl66iNoQl1H9BB04TNSO0XS8kDqyUS1dosZHtD8ASJg
 Hb9w9pGgONDdgmn4urGZNdF8yIJ3EJQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1759740782;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H0bOCAX8byjNQYXYgUOmcs3fTd6LRj2f+rsyzAGSDeg=;
 b=jJAbHIAVzSdZoZpTQ4nV1QO4l+lkmv761wQ0wOfiXo0Xcn8C0CEaKYcp+eb6sTK9aV/6bX
 OVX2oN+YeraDw2DA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=lJd3XZjk;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=jJAbHIAV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1759740782; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H0bOCAX8byjNQYXYgUOmcs3fTd6LRj2f+rsyzAGSDeg=;
 b=lJd3XZjkCKhtl73UUcnTP0AS3mgXtITxHIpfNL6mrQKaQyyDWB8GG1PFBKTPA5ObNg+Xxv
 k6dp/B21qPoSzqehV6mCTjsxWvMEl66iNoQl1H9BB04TNSO0XS8kDqyUS1dosZHtD8ASJg
 Hb9w9pGgONDdgmn4urGZNdF8yIJ3EJQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1759740782;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H0bOCAX8byjNQYXYgUOmcs3fTd6LRj2f+rsyzAGSDeg=;
 b=jJAbHIAVzSdZoZpTQ4nV1QO4l+lkmv761wQ0wOfiXo0Xcn8C0CEaKYcp+eb6sTK9aV/6bX
 OVX2oN+YeraDw2DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3B08713995;
 Mon,  6 Oct 2025 08:53:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 63ckDW6D42giNAAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Mon, 06 Oct 2025 08:53:02 +0000
Date: Mon, 6 Oct 2025 10:53:51 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Avinesh Kumar <akumar@suse.de>
Message-ID: <aOODn-CZ7F1A777o@yuki.lan>
References: <20251003101310.13359-1-akumar@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251003101310.13359-1-akumar@suse.de>
X-Spam-Level: 
X-Rspamd-Queue-Id: 78FF53373F
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; MISSING_XM_UA(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Score: -4.51
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] openposix: update invalid clock id to accomodate
 new auxiliary clock ids
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
> There can be 8 more clock ids reserved on systems with
> CONFIG_POSIX_AUX_CLOCK=y [1]
> consequently clock 17 no longer remains an invalid id.
> 
> [1] https://lkml.org/lkml/2025/5/19/341
> 
> Signed-off-by: Avinesh Kumar <akumar@suse.de>
> ---
>  .../conformance/interfaces/clock_getres/6-2.c                 | 4 ++--
>  .../conformance/interfaces/clock_gettime/8-2.c                | 4 ++--
>  .../conformance/interfaces/clock_settime/17-2.c               | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/testcases/open_posix_testsuite/conformance/interfaces/clock_getres/6-2.c b/testcases/open_posix_testsuite/conformance/interfaces/clock_getres/6-2.c
> index c44809012..62de33c4f 100644
> --- a/testcases/open_posix_testsuite/conformance/interfaces/clock_getres/6-2.c
> +++ b/testcases/open_posix_testsuite/conformance/interfaces/clock_getres/6-2.c
> @@ -17,7 +17,7 @@
>   *   unassigned value = -1073743192 (ex. of what gcc will set to)
>   *   unassigned value = 1073743192 (ex. of what gcc will set to)
>   *   -1
> - *   17 (currently not = to any clock)
> + *   25 (not associated to any clock, considering posix auxiliary clocks also)

Technically you can have any number of clocks defined by a system that
implements POSIX. So the comment here should be:

"hopefully big enough not to be a valid clock value"

And we may possibly bump it to a larger value as well, e.g. 50


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
