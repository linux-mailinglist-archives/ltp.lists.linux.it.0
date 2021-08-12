Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 967623EA2AF
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Aug 2021 12:06:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6756D3C6BB2
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Aug 2021 12:06:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 69DA53C306E
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 12:06:30 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7E818200DBD
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 12:06:29 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C5AF01FF30;
 Thu, 12 Aug 2021 10:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628762788; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CUMY8E3gIjqflkpAp333ZhmkC6K3N5KT409WuHPaOWw=;
 b=3EZlW1PKj8zitLFzTy5CLpamEyBLenWiUCsZPkBRe6255CsOPznG2DI+jORlNiczyH1UJr
 ul/5cGf+NldzHPjCoy6Dy58O0wNp5iWveOH7SCVHP1hSPQLLjtHh5vczAMA7ef0cg7nHOz
 480ntBMM+QRu6Ncj+7bAK9pguC8qwCQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628762788;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CUMY8E3gIjqflkpAp333ZhmkC6K3N5KT409WuHPaOWw=;
 b=NDHJif+Kddckcn7xawGKUcDHHaOmWlymNaoo9iz+9kRZ1R1WJVyDC+X2Psyrk9oywdnVdO
 jc6OVtRVglV87KBQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id B473A13846;
 Thu, 12 Aug 2021 10:06:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id B1mLKqTyFGHOIwAAGKfGzw
 (envelope-from <mdoucha@suse.cz>); Thu, 12 Aug 2021 10:06:28 +0000
To: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
References: <20210811142438.2C8D3A3CBF@relay2.suse.de>
 <20210812064741.4246-1-rpalethorpe@suse.com>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20d55401-e0f4-0d68-74eb-d931134ba52c@suse.cz>
Date: Thu, 12 Aug 2021 12:06:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210812064741.4246-1-rpalethorpe@suse.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] setsockopt08: Handle ENOPROTOOPT even with
 compatible config
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,
small nit below but otherwise it looks good.

Reviewed-by: Martin Doucha <mdoucha@suse.cz>

On 12. 08. 21 8:47, Richard Palethorpe wrote:
> One or more necessary modules can be missing even if they are present
> in the config.
> 
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> Suggested-by: Martin Doucha <mdoucha@suse.cz>
> ---
> 
> V3:
> * Use code suggested by Martin. Functionally it is the same as V2.
> 
> I'm not sure which is easier to read, but usually more indentation
> makes things worse. So this is better in that regard.
> 
>  .../kernel/syscalls/setsockopt/setsockopt08.c      | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt08.c b/testcases/kernel/syscalls/setsockopt/setsockopt08.c
> index 33892f9b1..20abe85b4 100644
> --- a/testcases/kernel/syscalls/setsockopt/setsockopt08.c
> +++ b/testcases/kernel/syscalls/setsockopt/setsockopt08.c
> @@ -101,6 +101,8 @@ void setup(void)
>  
>  void run(void)
>  {
> +	const char *const res_fmt_str =
> +		"setsockopt(%d, IPPROTO_IP, IPT_SO_SET_REPLACE, %p, 1)";
>  	struct ipt_replace *ipt_replace = buffer;
>  	struct ipt_entry *ipt_entry = &ipt_replace->entries[0];
>  	struct xt_entry_match *xt_entry_match =
> @@ -110,6 +112,7 @@ void run(void)
>  	struct xt_entry_target *xt_entry_tgt =
>  		((struct xt_entry_target *) (&ipt_entry->elems[0] + match_size));
>  	int fd = SAFE_SOCKET(AF_INET, SOCK_DGRAM, 0);
> +	int result;

Unused variable ^

>  
>  	xt_entry_match->u.user.match_size = (u_int16_t)match_size;
>  	strcpy(xt_entry_match->u.user.name, "state");
> @@ -126,10 +129,13 @@ void run(void)
>  	ipt_replace->num_counters = 1;
>  	ipt_replace->size = ipt_entry->next_offset;
>  
> -	TST_EXP_FAIL(setsockopt(fd, IPPROTO_IP, IPT_SO_SET_REPLACE, buffer, 1),
> -		     EINVAL,
> -		     "setsockopt(%d, IPPROTO_IP, IPT_SO_SET_REPLACE, %p, 1)",
> -		     fd, buffer);
> +	TEST(setsockopt(fd, IPPROTO_IP, IPT_SO_SET_REPLACE, buffer, 1));
> +
> +	if (TST_RET == -1 && TST_ERR == ENOPROTOOPT)
> +		tst_brk(TCONF | TTERRNO, res_fmt_str, fd, buffer);
> +
> +	result = (TST_RET == -1 && TST_ERR == EINVAL) ? TPASS : TFAIL;
> +	tst_res(result | TTERRNO, res_fmt_str, fd, buffer);
>  
>  	SAFE_CLOSE(fd);
>  }
> 


-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
