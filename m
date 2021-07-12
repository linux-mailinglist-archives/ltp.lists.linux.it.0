Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C70D3C461C
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 10:46:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D4BDF3C6741
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 10:46:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3A9E73C1DD9
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 10:46:48 +0200 (CEST)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A141B1400964
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 10:46:47 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id n14so41827718lfu.8
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 01:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nUt3GmMA2XzWNihj81aiPG8XSyq1mwfwPznKcnVAANY=;
 b=YeLHliYGObkiLkcOo240M4VodTFl47Xn7HH/vkEjoT6whRoabRdLtiuiAGyiqQTwHZ
 Wm0lIlAF5surih9do//gMskWQ5c4huPhkNDeBFGLtC0YX1h0PByhSU6vETy/o3T7fkwi
 7lrZHYNROQXh5BwK1vHzOJbbxRZSD5ayWQ/SX85cxn0RgjBhxV4nnDKq6X6BcZ6bVAwo
 V5dWsoHfOXqDo7KtLFz0xp17BEbyvnnOj3A/zZraoIbLSsGsoKGho5Tyr6C/kG1HnlDy
 EPj5Nyg78QA8DKWKZPwfG1VCNQWhsp5+jAs955EWos2GHHT/5GwhrvIz4saXeLpNF8SA
 5x1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nUt3GmMA2XzWNihj81aiPG8XSyq1mwfwPznKcnVAANY=;
 b=Sszb/lWN0YO/mTXL6YXDr+o8vDA1YRIj9ugiBMc2BL4dv6oJDeJ3QTtlMuOah5L+Di
 BORhWRpXpPaXrDMUjqHGY1u0HDWg79W3UgUAaRFZzvgW/8LlRtf+AMsgkw72N64dilZ+
 vRCF7LX9ZxW3wuYmPk1eAA8cFkMzH79JakmOSSZKDqreI0pZjQ6v4L76iv2rBFLk12DE
 azZZEjwWzo5RZUVpyR+THsPfevG7fB4Q+q/Z5AZxL1+5Gws0G4EEPpwESnBsOYd8ybJ1
 j3OhkjY58DmlYtaVwukRoNLbeQBiimbvhnIJcc/qcfYpbH3VYjUipbrz1Y1ShnbyQo0B
 qUmQ==
X-Gm-Message-State: AOAM532Z0wYV43IwLVlanl8jh6h483bGIxMoiUNWWq7amZaj/UUvThe7
 8VmN9W01fZDQNEdIq8IR23NFgYGmavOg
X-Google-Smtp-Source: ABdhPJzYEAIBTwy5uf+lJMqc5ffcXcXmuJbflOyOOc2fIoz6LmU9qeNwHa+LB3roJogMw5XnZx95Dg==
X-Received: by 2002:a19:8588:: with SMTP id
 h130mr39890169lfd.501.1626079606551; 
 Mon, 12 Jul 2021 01:46:46 -0700 (PDT)
Received: from [192.168.1.53] ([91.247.148.7])
 by smtp.gmail.com with ESMTPSA id i8sm1147408lfu.82.2021.07.12.01.46.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 01:46:46 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>
References: <20210706105758.43220-1-aleksei.kodanev@bell-sw.com>
 <CAEemH2cOm+1BMWE7oWVFttXNOeQsYk9veXePS+ctxAABk2rCWQ@mail.gmail.com>
 <c2c7ff46-df28-c7b6-49dd-c891d9655d00@bell-sw.com>
 <381b8420-3dba-d7c1-027c-e2e2adc719de@bell-sw.com>
 <CAEemH2fcubrbMpeoeSJJoZtD+xaiRrs_upG_+KQXB_8C9m3eQg@mail.gmail.com>
 <60E50AB4.7050404@fujitsu.com> <YObbKCNKUoC7lSxd@pevik>
 <YObpRzTjx8T2GAZn@yuki> <60EBA9C3.4050103@fujitsu.com>
 <c81eee80-6cea-de14-aeff-8919495c4396@bell-sw.com> <YOwASqNKNXBl4lqe@pevik>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <0b622e21-453c-5dc2-214e-c9c0a5d48f44@bell-sw.com>
Date: Mon, 12 Jul 2021 11:46:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YOwASqNKNXBl4lqe@pevik>
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
Cc: Huanian Li <huanli@redhat.com>, Richard Palethorpe <rpalethorpe@suse.com>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 12.07.2021 11:41, Petr Vorel wrote:
>> On 12.07.2021 05:31, xuyang2018.jy@fujitsu.com wrote:
>>> Hi All
>>>> Hi!
>>>>>>> Yes, good point, that would be more precise for ENOSPC testing.
>>>>>> AFAIK, ltp doesn't support parallel test now. I think parallel test
>>>>>> maybe a future plan that is why we use docparase to collect each case's
>>>>>> used resources(so we can convert many groups, like pid, memory, disk
>>>>>> space..., then we can run pid group and memory groups test case parallelly).
>>>>> Yes, parallel support is not supported atm. Richie and Cyril has done some work
>>>>> on runltp-ng to support it. Yes, first it's needed to add support in resources
>>>>> (docparse), see Cyril's old block post [1].
> 
>>>> Besides most of the SHM tests will crash and burn if executed in
>>>> parallel. The SysV IPC shares a global namespace and because of that we
>>>> can't really write tests without assuming that we are the only one
>>>> manipulating them when the test is executed.
>>> I guess we should reach a consensus that how to fix this problem
>>> 1)use for loop to trigger this error
>>> 2)use CLONE_NEWIPC to trigger this error
> 
>> Perhaps it can be done at the higher level, e.g. in the ltp tests
>> runner if some tests request it with a newipc flag...
> Well, we have at least two runners (runltp which uses ltp-pan, runltp-ng) and we
> also support running tests without runner, it'd be nice to solve this in LTP
> API.

I didn't mean these runners, I was thinking about fork_testrun() in tst_test.c.

> 
> Kind regards,
> Petr
> 
>>> 3)Or we are the only one that use shm and we can add a api to count the 
>>> existed_cnt
> 
>>> ps: I don't want to leave this problem too long time.
> 
>>> Best Regards
>>> Yang Xu
> 
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
