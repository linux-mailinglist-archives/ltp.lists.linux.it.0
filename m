Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 812E024B678
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 12:36:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4AD7F3C2FA2
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 12:36:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 096943C12A1
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 12:36:25 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 36BA6200DC4
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 12:36:25 +0200 (CEST)
Received: from mail-lf1-f69.google.com ([209.85.167.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1k8hvk-0003w9-6g
 for ltp@lists.linux.it; Thu, 20 Aug 2020 10:36:24 +0000
Received: by mail-lf1-f69.google.com with SMTP id y78so535655lff.12
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 03:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dnd5pDBcyDcf5Sm7elYkoHcKIDZ/i/LEkg7ytt/Yw+U=;
 b=IGRJ7nUgkfHm3YobheicDBtDdD9qr9u1BmIIsW2MT2WhzZVgxpxh5jNej3ZKA3FsLS
 B0mFe1nM+8aPxHHyWmYGMdBa5gN31HysqRjyqsZeYJwax2M80rDpyUV1HTOI3GJMet2x
 psxV7TqbE8LddxGpn+sqgchrryn2K97DEwdYMEOZwxim5Ex9wkr7Ni0AxA6y6MGP5a5p
 XwBCfkU0mflsHmmsMnxj6h3hmcF3j3g73llCOgTw1Pz96KMX1s9uw1vKU93T/Ro5O7UN
 IUZZ3wfEZx92TAGqIt955D078a/KkgnPZJnrXrQbs572OTSVpyAzwPeBze9spongHliN
 UX9A==
X-Gm-Message-State: AOAM533omnKczevjp+2cF98Qk2QXQv2MY38PvacKNmSW9eGQFf82CMff
 bJvzCF3kijnX2mJZsk3/J8guBW7MbbPrhWJxywRx7PuLcO3wllDSspltVPXG6IQpSrYuZHQoRdC
 4WxbvJolU1CKQWqIboS157Tdto9589OsAH3rxgQfS2Fk=
X-Received: by 2002:a05:651c:543:: with SMTP id
 q3mr1272116ljp.145.1597919783654; 
 Thu, 20 Aug 2020 03:36:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQPNumjGjxGt4rUlLTaeVP8Tn4qERI37JqiLNr9Mvgmhn9JoLPUXEJkpNzh+OlOspd4cyKJKWtQ0RasYoz5qo=
X-Received: by 2002:a05:651c:543:: with SMTP id
 q3mr1272079ljp.145.1597919782453; 
 Thu, 20 Aug 2020 03:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200820100238.15925-1-pvorel@suse.cz>
In-Reply-To: <20200820100238.15925-1-pvorel@suse.cz>
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
Date: Thu, 20 Aug 2020 18:36:10 +0800
Message-ID: <CAMy_GT8uNt4aLQPgbtFRrABmesFQ6WyOCEOtOF=A0EZ4h0McCw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] tst_kvcmp: Fix parsing format for
 /etc/os-release
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

Hello Petr,

I tried to run this with the syscalls/utimensat01 test on Ubuntu
(ID=ubuntu), it will fail with:
safe_file_ops.c:220: BROK: Expected 1 conversions got 0 FILE
'/etc/os-release' at tst_kvercmp.c:152

On Thu, Aug 20, 2020 at 6:02 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> We need to strip double quotes.
> Also for openSUSE Tumbleweed, which contains ID="opensuse-tumbleweed"
> it "\"%s\"" does not remove trailing double quote, thus match all but
> double quote.
>
> Fixes: e2e60a39b ("lib/tst_kvercmp: Add support /etc/os-release")
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  lib/tst_kvercmp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/lib/tst_kvercmp.c b/lib/tst_kvercmp.c
> index 185a5c39c..7e980e076 100644
> --- a/lib/tst_kvercmp.c
> +++ b/lib/tst_kvercmp.c
> @@ -146,7 +146,8 @@ const char *tst_kvcmp_distname(const char *kver)
>                 return "RHEL6";
>
>         if (access(OSRELEASE_PATH, F_OK) != -1) {
> -               SAFE_FILE_LINES_SCANF(NULL, OSRELEASE_PATH, "ID=%s", distname);
> +               SAFE_FILE_LINES_SCANF(NULL, OSRELEASE_PATH, "ID=\"%[^\"]\"",
> +                                     distname);
>
>                 while (*p) {
>                         *p = toupper((unsigned char)*p);
> --
> 2.28.0
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
