Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 713CA3BE975
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 16:12:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D63D23C89DB
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 16:12:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 992E73C54D7
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 16:12:20 +0200 (CEST)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8A1B014010F2
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 16:12:19 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id q184so2360792ljq.0
 for <ltp@lists.linux.it>; Wed, 07 Jul 2021 07:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ENM0knTdNz3FThJ8NgrGqAuKWIUvQ4vEC9P5VQWEpUQ=;
 b=HcHTLmi6W632OGf4HXiCzsHdaPOInJ5hUxg20l6q2H/k8eyJswq2b/k6LjkDeawex3
 +yfF3fK/OwcxDIEy8B396xEWkFF4hQlS/F6XExrSWrE14obrVr5+g5PVHj9u67rKmxfB
 uTnXnAf2eBVgxa+PYo9oFjEjDqiCh+LrkP5Qt1ybbyPHtW7ZDNlGiAhad110Y50OpF17
 VJGbRrUhWpiP3DK3cC7oMGUwiL7cLrYQlFhgrJycJeMHB6EienQVXpCNl7s/Q2tdmRv5
 8w981ooPfMns5v27qWX74QnvvjslBkosISw1R9wOdpxb6lcSka3p2zF6rgLESy2/IOw5
 SFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ENM0knTdNz3FThJ8NgrGqAuKWIUvQ4vEC9P5VQWEpUQ=;
 b=cD4XOdcpJkF89ONBHqCycX9Kin2V9caYXVtz8vq7N95w0NMMiwla8ttO3ROyjJs4QE
 KTN8PwKoqLxFA1vhFLBKbu3IaR76kSWZyNC+5yTfrQ6J3Xu6alRyus1cfVaP7kg1/3nL
 Xs9uxA1lUoWAmE19q+yUrd4O3KaybelCe6C3NNaUZ4WJb4cyp6hNmrtSKN34YShi/0Lm
 LjVlyf5VAzhJKCY4txrcm7nDDP29LjQthYezrzTeLRXT4EZzTxmbN3AcpkTJnhaYbv9J
 ZKb7qeh4Gl57IR2SQL4381bMtaei54hlmPzp2bnqXtshhHxkun9nNTZKrqThxpKgXLH1
 +57w==
X-Gm-Message-State: AOAM532opPkuxwwx0pOsM7p+PtM9L8/GFWRi4q85IrBc3YzBI69H/3A0
 zjaZybitjMyVAt5SU5Qm5mje
X-Google-Smtp-Source: ABdhPJzBvY2ZTMcJh45EHNBsJvWtOSWOIP2+r7CtemVl1YCguqsbZcLV6yPOl2E8DPlyCGLArQ+w/Q==
X-Received: by 2002:a2e:86c4:: with SMTP id n4mr6629557ljj.315.1625667138939; 
 Wed, 07 Jul 2021 07:12:18 -0700 (PDT)
Received: from [192.168.1.53] ([91.247.148.5])
 by smtp.gmail.com with ESMTPSA id w25sm1333216lfq.306.2021.07.07.07.12.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 07:12:18 -0700 (PDT)
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>,
 Li Wang <liwang@redhat.com>
References: <20210706105758.43220-1-aleksei.kodanev@bell-sw.com>
 <CAEemH2cOm+1BMWE7oWVFttXNOeQsYk9veXePS+ctxAABk2rCWQ@mail.gmail.com>
 <c2c7ff46-df28-c7b6-49dd-c891d9655d00@bell-sw.com>
 <381b8420-3dba-d7c1-027c-e2e2adc719de@bell-sw.com>
 <CAEemH2fcubrbMpeoeSJJoZtD+xaiRrs_upG_+KQXB_8C9m3eQg@mail.gmail.com>
 <60E50AB4.7050404@fujitsu.com>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <7c3f8681-b5c2-950a-34cb-c3d75344ff8e@bell-sw.com>
Date: Wed, 7 Jul 2021 17:12:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <60E50AB4.7050404@fujitsu.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] shmget03: fix test when some shm segments already
 exist
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
Cc: LTP List <ltp@lists.linux.it>, Huanian Li <huanli@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 07.07.2021 04:59, xuyang2018.jy@fujitsu.com wrote:
> Hi Li, Alexey
>> Alexey Kodanev <aleksei.kodanev@bell-sw.com
>> <mailto:aleksei.kodanev@bell-sw.com>> wrote:
>>
>>
>>     It's also possible that some resources will be freed during
>>     the tests... perhaps, moving the loop to verify_*() is the
>>     better option?
>>
>>
>> Yes, good point, that would be more precise for ENOSPC testing.
> AFAIK, ltp doesn't support parallel test now. I think parallel test 
> maybe a future plan that is why we use docparase to collect each case's 
> used resources(so we can convert many groups, like pid, memory, disk 
> space..., then we can run pid group and memory groups test case parallelly).
> 
> This is my understanding. If wrong, please correct me.

The problem is that these shared resources might be acquired/released
not only by ltp tests. And changing limits in proc is not the same...

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
