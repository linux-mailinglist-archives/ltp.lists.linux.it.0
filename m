Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6CF330C10
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 12:14:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 724453C5571
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 12:14:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id B44733C0CC6
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 12:14:51 +0100 (CET)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4DDBD60085C
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 12:14:51 +0100 (CET)
Received: by mail-pf1-x42c.google.com with SMTP id y13so3493392pfr.0
 for <ltp@lists.linux.it>; Mon, 08 Mar 2021 03:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Sc09Od41vjom9aQB6E81AJJCOmKJtkiUOvnZqLtwVRg=;
 b=EnkneGG2XYSNoSxT7gojPerseuXvxiAoRKb5oQQB/DiYFEvIafFAfvW+VYOpcmijqz
 PS7v5YlOjR9J0IW1ZPL8Ac0qwaubGK+dOZvgjsJGQ3U5m0dEADL59bHyWPFtBtWd8euF
 F6+qViKZQ6KVb7cGKwGyuRvdqdxpAV4euCrBmGZ2d16DTUl2LvDc4aEcCtqbiQgrz9TN
 UkFjqaTxDNZBt6Lm/I3hsVwplj2pug0EVrxEuwg6TW7pUEzYqvWYuzBXZsnNYXZIYg+M
 dfH/VgFCiyBJ+/DhcXaOXnJc0YUkW4jE0NAb9yMton9ZdkWeC64K3QTsVG9IDHOgmAob
 TVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Sc09Od41vjom9aQB6E81AJJCOmKJtkiUOvnZqLtwVRg=;
 b=V/rMAo0/jOwluuwsoM3qPbhSKMKw9cOxvOmXhPQrN6I/9quChBm/++4e838jK3FAgS
 NAj5KHzobGCKWkHLsZQfxbIixSrMssd4RuzogJSVeFA2qSC8WUoIvbuYIb4UU7PMyOSY
 cUkunweH6nP95oGfXUPJHNoExvUPa7pWFftscdwwhOvy0aPgo9TZU73sUXx3MXc6rrdL
 coaGtV3f+hAgKRAVGbVmqGx+ZzIR51D3M5kA/Y8rjH/WBhO+ACL7M04DgtIc1J4PZGDw
 efnvqpAvpuCePMW0rgsGjXm8Fu+ZdaUOydpGVoGM1Luwch94e53Maoi9S3OCHL7yhW4X
 6v8Q==
X-Gm-Message-State: AOAM532t4ByyTi8gfa0QdCq9ARwykAXIWIOMotrtgpisuZmzx7wbskUf
 HGW3Tz2ScUZUYWItkqzzMwX+Ew==
X-Google-Smtp-Source: ABdhPJz3qmLAdEOprlPCFrZttV3B8eRxsfstIFYs3OEeCycbF47xQBcdRuTaSNrXoceU4CMODugBLA==
X-Received: by 2002:a65:4785:: with SMTP id e5mr20453048pgs.0.1615202089771;
 Mon, 08 Mar 2021 03:14:49 -0800 (PST)
Received: from localhost ([122.171.124.15])
 by smtp.gmail.com with ESMTPSA id d10sm10583782pgl.72.2021.03.08.03.14.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Mar 2021 03:14:48 -0800 (PST)
Date: Mon, 8 Mar 2021 16:44:47 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Li Wang <liwang@redhat.com>
Message-ID: <20210308111447.h3l2a5yep3n4n5qs@vireshk-i7>
References: <20210308065329.25824-1-liwang@redhat.com>
 <20210308101732.lzkjql3t7aoscruk@vireshk-i7>
 <CAEemH2d45hFqhB-++xgswYoOh4HGFtFZxXCKGhLhDdt9oXFbfA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2d45hFqhB-++xgswYoOh4HGFtFZxXCKGhLhDdt9oXFbfA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] clock_gettime04: print more info to help debugging
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

On 08-03-21, 18:59, Li Wang wrote:
> Yes, but that's not harmful.

But is useless.

> If you remove all entries of varaints[] you can
> still get PASS from the test, that's something strange to us. So I just add
> this check there.

Yes, that would happen because we will not run the inner loop in that
case and even the condition you are adding will not run at all.

This wasn't designed to run with empty variants list and so we don't
verify that variants structure is empty or not and so it passes.

> No, that will only print the first entry instruct variants because you're
> using two iterations in the run(), the second loop 'j' is to traverse the
> variants[] actually.

Ahh, my bad. I didn't read the code properly. Sorry about that.

Now that I had a look again, with what you are adding here we will
start printing another line for each variant and it will be printed
just once at the beginning of the loop of 10000 iterations. Right ?

I am not sure how that will help you get more info out, to me it is
still very much unreadable. Can you show the final output as well ?

What about adding tv->desc to all the existing print messages instead
? Or maybe just the TFAIL ones? So we print everything in a single
line only ?

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
