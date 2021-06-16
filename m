Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 929723A9674
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 11:43:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 647DE3C4CBC
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 11:43:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5836F3C4CB3
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 11:43:00 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4453E200C6E
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 11:42:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623836578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P9+uxpINV07Ty8ROFwk658poEdQ+uthn3/m7Y+4aQG0=;
 b=TkT/jzE7qrDfCf/rPR4tjhMK89ffEQ5806Q/c8FWeASQJGNR5jX57TXemTS1KSqbURUkuW
 8smcKQhNwbq7lkHb/4Tk9EoAPaK7fzozbvreQhmFdTlKnu3ZHHLnSIl8mZT5CtTZSpPmwd
 6kbEnTsZuru7TAXT/uxq1b8TrcGly9w=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-k6jgl-LvPUGgakq3rwmj8Q-1; Wed, 16 Jun 2021 05:42:54 -0400
X-MC-Unique: k6jgl-LvPUGgakq3rwmj8Q-1
Received: by mail-yb1-f197.google.com with SMTP id
 67-20020a2514460000b029053a9edba2a6so2059937ybu.7
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 02:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P9+uxpINV07Ty8ROFwk658poEdQ+uthn3/m7Y+4aQG0=;
 b=YubQoF21/PRT9fEQ/Pyf95fPzKpF/t3XeakvZbBLOUdKNcZrJvnR41o1QL23Jlroqx
 mfDESQl9v8oKG1yqxXxmSJe6BGV+cy27mH5Lim2WhD30QJRxBGnNYamksxUJheSTj2Yp
 E4zP6Vj3UD/C6tFpw5LjoUyN4HvWludXaWSq7Yvgbpc3bgHheTD1cYAjvvVPTTCpgs7w
 pGuBzAYDkIsQcZ9WBerLIv1n4bSntV6eKYuc1wAhCVgT91LS4LkAVxlQi0HApzEtnK0v
 sGHgsqDFNW8mWJCYqf2JnLt0H8V2UCVeafFlkutLjSuJlh73EVF51ZfOCWNRDFOA0FC6
 coMw==
X-Gm-Message-State: AOAM530ALL4xvWM6sqi98f6+lvxYsq7umtsTpMS7pXQd8+HvIeeKpc4e
 Yju5Dt5RRcEgTc9K2qVQBGUv3J8ediCZuX/CJKFUSvAFIoBZ31AQB/tkK1aFKcEQzBZMRUdt1ds
 fsgaF9N0oyiBqhcArCLI+ZlRX+pw=
X-Received: by 2002:a25:b44d:: with SMTP id c13mr5077896ybg.86.1623836574080; 
 Wed, 16 Jun 2021 02:42:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwc/ne1dt6jroQV/xtYVH2szVJxuwQLPjCbZ827djdOxwSCuadOlFZJfvAqUfn92XQxfDEajH8/gOddidqJz3k=
X-Received: by 2002:a25:b44d:: with SMTP id c13mr5077874ybg.86.1623836573862; 
 Wed, 16 Jun 2021 02:42:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210615163307.10755-1-pvorel@suse.cz>
 <20210615163307.10755-4-pvorel@suse.cz>
In-Reply-To: <20210615163307.10755-4-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Wed, 16 Jun 2021 17:42:42 +0800
Message-ID: <CAEemH2eLDk8rb3wUMCjz6Txo333f4Mae1AWZy0Rt6mTYuvYf6w@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 3/3] doc: Update LTPROOT and PATH environment
 variables
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>,
 Xiao Yang <yangx.jy@cn.fujitsu.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Jun 16, 2021 at 12:33 AM Petr Vorel <pvorel@suse.cz> wrote:
>
> to address changes in two previous commits.
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  README.md          | 2 +-
>  doc/user-guide.txt | 7 +++++--
>  2 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/README.md b/README.md
> index 703395c6b..b0ad47dfa 100644
> --- a/README.md
> +++ b/README.md
> @@ -162,7 +162,7 @@ $ testcases/bin/ioctl01 -h
>  Many require certain environment variables to be set
>
>  ```
> -$ LTPROOT=/opt/ltp PATH="$PATH:$LTPROOT/testcases/bin" testcases/bin/wc01.sh
> +$ LTPROOT=/opt/ltp testcases/bin/wc01.sh

I'm wondering does this really work? or, did I miss something?

Experiment in my kvm guest (with apply your patches):

# LTPROOT=/root/ltp-install wc01.sh
bash: wc01.sh: command not found...

# LTPROOT=/root/ltp-install testcases/bin/wc01.sh
-bash: testcases/bin/wc01.sh: No such file or directory

# LTPROOT=/root/ltp-install PATH="$PATH:$LTPROOT/testcases/bin" wc01.sh
wc01 1 TINFO: timeout per run is 0h 5m 0s
wc01 1 TPASS: wc passed with -c option.
wc01 2 TPASS: wc passed with --bytes option.
wc01 3 TPASS: wc passed with -l option.
wc01 4 TPASS: wc passed with --lines option.
wc01 5 TPASS: wc passed with -L option.
wc01 6 TPASS: wc passed with --max-line-length option.
wc01 7 TPASS: wc passed with -w option.
wc01 8 TPASS: wc passed with --words option.
wc01 9 TPASS: wc passed with -m option.
wc01 10 TPASS: wc passed with --chars option.
wc01 11 TPASS: wc passed with --help option.
wc01 12 TPASS: wc passed with --version option.

Summary:
passed   12
failed   0
broken   0
skipped  0
warnings 0

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
