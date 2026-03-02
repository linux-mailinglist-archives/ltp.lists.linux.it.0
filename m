Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAK4LTuvpWleEQAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Mon, 02 Mar 2026 16:39:39 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D521DBFF0
	for <lists+linux-ltp@lfdr.de>; Mon, 02 Mar 2026 16:39:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9DA073D7DE0
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2026 16:39:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E06373D79FF
 for <ltp@lists.linux.it>; Mon,  2 Mar 2026 16:39:28 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 61C5810000E4
 for <ltp@lists.linux.it>; Mon,  2 Mar 2026 16:39:28 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 91B173F80D;
 Mon,  2 Mar 2026 15:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772465967; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A3j/L/IwA65v/0OOAdBm99EEkCnk1fGStHN8t/pbqXs=;
 b=r8LZr4CTpTQr0FJyVVlY3B/oY0Eq09rH4gF2/ZKOYs2Qv/VUXVV3tl5mDjfkmTpH+td01e
 dvZzwTXg6tooV39vrR2bHhLn6daUaLh/j9nyfejuJd0dN/uOCJ41MAaSN7Cd+u0PXPIDCi
 7jiGGI1OCPLQIBW9bplQS8G6tn4Pntc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772465967;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A3j/L/IwA65v/0OOAdBm99EEkCnk1fGStHN8t/pbqXs=;
 b=KE2HDZyhKgEKDtBYQWsvrk2I7+mHWPQaPeQLm5CRleIQaNgP2yxqTaOCHCB4MMRjBGldhC
 ywDgliyOvcu2O3BA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772465967; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A3j/L/IwA65v/0OOAdBm99EEkCnk1fGStHN8t/pbqXs=;
 b=r8LZr4CTpTQr0FJyVVlY3B/oY0Eq09rH4gF2/ZKOYs2Qv/VUXVV3tl5mDjfkmTpH+td01e
 dvZzwTXg6tooV39vrR2bHhLn6daUaLh/j9nyfejuJd0dN/uOCJ41MAaSN7Cd+u0PXPIDCi
 7jiGGI1OCPLQIBW9bplQS8G6tn4Pntc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772465967;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A3j/L/IwA65v/0OOAdBm99EEkCnk1fGStHN8t/pbqXs=;
 b=KE2HDZyhKgEKDtBYQWsvrk2I7+mHWPQaPeQLm5CRleIQaNgP2yxqTaOCHCB4MMRjBGldhC
 ywDgliyOvcu2O3BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7FAC43EA69;
 Mon,  2 Mar 2026 15:39:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id V3AxHi+vpWncBQAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Mon, 02 Mar 2026 15:39:27 +0000
Date: Mon, 2 Mar 2026 16:39:36 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <aaWvOIlfyIDH7J8A@yuki.lan>
References: <20260302144446.1291724-1-amir73il@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260302144446.1291724-1-amir73il@gmail.com>
X-Spam-Score: -8.30
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] fanotify25: fix test failure on kernel with
 CONFIG_MODULES=n
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
Cc: Jan Kara <jack@suse.cz>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Queue-Id: 49D521DBFF0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[suse.cz];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.813];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[chrubis@suse.cz,ltp-bounces@lists.linux.it];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url]
X-Rspamd-Action: no action

Hi!
> Signed-off-by: Amir Goldstein <amir73il@gmail.com>
> ---
>  testcases/kernel/syscalls/fanotify/fanotify25.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify25.c b/testcases/kernel/syscalls/fanotify/fanotify25.c
> index c982f3225..9b03fd9ab 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify25.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify25.c
> @@ -24,10 +24,10 @@ static const struct traceconfig {
>  	const char *filename;
>  	const char *wdata;
>  } trace_cmds[] = {
> -	{EVENTS_SYSFILE, "p:ltp_load_module_0 load_module"},
> -	{MNTPOINT "/events/kprobes/ltp_load_module_0/enable", "1"},
> -	{MNTPOINT "/events/kprobes/ltp_load_module_0/enable", "0"},
> -	{EVENTS_SYSFILE, "-:ltp_load_module_0"},
> +	{EVENTS_SYSFILE, "p:ltp_load_script_0 load_script"},
> +	{MNTPOINT "/events/kprobes/ltp_load_script_0/enable", "1"},
> +	{MNTPOINT "/events/kprobes/ltp_load_script_0/enable", "0"},
> +	{EVENTS_SYSFILE, "-:ltp_load_script_0"},

Doesn't this depend on CONFIG_BINFMT_SCRIPT? How likely is that this is
turned off?

If possible I would like to avoid whack-a-mole game trying to find
something that is commonly enabled.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
