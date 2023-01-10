Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A8866430F
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Jan 2023 15:20:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AA5943CCB18
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Jan 2023 15:20:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A2C443CA6C2
 for <ltp@lists.linux.it>; Tue, 10 Jan 2023 15:20:22 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0DEE26005FC
 for <ltp@lists.linux.it>; Tue, 10 Jan 2023 15:20:21 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 00C7F77029
 for <ltp@lists.linux.it>; Tue, 10 Jan 2023 14:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673360421;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OPB+ki0dXvnzqeySE5ARXdEYRZaNwUh8ltDjf8AwZ5Q=;
 b=Uj1aKFznr0N6TQaHEz2Q3jX1HBLVfSiQIwmj2Kr8pYtDet70RiYw2t27PuS0d18/SjXn1e
 FIbCrtJCSAzk0f6W84K7C/F0wmtFrND+L2u3CEyCf1Vwt/XQrxb+vUn3r5Ce7WnYu38Nq0
 p0qUpz7Lxr6XTf/0VplAdWTEO9BkKN8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673360421;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OPB+ki0dXvnzqeySE5ARXdEYRZaNwUh8ltDjf8AwZ5Q=;
 b=wNl9S0LEV/mfqT4yBH5C0latFlJzFFpzP/nZ4AQ0Li1+fVSp412rUVHIE63z9VM0SwVMom
 usoK2QbZAvq0k/DQ==
Received: from g78 (rpalethorpe.tcp.ovpn1.nue.suse.de [10.163.17.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 17A252C141;
 Tue, 10 Jan 2023 14:20:19 +0000 (UTC)
References: <20230110130711.29274-1-akumar@suse.de>
User-agent: mu4e 1.8.13; emacs 28.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Avinesh Kumar <akumar@suse.de>
Date: Tue, 10 Jan 2023 14:20:14 +0000
Organization: Linux Private Site
In-reply-to: <20230110130711.29274-1-akumar@suse.de>
Message-ID: <87mt6qh3oc.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] setreuid01: Use SETREUID() instead of setreuid()
 to check 32bit syscall
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Merged, thanks!

Avinesh Kumar <akumar@suse.de> writes:

> Signed-off-by: Avinesh Kumar <akumar@suse.de>
> ---
>  testcases/kernel/syscalls/setreuid/setreuid01.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/setreuid/setreuid01.c b/testcases/kernel/syscalls/setreuid/setreuid01.c
> index bbf29d360..7c2b6d589 100644
> --- a/testcases/kernel/syscalls/setreuid/setreuid01.c
> +++ b/testcases/kernel/syscalls/setreuid/setreuid01.c
> @@ -26,13 +26,13 @@ static void run(void)
>  	euid = geteuid();
>  	UID16_CHECK(euid, setreuid);
>  
> -	TST_EXP_PASS(setreuid(-1, -1));
> -	TST_EXP_PASS(setreuid(-1, euid));
> -	TST_EXP_PASS(setreuid(ruid, -1));
> -	TST_EXP_PASS(setreuid(-1, ruid));
> -	TST_EXP_PASS(setreuid(euid, -1));
> -	TST_EXP_PASS(setreuid(euid, euid));
> -	TST_EXP_PASS(setreuid(ruid, ruid));
> +	TST_EXP_PASS(SETREUID(-1, -1));
> +	TST_EXP_PASS(SETREUID(-1, euid));
> +	TST_EXP_PASS(SETREUID(ruid, -1));
> +	TST_EXP_PASS(SETREUID(-1, ruid));
> +	TST_EXP_PASS(SETREUID(euid, -1));
> +	TST_EXP_PASS(SETREUID(euid, euid));
> +	TST_EXP_PASS(SETREUID(ruid, ruid));
>  }
>  
>  static struct tst_test test = {
> -- 
> 2.39.0


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
