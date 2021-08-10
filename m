Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0863E5E6E
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Aug 2021 16:56:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0E0BB3C70B2
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Aug 2021 16:56:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 539C13C6778
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 16:56:32 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 633F61000D1B
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 16:56:31 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A73EB1FE5B;
 Tue, 10 Aug 2021 14:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628607390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eNdGsVD50Al/s28E/VRmljFGd5tmEe+qRBxTCGZF/ME=;
 b=c4HmfekEJ6M0+nFpW9qzA7GhD5jamTB1lhCnMDn9zs+gu4RByOwu9kOHoirMmYppuNuP93
 xQ7NeaaGyzb9uYhoXe6Cr/k6jwK07vyj4mDvbnpKQ1Xy1fEk4+kWSwjJHxsvji1v/4pvyO
 82strllMX4CTGciQH5BnjDDkJ8lrP/4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628607390;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eNdGsVD50Al/s28E/VRmljFGd5tmEe+qRBxTCGZF/ME=;
 b=LhIWs2UYJfD1c/p8OGTSM6kDRx68t6L1ea689XN+cpXYt5y6Rep/5zdtNg89DNlziQxyRO
 5iw6JvFql4iVxdDw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 94452133D0;
 Tue, 10 Aug 2021 14:56:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id h3kpI56TEmH7OwAAGKfGzw
 (envelope-from <mdoucha@suse.cz>); Tue, 10 Aug 2021 14:56:30 +0000
To: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
References: <20210806111938.12007-1-rpalethorpe@suse.com>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <28d60c6e-f29b-e17b-a34c-31142e872e3f@suse.cz>
Date: Tue, 10 Aug 2021 16:56:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806111938.12007-1-rpalethorpe@suse.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] setsockopt08: Handle ENOPROTOOPT even with
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

On 06. 08. 21 13:19, Richard Palethorpe via ltp wrote:
> One or more necessary modules can be missing even if they are present
> in the config.
> 
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> ---
>  .../kernel/syscalls/setsockopt/setsockopt08.c | 24 +++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt08.c b/testcases/kernel/syscalls/setsockopt/setsockopt08.c
> index 33892f9b1..d3cd5b5b2 100644
> --- a/testcases/kernel/syscalls/setsockopt/setsockopt08.c
> +++ b/testcases/kernel/syscalls/setsockopt/setsockopt08.c
> @@ -110,6 +110,7 @@ void run(void)
>  	struct xt_entry_target *xt_entry_tgt =
>  		((struct xt_entry_target *) (&ipt_entry->elems[0] + match_size));
>  	int fd = SAFE_SOCKET(AF_INET, SOCK_DGRAM, 0);
> +	int result;
>  
>  	xt_entry_match->u.user.match_size = (u_int16_t)match_size;
>  	strcpy(xt_entry_match->u.user.name, "state");
> @@ -126,10 +127,25 @@ void run(void)
>  	ipt_replace->num_counters = 1;
>  	ipt_replace->size = ipt_entry->next_offset;
>  
> -	TST_EXP_FAIL(setsockopt(fd, IPPROTO_IP, IPT_SO_SET_REPLACE, buffer, 1),
> -		     EINVAL,
> -		     "setsockopt(%d, IPPROTO_IP, IPT_SO_SET_REPLACE, %p, 1)",
> -		     fd, buffer);
> +	errno = 0;
> +	if (setsockopt(fd, IPPROTO_IP, IPT_SO_SET_REPLACE, buffer, 1) == -1) {
> +		switch (errno) {
> +		case EINVAL:
> +			result = TPASS;
> +			break;
> +		case ENOPROTOOPT:
> +			result = TCONF;
> +			break;
> +		default:
> +			result = TFAIL;
> +		}
> +	} else {
> +		result = TFAIL;
> +	}
> +
> +	tst_res(result | TERRNO,
> +		"setsockopt(%d, IPPROTO_IP, IPT_SO_SET_REPLACE, %p, 1)",
> +		fd, buffer);
>  
>  	SAFE_CLOSE(fd);
>  }

I think it'd be better to call tst_brk(TCONF) when setsockopt() returns
ENOPROTOOPT. The CVE runfile iterates the test 100 times and this error
will not change between iterations.

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
