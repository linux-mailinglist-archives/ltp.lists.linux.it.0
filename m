Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D10753CFB8F
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 16:07:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 241D93C9820
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 16:07:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7AD783C626B
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 16:06:58 +0200 (CEST)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C9D9F600906
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 16:06:57 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id f30so36028282lfj.1
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 07:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PrJY8ov+MiruROdfiJtmVuTPjxSHTxDWHt0dBGhxhgE=;
 b=w8/w3nQ7sN7Q264NDiwCw7DJdq6Fh3SA4tRfTj95Hm2XTwGX9je68+l+bV0ly11c3E
 RVFm9CWiE5D827UaIEiZVNL7qOpB6+tuS/8QNZG5IVNeGdCTPOVK1udcG05eLWrTAMrV
 /P0/Vr73nv4Y9Jgt6CnoiYN4oNsOl10J4MDRZ7hk5+FgvGiOykpDt1CcBT+d534Tv89T
 JZUuwlGjbpabuUB1G1NZXxXSJEsHiVypj9nJ4tJfQq4XZ2SQ8vmcMQTgYYO7cshWGwlF
 nny14H4RfEn5p7T9379Xqq1G7UkuMPcfu5Uoo+/rA0FodmBoHvUKe6mVNxm4L3ozJI+M
 aGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PrJY8ov+MiruROdfiJtmVuTPjxSHTxDWHt0dBGhxhgE=;
 b=cWux9pwShuReTRo14M7wc9GHzh4v08KnF7zg/3dfn5QN8UCgSRQnvThvkJ0Q1XNzEz
 ib7u57tY4RBuedrA74KfgMAxcb7De0EXOikBPBy9Hn0IskOvpjNWWjOJsm2J8ghbax0A
 8NLFwEdyZnhjEDxXGy+WYLUFyUykypAKbFNZuTQUf2G1+ILneLLODDYPAkkUvBM/VM7z
 G6Wvto5i9q0HyLwM1/d0dggUyS0O2CdNUK8TiNAJkLaz0n/BBC7bmN/A0zInWQmZzQiQ
 PI3d6nwh40FEZ3p0YVfj2iSsTarMyTR/KazMiLzgNitH3UvbeeeZAWb9Gjr+iGXcUvjZ
 4V+w==
X-Gm-Message-State: AOAM533AYbNld7hEMt38LZWUJu0jcU0wmApzcIcVMT0MJyErxHOf1sX+
 H+hZcnVqT8TVwR8yFxxyGEO4TYCpa4dL
X-Google-Smtp-Source: ABdhPJw49os2TmFIyFiokizb1BkK9lsh/TT3CJxrUYhpYHMkvWdB37UFs4h90HoCadb8Zfh/Je8P5Q==
X-Received: by 2002:a05:6512:3b89:: with SMTP id
 g9mr2552063lfv.96.1626790016951; 
 Tue, 20 Jul 2021 07:06:56 -0700 (PDT)
Received: from [192.168.100.7] ([178.68.161.34])
 by smtp.gmail.com with ESMTPSA id d23sm2454106ljl.115.2021.07.20.07.06.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 07:06:56 -0700 (PDT)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
 <YPbNQ4AebDiUMxVz@yuki>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <f9767568-466f-73d2-7d73-aa880fde6a63@bell-sw.com>
Date: Tue, 20 Jul 2021 17:06:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YPbNQ4AebDiUMxVz@yuki>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 00/16] syscalls/sched_*: convert to new API and
 handle ENOSYS errno
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

Hi Cyril,
On 20.07.2021 16:18, Cyril Hrubis wrote:
> Hi!
>> The patch-set introduced new tst_sched_* wrappers to handle ENOSYS
>> error that can be returned by libc (musl [1]). In that particular
>> case the wrapper uses syscall directly to test the kernel anyway.
> 
> Can't we use the test_variants to test both the kernel and libc calls
> instead?

With glibc it seems it would be just a redundant work to call both
variants, wouldn't it?

BTW, sched_rr_get_interval* tests already using tst_variants, adding
more variants will double them too, right?

> 
>> [1]: https://git.musl-libc.org/cgit/musl/commit/?id=1e21e78bf7a5
>>
>> Alexey Kodanev (16):
>>   lib/tst_sched: add ltp tst_sched_*()
>>   syscalls/sched_getparam01: use tst_sched_*()
>>   syscalls/sched_getparam03: use tst_sched_*()
>>   syscalls/sched_setparam01: convert to new API
>>   syscalls/sched_setparam02: convert to new API
>>   syscalls/sched_setparam03: convert to new API
>>   syscalls/sched_setparam04: convert to new API
>>   syscalls/sched_setparam05: convert to new API
>>   syscalls/sched_rr_get_interval01: use tst_sched_*()
>>   syscalls/sched_rr_get_interval02: use tst_sched_*()
>>   syscalls/sched_rr_get_interval03: use tst_sched_*()
>>   syscalls/sched_setscheduler01: convert to new API
>>   syscalls/sched_setscheduler02: convert to new API
>>   syscalls/sched_setscheduler03: use tst_sched_*()
>>   syscalls/sched_getscheduler01: convert to new API
>>   syscalls/sched_getscheduler02: convert to new API
>>
>>  include/tst_sched.h                           |  16 ++
>>  lib/tst_sched.c                               |  36 +++
>>  .../sched_getparam/sched_getparam01.c         |   6 +-
>>  .../sched_getparam/sched_getparam03.c         |   4 +-
>>  .../sched_getscheduler/sched_getscheduler01.c | 141 +++---------
>>  .../sched_getscheduler/sched_getscheduler02.c | 104 ++-------
>>  .../sched_rr_get_interval01.c                 |   4 +-
>>  .../sched_rr_get_interval02.c                 |   4 +-
>>  .../sched_rr_get_interval03.c                 |   4 +-
>>  .../sched_setparam/sched_setparam01.c         | 135 ++---------
>>  .../sched_setparam/sched_setparam02.c         | 195 +++-------------
>>  .../sched_setparam/sched_setparam03.c         | 215 ++++--------------
>>  .../sched_setparam/sched_setparam04.c         | 161 +++----------
>>  .../sched_setparam/sched_setparam05.c         | 186 +++------------
>>  .../sched_setscheduler/sched_setscheduler01.c | 171 ++++----------
>>  .../sched_setscheduler/sched_setscheduler02.c | 154 +++----------
>>  .../sched_setscheduler/sched_setscheduler03.c |  10 +-
>>  17 files changed, 345 insertions(+), 1201 deletions(-)
>>  create mode 100644 include/tst_sched.h
>>  create mode 100644 lib/tst_sched.c
>>
>> -- 
>> 2.25.1
>>
>>
>> -- 
>> Mailing list info: https://lists.linux.it/listinfo/ltp
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
