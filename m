Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJinNbMScmksawAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 13:06:11 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F57966662
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 13:06:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E8A9A3C0E0A
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 13:06:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DDDEA3C05FA
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 13:06:07 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4B466600BC7
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 13:06:07 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B47A8336A3;
 Thu, 22 Jan 2026 12:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769083566;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W7mdNQTI3ZIGwYZKcBjno79otgOm3KZTmsdMALicMVw=;
 b=E86prplC/3cxnZwB5VgUPWkvyhYlWN9FewCrvk5+6UVCGjA6stAwtOgefJ7sZmaJmR+YTf
 i/5ITGPnKy3Y7aqMWhI7gcch1q0r+fhkEZF9ELG/oaPpseTBzYfUAygm84eCe8bZisFz90
 5QU5IcRjmdtfxiPqeiaTqmrgkVFxCyY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769083566;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W7mdNQTI3ZIGwYZKcBjno79otgOm3KZTmsdMALicMVw=;
 b=s/UDqJ2Y/MiWf1G7E7pEbYUqcq5C3q/r0SkRN41LAF6A5OmWQ1ebXCXSLqUwsM/Ts7+3Yt
 DZ3F+rZAtKhVSPDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769083565;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W7mdNQTI3ZIGwYZKcBjno79otgOm3KZTmsdMALicMVw=;
 b=eN49PScte+2Wc5yaHoKx8JJBY+bOUfHmuI/PaZqeoX9HNDmRFXpa+1eJpS2ltmf4+Ip1s0
 /RMdNZLfJBkKjmyBCCJwFlibmYH7GrilrhQd28VNh6ZNris+CE58ziCods7H8BaD6/5IhO
 mnaa3A6O6Z1H0oFBIkdMgxda5Jq8D0E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769083565;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W7mdNQTI3ZIGwYZKcBjno79otgOm3KZTmsdMALicMVw=;
 b=inVF55okF8fY2Q4Yth9LbKPD5cmzKQYR5C95k9aurHzFEiBvv3cfUA9CEXyOyktulfsFpx
 igDhf2ewaCDQSZBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8EEC013533;
 Thu, 22 Jan 2026 12:06:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ZBn+Ia0ScmkYcAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 22 Jan 2026 12:06:05 +0000
Date: Thu, 22 Jan 2026 13:06:04 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20260122120604.GA64562@pevik>
References: <20260122111810.91411-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122111810.91411-1-liwang@redhat.com>
X-Spam-Score: -7.50
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] vma05: fix the needs_cmds format
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.99 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[suse.cz];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.cz:replyto,suse.cz:email,picard.linux.it:helo,picard.linux.it:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 6F57966662
X-Rspamd-Action: no action

Hi Li,

> Fixes: 39a28444272 ("lib: Add support option for .needs_cmds")
> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Wei Gao <wegao@suse.com>
> ---
>  testcases/kernel/mem/vma/vma05.sh | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

> diff --git a/testcases/kernel/mem/vma/vma05.sh b/testcases/kernel/mem/vma/vma05.sh
> index 34a82162c..b9654e80c 100755
> --- a/testcases/kernel/mem/vma/vma05.sh
> +++ b/testcases/kernel/mem/vma/vma05.sh
> @@ -26,7 +26,14 @@
>  # {
>  #  "needs_root": true,
>  #  "needs_tmpdir": true,
> -#  "needs_cmds": ["gdb", "uname"],
> +#  "needs_cmds": [
> +#     {
> +#       "cmd": "gdb"
> +#     },
> +#     {
> +#       "cmd": "uname"
> +#     }
> +#   ],

Good catch, thanks!
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

>  #  "save_restore": [
>  #   ["/proc/sys/kernel/core_pattern", "core", "TBROK"],
>  #   ["/proc/sys/kernel/core_uses_pid", "0", "TBROK"]

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
