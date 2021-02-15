Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E4431BD0B
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Feb 2021 16:40:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9B7CF3C6766
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Feb 2021 16:40:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 058FA3C5994
 for <ltp@lists.linux.it>; Mon, 15 Feb 2021 16:40:04 +0100 (CET)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2C5FF1000A38
 for <ltp@lists.linux.it>; Mon, 15 Feb 2021 16:40:04 +0100 (CET)
Received: by mail-pj1-x102b.google.com with SMTP id cl8so3950139pjb.0
 for <ltp@lists.linux.it>; Mon, 15 Feb 2021 07:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=f/c7AxopKhgYq88HVbiWCjUeAUJ0dBNhFHxmGHWwwbM=;
 b=lox8j19K1I2RLIUQAKWZo4RSE0Eim5iLn/iLoRZRo6jme5BlD7Boqsu2md07tsUcmZ
 9JNPfViaalFm/vAoi8fh3JMFlkcdSRZ5OzWFNA4bynzwQ+iuUkVBvneJ7uokkfNEl3mM
 rHA336fWS4dYY2DrciTZEARLxwxrW8ewb3vF9dyMkg9S4XesxmmXSgT/zQobqvuQZxfX
 pDXM75WcCW0x+U+QYN5RWCeGr7ROoa1CX2HG1OQgf+5ywKbF8NyxGTrgenR5wYxq7Hdf
 1VYMW8U40P3AEelYxrjrIhk1qZm50GOY7iPhlsGh1p+9lHC8tTTg4WM0zmJ29Q6jQcOb
 kebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f/c7AxopKhgYq88HVbiWCjUeAUJ0dBNhFHxmGHWwwbM=;
 b=smHA88OWYcSBPN/87WAMcAU5cO1KEsQUbIyWKmU6ofYP2xhQTRBEuJ2aMHQbKjdnE6
 +w4xmC0lRGzK5CriyiXyBJB6rVLDHI2bg50eBMrf6dcZNbkjsOMgYm9i7Je5GaVRfOXz
 aIwNIitTBddrli90hyMQf+MIJRjVkMw/aCvrjHU0+Zpb+bmId3cbOXa1KlC2CcLP2Oq+
 LDIs7c4ShWNooiwjjRmIUGxxrWF/Oc/gur6tKpDjvV9h6oNe8Sqc+2bdNbNLrAbGG72G
 U2E/FIYEtoalX34gegMIWbbmOK1TvnWJyuAuRxSsFncsPqOS4FP0EWt+kKLZUv3wTnEv
 JLYw==
X-Gm-Message-State: AOAM532qb18DhOtpBdR6k9wqk65ENFoUqsnnLUiIE9nVMwZLABAzl3lc
 MmkFFxmBMxEkepQsac+qHWNp7A==
X-Google-Smtp-Source: ABdhPJwdUr95NCcg5kbIW6KVmAsIJ80h1I+klbqvOnKaiv1Vk1+0vQaSydRrGvkrmrJ8s8D4O68cOw==
X-Received: by 2002:a17:902:f702:b029:e3:5e25:85bb with SMTP id
 h2-20020a170902f702b02900e35e2585bbmr3618147plo.56.1613403602362; 
 Mon, 15 Feb 2021 07:40:02 -0800 (PST)
Received: from [192.168.1.134] ([66.219.217.173])
 by smtp.gmail.com with ESMTPSA id b25sm19162358pfp.26.2021.02.15.07.40.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 07:40:02 -0800 (PST)
To: kernel test robot <oliver.sang@intel.com>
References: <20210215132734.GA15834@xsang-OptiPlex-9020>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <8fec3d91-fd37-0159-7417-0661659e2e02@kernel.dk>
Date: Mon, 15 Feb 2021 08:40:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210215132734.GA15834@xsang-OptiPlex-9020>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [btrfs] 3d6ef82805:
 WARNING:at_fs/btrfs/extent-tree.c:#btrfs_reserve_extent[btrfs]
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
Cc: lkp@lists.01.org, linux-btrfs@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, ltp@lists.linux.it, lkp@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2/15/21 6:27 AM, kernel test robot wrote:
> 
> Greeting,
> 
> FYI, we noticed the following commit (built with gcc-9):
> 
> commit: 3d6ef82805958611e8ffa0a901c014b6f066c3e6 ("btrfs: relax memory alignment restriction for O_DIRECT")
> https://git.kernel.org/cgit/linux/kernel/git/axboe/linux-block.git dio-mem-align

This patch has been dropped, we did identify last week that btrfs
needs more work to support sub bs memory alignment for dio.

-- 
Jens Axboe


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
