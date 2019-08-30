Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 314B4A2CE6
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Aug 2019 04:39:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 00E723C2019
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Aug 2019 04:39:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 46DE63C1C80
 for <ltp@lists.linux.it>; Fri, 30 Aug 2019 04:39:18 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 92CCF100054E
 for <ltp@lists.linux.it>; Fri, 30 Aug 2019 04:39:09 +0200 (CEST)
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7231A2A09D4
 for <ltp@lists.linux.it>; Fri, 30 Aug 2019 02:39:14 +0000 (UTC)
Received: by mail-oi1-f198.google.com with SMTP id t22so2257326oij.17
 for <ltp@lists.linux.it>; Thu, 29 Aug 2019 19:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R8tuedvutsxt4rZs0Y9CA6eCdO1zKVddtmaszdQ89zo=;
 b=Cs/8fvwQO4Y0EONA9aotf85Dyy8Ozfgrorj2dVks3hzoZ5BTjtWi0ZpM+BZLaS41pP
 NM/BeQykAzqD0dmF1cqzituU+MVrlJkWR7A9pDUU99vu1ybuBBcGq+zQI7TW3aWxgk2a
 E3uwBEvIBPslJLbOK7M2BjfA8fYvNmRdkg3j38MnjgUAA7bYKvu+BiDP6Z444HgyfYyb
 1cXhLLsif6LIaNhu0T+yJNL2yReYGUjxbBUzU/LKM1t7zD2otZqMcknxFttXMGIRW8m3
 wRytpk6zWj/vF8IX8r20uToLDK2CiBLxDp4kpD6x7FwidN/YDhy3yuUJJU2ntrdKEIiZ
 AeHw==
X-Gm-Message-State: APjAAAUTnX/ha1onQuNeqvOnrO9CZKDFDx2vjjv0Od4BFFf6Rg3TqAFk
 tfXuyQIXDl4+i44DogSFq3Mo1W8o9L13NSzjV5NM927QvsSL7lDdHY+ijbEc9LXd8OX9yaXmHdd
 q3Blmjf1StJNUsvj8MFyGzf6EWAY=
X-Received: by 2002:a9d:725b:: with SMTP id a27mr3740266otk.17.1567132753768; 
 Thu, 29 Aug 2019 19:39:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxSG/BN4QS9itl4acJjvfaxgQQIraqnISCT8sHFoP1GUozY6XYgaLbBIDy08BxD6j+pp9+Q7LLqptorAY7d2Cs=
X-Received: by 2002:a9d:725b:: with SMTP id a27mr3740255otk.17.1567132753565; 
 Thu, 29 Aug 2019 19:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190829181146.20261-1-pvorel@suse.cz>
In-Reply-To: <20190829181146.20261-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Fri, 30 Aug 2019 10:39:02 +0800
Message-ID: <CAEemH2dzn92GYwiw2tP101wNkYfM30rfL=cmPU+B1iH-8UWoDw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] memcg_stress_test.sh: Respect LTP_TIMEOUT_MUL set
 by user
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Aug 30, 2019 at 2:12 AM Petr Vorel <pvorel@suse.cz> wrote:
>
> While it's good to increase the default LTP_TIMEOUT_MUL value, give user
> a chance to change it.

It's a good proposal, but one thing we need to consider that there is
possible to pass a small timeout value(<5mins) from the user. So what
about set a condition judgment which only accepts time value which >=
7?

>  # Each test case runs for 900 secs when everything fine
>  # therefore the default 5 mins timeout is not enough.

Here the code comments reminder this.

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
