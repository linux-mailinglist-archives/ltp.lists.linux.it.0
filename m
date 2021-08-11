Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D94833E93A1
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 16:24:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3D8E73C7002
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 16:24:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 238E23C0CFD
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 16:24:30 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8A6B11A002EE
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 16:24:29 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AAD12221DA;
 Wed, 11 Aug 2021 14:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628691868; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/CK8kOrzg0LBQKR7hgTh9+FlacJaGqb44BkIj5Nd/1c=;
 b=X844TRHGAP66OVjnQ9dGPlD0znyVXMWpR5gFuX3UnQqVQGJAep6zWKxSEUtFMRChWdOuoe
 G1qUV3NcA1XY+nZxfvzmKkowyigzTVvU2TSXnEqpUQFHU/lOFDBJYNXWDNM5MjFCkPdM8H
 kXnDAa4uJip7WvUH176z44eabUtPI28=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628691868;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/CK8kOrzg0LBQKR7hgTh9+FlacJaGqb44BkIj5Nd/1c=;
 b=HNknQgwMcGoFZq0UUK7unfgp9ySC2Wqrm2bC98hLemsLplcWyJQrc+I8nlh+2l3m+NVjws
 QiETZuQYnBc5yWCg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 966E213969;
 Wed, 11 Aug 2021 14:24:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 8uiwI5zdE2E8SwAAGKfGzw
 (envelope-from <mdoucha@suse.cz>); Wed, 11 Aug 2021 14:24:28 +0000
To: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
References: <20210806111938.12007-1-rpalethorpe@suse.com>
 <20210811072430.13560-1-rpalethorpe@suse.com>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <bca277c9-cd0d-788a-ae7d-73d4a0cadb91@suse.cz>
Date: Wed, 11 Aug 2021 16:24:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210811072430.13560-1-rpalethorpe@suse.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] setsockopt08: Handle ENOPROTOOPT even with
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

On 11. 08. 21 9:24, Richard Palethorpe via ltp wrote:
> One or more necessary modules can be missing even if they are present
> in the config.
> 
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> ---
> 
> V2:
> * Use tst_brk with TCONF
> 
>  .../kernel/syscalls/setsockopt/setsockopt08.c | 24 +++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt08.c b/testcases/kernel/syscalls/setsockopt/setsockopt08.c
> index 33892f9b1..7afb98403 100644
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
>  
>  	xt_entry_match->u.user.match_size = (u_int16_t)match_size;
>  	strcpy(xt_entry_match->u.user.name, "state");
> @@ -126,10 +129,23 @@ void run(void)
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
> +			tst_brk(TCONF | TERRNO, res_fmt_str, fd, buffer);
> +			return;
> +		default:
> +			result = TFAIL;
> +		}
> +	} else {
> +		result = TFAIL;
> +	}
> +
> +	tst_res(result | TERRNO, res_fmt_str, fd, buffer);
>  
>  	SAFE_CLOSE(fd);
>  }
> 

I think this would be much cleaner:

TEST(setsockopt(fd, IPPROTO_IP, IPT_SO_SET_REPLACE, buffer, 1));

if (TST_RET == -1 && TST_ERR == ENOPROTOOPT)
	tst_brk(TCONF | TTERRNO, res_fmt_str, fd, buffer);

result = (TST_RET == -1 && TST_ERR == EINVAL) ? TPASS : TFAIL;
tst_res(result | TTERRNO, res_fmt_str, fd, buffer);

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
