Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3BD387400
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 10:30:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5AFE73C30A1
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 10:30:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CB10C3C2607
 for <ltp@lists.linux.it>; Tue, 18 May 2021 10:30:18 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9F1D01400F97
 for <ltp@lists.linux.it>; Tue, 18 May 2021 10:30:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621326614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6z0dW0pbuG9OPnhF9vXC0A+adcKKU1YvMsbwwvZ8SW4=;
 b=Bpet2aoYHXmRZhI23elVI2l+ZJbF65EA4dzkaZyTLokpmHgN3R/+KW7OP/PCyMUbUUedgM
 OJlPj8GFJ6cxvIddO/cXhl9KHk1sZI7NZfF5f2aOmVA72XPPXC1/xn21CtW++r4VvzD0jF
 qIuTRngvVSmuiebhww+sozpYKoxD1io=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-0On432VWNUu4O4eO5-UKDg-1; Tue, 18 May 2021 04:30:10 -0400
X-MC-Unique: 0On432VWNUu4O4eO5-UKDg-1
Received: by mail-yb1-f199.google.com with SMTP id
 d4-20020a25b5c40000b02904f8e3c8c6c9so12695593ybg.14
 for <ltp@lists.linux.it>; Tue, 18 May 2021 01:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6z0dW0pbuG9OPnhF9vXC0A+adcKKU1YvMsbwwvZ8SW4=;
 b=MGnpM/G4o2GdDZNHMLI2y9SUPIp4ULLN9g2i9i0ehG4oJi5BidzCMABbu+57GO3fRL
 gQZ7istDtdYYoljMrx6r5CGDq2HuTHBMOCmycftW/7AryXe379Jnd9E2mS64J1PlvSgl
 jyMXa+0QFnjgpBufNjtN1FI6dkEY1+vAeyJAPawdw3RLjQYnqa0jB+iDvCVIYUXlRyDS
 j1QrgPQHR+UQlyK2HngVO8G1+Fp3Mj+pFLYdRO9NUaK5ptqivleJgMjuacqYqHo/tOIv
 WFOnMlMxXUmrjzvXQAeoNd0FOkUVYzB5OJREuqz8DvLgc/zDX8gol1BlEVqFv/KkGg/P
 RL3w==
X-Gm-Message-State: AOAM531yBA34ICL1oKXas3NyHJAkOvGZj+QdJk58NqzNXuprh6WkcfCk
 IcQotvycGvw3MIrCwLnnGUx+SBzEE1cJho5Lk4/IJsS6C6aRuLI1Cz7w2ZpPU2COqAmNh4UbRRH
 KWyMq3h2ko+NLl5SxZF5jpTqysO8=
X-Received: by 2002:a25:27c2:: with SMTP id n185mr5543083ybn.110.1621326610074; 
 Tue, 18 May 2021 01:30:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwr80Q5bCROy8Lwv9CDGT6eQqYg6vuovS4CcCYP51oyfv6xz32D2RsFK6Mie2XfPjplToShQ/+JFKk5eelI6BY=
X-Received: by 2002:a25:27c2:: with SMTP id n185mr5543057ybn.110.1621326609886; 
 Tue, 18 May 2021 01:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210514132639.4181-1-pvorel@suse.cz> <YJ6A0gcR9L+P9IXm@yuki>
 <YJ6SDSAsLoXHgnOc@pevik> <YKJ2HQ0gUN2rQtEi@yuki>
In-Reply-To: <YKJ2HQ0gUN2rQtEi@yuki>
From: Li Wang <liwang@redhat.com>
Date: Tue, 18 May 2021 16:29:57 +0800
Message-ID: <CAEemH2fjtp5126oZz45azeqBUdaeuJgvtXLbjNpgezBu3kTjQw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [Automated-testing] [RFC PATCH 1/1] doc: Add supported
 kernel, libc versions
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
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>, automated-testing@yoctoproject.org,
 Yang Xu <xuyang2018.jy@cn.fujitsu.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

LGTM(with fixing as the above suggestions). Thanks for starting this doc.

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
