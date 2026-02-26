Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBO7LXoLoGnbfQQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 09:59:38 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 588AE1A306D
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 09:59:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8900D3CB44A
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 09:59:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1D1E33C5489
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 09:59:34 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E06B2200266
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 09:59:32 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4F6E15BE2B;
 Thu, 26 Feb 2026 08:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772096371; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iEbZZAjWTdDfFzzkMEgyWsXeaQELgrPlzT6njEpC4Nc=;
 b=Pd59HKxKeapRPqoPyCHPJukhHGKXL/lxkGr6FDB6JU2bXFpTRi+K1myvmU76OBSj2hNuRi
 ezb/XcQeYkgOfpkRsMnJiWTLkAQgpSNuASvy5dmBtOBkHOGt7i7rCB53o5ulflkX3OciTy
 vK7gU/KwDd+JdzR/beqMR9Sp8rQKFvA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772096371;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iEbZZAjWTdDfFzzkMEgyWsXeaQELgrPlzT6njEpC4Nc=;
 b=ZHvt4eNjz9YzEfY5DmlLjL8Ih+z8k3NDTp6idFG5vayN4TFBE6xtmGG/DRrZKUoq9hKULu
 cyINQNsMWtNXHiAA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=Pd59HKxK;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=ZHvt4eNj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772096371; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iEbZZAjWTdDfFzzkMEgyWsXeaQELgrPlzT6njEpC4Nc=;
 b=Pd59HKxKeapRPqoPyCHPJukhHGKXL/lxkGr6FDB6JU2bXFpTRi+K1myvmU76OBSj2hNuRi
 ezb/XcQeYkgOfpkRsMnJiWTLkAQgpSNuASvy5dmBtOBkHOGt7i7rCB53o5ulflkX3OciTy
 vK7gU/KwDd+JdzR/beqMR9Sp8rQKFvA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772096371;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iEbZZAjWTdDfFzzkMEgyWsXeaQELgrPlzT6njEpC4Nc=;
 b=ZHvt4eNjz9YzEfY5DmlLjL8Ih+z8k3NDTp6idFG5vayN4TFBE6xtmGG/DRrZKUoq9hKULu
 cyINQNsMWtNXHiAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 34E663EA62;
 Thu, 26 Feb 2026 08:59:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cSabC3MLoGmtNQAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Thu, 26 Feb 2026 08:59:31 +0000
Date: Thu, 26 Feb 2026 09:59:35 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Wei Gao <wegao@suse.com>
Message-ID: <aaALdx9zYZDUzs2G@yuki.lan>
References: <20251125044057.20922-1-wegao@suse.com>
 <20260225015044.19233-1-wegao@suse.com> <aZ7V7XD6LIiZ4m0e@yuki.lan>
 <aZ-jDRXSWK78VmdE@autotest-wegao.qe.prg2.suse.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aZ-jDRXSWK78VmdE@autotest-wegao.qe.prg2.suse.org>
X-Spam-Score: -4.51
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v4] tst_tmpdir: Fix buffer overflow in tst_tmpdir.c
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
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[chrubis@suse.cz,ltp-bounces@lists.linux.it];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: 588AE1A306D
X-Rspamd-Action: no action

Hi!
> diff --git a/lib/tst_tmpdir.c b/lib/tst_tmpdir.c
> index 9b024a74e..0c06a306c 100644
> --- a/lib/tst_tmpdir.c
> +++ b/lib/tst_tmpdir.c
> @@ -186,8 +186,10 @@ static int purge_dirat(int dir_fd, const char *path, char **errptr)
>                         continue;
>  
>                 /* Recursively remove the current entry */
> -               if (rmobjat(subdir_fd, dir_ent->d_name, errptr) != 0)
> +               if (rmobjat(subdir_fd, dir_ent->d_name, errptr) != 0) {
> +                       close(subdir_fd);  <<<<<<<<<< first close
>                         ret_val = -1;
> +               }
>         }
>         
>         closedir(dir);  <<<<<<<<<<<<< second close

Ah, right, we hand the fd to the fdopendir() and it's closed in the
closedir() call. I've missed that since the closedir() is not shown in
the diff since that part of the code wasn't modified and haven't shown
up in the diff.

The patch looks good to me then.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
