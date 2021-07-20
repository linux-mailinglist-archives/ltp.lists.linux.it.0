Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 219703CFD79
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 17:26:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2E8E63C9804
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 17:26:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 35BCB3C2174
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 17:26:51 +0200 (CEST)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 96854600921
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 17:26:50 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id q16so36410621lfa.5
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 08:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CG8/QwPJR94mA7MNXs7RWDY0g1w/Kyy5cHa+q5+akHU=;
 b=mwwqTO+iuzbG7iRpw+RtaLcQwt0tHSg8c67Bub95fe4h1DRdZErfAGlN5UF7dWMr8e
 03OBzvdK5uKpKPLRchMB986Z1LQKTLJ+qtUpHO5BpbT6rIuxi79oF3HoVDcb7Edt776R
 En6qNUcGtH36VTraTcmDUFwXOt0woS2GNwE6aL/BVTupFyAZXK6Pgdb3OsoBfSiIkwLJ
 /N3jp2ox3YWO5IENaEl2aMdYEEMYCQ6DDT3yuViTJm8lfId98z2r+JZnbaNaCd1Gc04t
 3PzfCFoaxyHR5oStrRFWeWk1TNlMISSYtWx2ZuiJSW/7K9tj8AoZzLwB62/E71Pd4cTV
 hQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CG8/QwPJR94mA7MNXs7RWDY0g1w/Kyy5cHa+q5+akHU=;
 b=HDkUWKtwZKXLUToINeNWWMJgUqb/b4oN9IXJ19ow66yNWQ/lIpVQQWz/BWbHN29f18
 aVGgpZO7+qvglcwN2c8HncEGWXQ9u3u2Fxm1X8ZxcpeZrV7zLan7RQFTy4VLwDkOG/bO
 B38PZCL5HvS1OEwEsl+7MUra8Z0EG19hmbehfkc73JjTKdvTrsAblXvYXqDNFIF7jQDJ
 lrmfP2Xr1zE48Uua8cVx3afCwj8Jz5gwrYsbM/AkAY73rbPzHi7BdHXiQDrPX2JE/z50
 JlPvYbTYzhyzdvESQm1ntKDJOPw5NSrekVPGEz5+hmb6UwErcdwmybpbc7tBz0wzZ9Lz
 v9sA==
X-Gm-Message-State: AOAM530yDuHga371lVj+7J9/4wz+QdR5kuQxh+3jmiuRi8tERa3N4zLW
 JktuT+nkRZODtI5ZH/I5ZFEiDrbGO0Fq
X-Google-Smtp-Source: ABdhPJxF6NSxBgbU44LXW3IiTkkajkCR3/e+DI0U1oS8tSOQ0yNWqLJrsBqkLmy2SV4SX8ecfbFS9w==
X-Received: by 2002:ac2:51af:: with SMTP id f15mr22711655lfk.427.1626794809847; 
 Tue, 20 Jul 2021 08:26:49 -0700 (PDT)
Received: from [192.168.100.7] ([178.68.161.34])
 by smtp.gmail.com with ESMTPSA id t9sm1549052lfg.57.2021.07.20.08.26.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 08:26:49 -0700 (PDT)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
 <YPbNQ4AebDiUMxVz@yuki> <f9767568-466f-73d2-7d73-aa880fde6a63@bell-sw.com>
 <YPbcfEgPs66/ng7c@yuki>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <7941651c-1712-55cb-a935-277cff8b1969@bell-sw.com>
Date: Tue, 20 Jul 2021 18:26:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YPbcfEgPs66/ng7c@yuki>
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

On 20.07.2021 17:23, Cyril Hrubis wrote:
> Hi!
>> BTW, sched_rr_get_interval* tests already using tst_variants, adding
>> more variants will double them too, right?
> 
> Actually not, since we do run the test for both the libc
> sched_rr_get_interval and for all possible syscalls variants we don't
> have to touch these tests at all.

sched_rr_get_interval works with musl, the one which returns ENOSYS
is sched_setscheduler() there, in setup().

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
