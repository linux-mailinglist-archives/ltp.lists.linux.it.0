Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGZAFf/EqmnVWwEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Mar 2026 13:13:51 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D552204E0
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Mar 2026 13:13:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 096703DD116
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2026 13:13:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CBCF13C59D2
 for <ltp@lists.linux.it>; Fri,  6 Mar 2026 13:13:40 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 48F266007BB
 for <ltp@lists.linux.it>; Fri,  6 Mar 2026 13:13:39 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B6C093E7A5;
 Fri,  6 Mar 2026 12:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772799218;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b+wpOdiC+Yf711NJ4GvYM4X1Y0LvfQKlQWmlmmLRb7I=;
 b=rxOGJ/SCyTgwo1mZJ2ciQrZb6CNhpIVWFqSF7O3YwEi0faLRtTfH50WW4835yebKu7By/i
 9vlqK1e0qzZvOpwh/Yo2hai6HEyMQMqVYM8wyZTLx3f+nAKS5O0aFIxrQVOCxNCs7pNh1X
 n5gsOcdk5TDot/2goWCOpUZnq0tHEog=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772799218;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b+wpOdiC+Yf711NJ4GvYM4X1Y0LvfQKlQWmlmmLRb7I=;
 b=ttVXelRA3qd/e0EyqSpl3ztz1W172yP2C7Q3KVi/S8xcCO7m4Tl+5UBCyN8WBuODFWurUq
 /U2/+epP7u7o0gAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772799218;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b+wpOdiC+Yf711NJ4GvYM4X1Y0LvfQKlQWmlmmLRb7I=;
 b=rxOGJ/SCyTgwo1mZJ2ciQrZb6CNhpIVWFqSF7O3YwEi0faLRtTfH50WW4835yebKu7By/i
 9vlqK1e0qzZvOpwh/Yo2hai6HEyMQMqVYM8wyZTLx3f+nAKS5O0aFIxrQVOCxNCs7pNh1X
 n5gsOcdk5TDot/2goWCOpUZnq0tHEog=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772799218;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b+wpOdiC+Yf711NJ4GvYM4X1Y0LvfQKlQWmlmmLRb7I=;
 b=ttVXelRA3qd/e0EyqSpl3ztz1W172yP2C7Q3KVi/S8xcCO7m4Tl+5UBCyN8WBuODFWurUq
 /U2/+epP7u7o0gAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4B5F63EA75;
 Fri,  6 Mar 2026 12:13:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id xkbVEPLEqmkyKAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 06 Mar 2026 12:13:38 +0000
Date: Fri, 6 Mar 2026 13:13:36 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20260306121336.GA519430@pevik>
References: <20260303105510.14305-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260303105510.14305-1-mdoucha@suse.cz>
X-Spam-Score: -3.50
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] fanotify25: Trace oom_kill_process() instead of
 load_module()
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
Cc: Amir Goldstein <amir73il@gmail.com>, Jan Kara <jack@suse.cz>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Queue-Id: E1D552204E0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.99 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,suse.cz:email,linux.it:url];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[suse.cz];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,suse.cz,lists.linux.it];
	RCPT_COUNT_THREE(0.00)[4];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	NEURAL_HAM(-0.00)[-0.896];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

Hi all,

> The load_module() function is available only if the kernel was built
> with CONFIG_MODULES enabled. Trace a function that's unconditionally
> available instead.

+1, that's obviously better than require CONFIG_BINFMT_SCRIPT or anything else.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

@Amir @Jan will you add your ack, please?

Kind regards,
Petr

> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> Reported-by: Amir Goldstein <amir73il@gmail.com>
> ---
>  testcases/kernel/syscalls/fanotify/fanotify25.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

> diff --git a/testcases/kernel/syscalls/fanotify/fanotify25.c b/testcases/kernel/syscalls/fanotify/fanotify25.c
> index c982f3225..db52e6a87 100644
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
> +	{EVENTS_SYSFILE, "p:ltp_oom_kill_process_0 oom_kill_process"},
> +	{MNTPOINT "/events/kprobes/ltp_oom_kill_process_0/enable", "1"},
> +	{MNTPOINT "/events/kprobes/ltp_oom_kill_process_0/enable", "0"},
> +	{EVENTS_SYSFILE, "-:ltp_oom_kill_process_0"},
>  	{}
>  };

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
