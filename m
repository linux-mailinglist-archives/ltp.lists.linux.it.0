Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEB4319F71
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Feb 2021 14:09:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 273AC3C8A67
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Feb 2021 14:09:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 655803C5AE8
 for <ltp@lists.linux.it>; Fri, 12 Feb 2021 14:09:13 +0100 (CET)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1084B60078E
 for <ltp@lists.linux.it>; Fri, 12 Feb 2021 14:09:13 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id u14so900022wmq.4
 for <ltp@lists.linux.it>; Fri, 12 Feb 2021 05:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:autocrypt:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mvqhrvSXVADkNDjYtLd3/cevL37fLYQwHBNC9exxqm0=;
 b=MtejXE47NNRrjFYOnlTWd5tPGnJN7FTuyLrkT1iaD0U52p2jCxf4hKVOOPHmtl779t
 PqHUT96vv79DspNuJi9XisOMzrerJrE+sc0NDzfKNYSddusF8fKDMqi/GXYCWlBxXXaQ
 0hftlMl7QcaecnAFF8yAjVs0+ixI3ojo09q/TspvF11mBxQqWkwaMxcQ6EaVXuc6Qfje
 FaYN7j4gfCahlY5fSNfn09mT0019GMXvs/QdIYyE4gh8uFth+DVguHz5qS75FuhGljTf
 YRBJYOweOLUUHq45zKDZrwEfpwUOEzJETnorGIIU+5kLieRO89wiNtKaQgquLhf50gAg
 nq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:autocrypt:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=mvqhrvSXVADkNDjYtLd3/cevL37fLYQwHBNC9exxqm0=;
 b=TbIyEX5hnuhyWeH96D4VzZ7fiEBosOjxjneWK3Vga8QNYSH7slw7WkUS+4q6lBvPPI
 xTEFWtA/TM/Xop/MuJkhPCp33QVnJXh6Gu72b1U+3lO7VI4LHW+/cVxqukahaJgnM0qQ
 mXN2sNplYkzfILPW3TL0DKoiTiXyUYRZaB1btNlVyI5Op+K0gpq9whAxNjUIqzMaONKd
 IIzri/bsGnoX2HO4CoGD975X1/HPIudVHPtFDiYXJR2Wh327mxA//9RwnTeoGqAeaxEX
 WGoIIhev2T2rCweDyNaFmF/ocw1AqsQkJQA/OBajpNpto+nBYNkQB5ijetJbhmdd32Il
 aKDw==
X-Gm-Message-State: AOAM532mRDNcVEsPwxz8ZlTyqBtDiuJbIvI3zrVJXTv7BFwplNTuCHWN
 ppbIec2lXbD5x72CNXyBloc=
X-Google-Smtp-Source: ABdhPJz576r3IHJUARu/0VEbUdD9HsVTY2bFF97tV6jwHsyjn/1YXyint+QthcTWBDfRWj3rxcFiDQ==
X-Received: by 2002:a7b:c087:: with SMTP id r7mr2626078wmh.164.1613135352580; 
 Fri, 12 Feb 2021 05:09:12 -0800 (PST)
Received: from [192.168.8.109] ([185.69.144.228])
 by smtp.gmail.com with ESMTPSA id y16sm6133447wrw.46.2021.02.12.05.09.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 05:09:12 -0800 (PST)
To: Petr Vorel <pvorel@suse.cz>, Jens Axboe <axboe@kernel.dk>
References: <YCQvL8/DMNVLLuuf@pevik>
 <b74d54ed-85ba-df4c-c114-fe11d50a3bce@gmail.com>
 <270c474f-476a-65d2-1f5b-57d3330efb04@kernel.dk> <YCZ5ZS5Sr2tPiUvP@pevik>
From: Pavel Begunkov <asml.silence@gmail.com>
Autocrypt: addr=asml.silence@gmail.com; prefer-encrypt=mutual; keydata=
 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 bA==
Message-ID: <8e7ad2f3-eb35-71fe-5989-b5f09476eb24@gmail.com>
Date: Fri, 12 Feb 2021 13:05:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <YCZ5ZS5Sr2tPiUvP@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] CVE-2020-29373 reproducer fails on v5.11
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
Cc: Nicolai Stange <nstange@suse.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, io-uring@vger.kernel.org,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 12/02/2021 12:49, Petr Vorel wrote:
> Hi all,
> 
>> On 2/10/21 12:32 PM, Pavel Begunkov wrote:
>>> On 10/02/2021 19:08, Petr Vorel wrote:
>>>> Hi all,
> 
>>>> I found that the reproducer for CVE-2020-29373 from Nicolai Stange (source attached),
>>>> which was backported to LTP as io_uring02 by Martin Doucha [1] is failing since
>>>> 10cad2c40dcb ("io_uring: don't take fs for recvmsg/sendmsg") from v5.11-rc1.
> 
>>> Thanks for letting us know, we need to revert it
> 
>> I'll queue up a revert. Would also be nice to turn that into
>> a liburing regression test.
> 
> Jens (or others), could you please have look that the other commit 907d1df30a51
> ("io_uring: fix wqe->lock/completion_lock deadlock") from v5.11-rc6 didn't cause
> any regression? Changed behavior causing io_uring02 test [1] and the original
> reproducer [2] to fail is probably a test bug, but better double check that.

Thanks for keeping an eye on it. That's on the test because DRAIN doesn't
punt to worker threads anymore, and DRAIN is used for those prepended
requests.

Can we just use IOSQE_ASYNC instead and fallback to DRAIN for older kernels
as you mentioned? It would be much more reliable. Or replace IOSQE_IO_DRAIN
with IOSQE_IO_LINK, but there are nuances to that... 

> 
> Kind regards,
> Petr
> 
> [1] https://github.com/linux-test-project/ltp/tree/master/testcases/kernel/syscalls/io_uring/io_uring02.c
> [2] https://lore.kernel.org/io-uring/YCQvL8%2FDMNVLLuuf@pevik/
> 

-- 
Pavel Begunkov

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
