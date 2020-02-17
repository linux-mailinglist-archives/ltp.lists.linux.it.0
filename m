Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95815160C5D
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 09:08:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2E2333C23CB
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 09:08:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 49C833C0430
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 09:08:43 +0100 (CET)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A2F77601073
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 09:08:42 +0100 (CET)
Received: by mail-pf1-x443.google.com with SMTP id 84so8407486pfy.6
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 00:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jCJjZtUv7RCfcjn4lcHqVi5rUmFu9d6iNS8lKtgJF9w=;
 b=gZDuwdk4QWPi3mPjWtBuZJbzmuuQPwccgb+jMaubT/UtRjkG6I32hhoXuJqeVfYJ9/
 n1v1jLyo3gNoeGc44lza16fnhEdXRzrou3JOzu8o2FHbqWj2Q8OeqLQgejun22PpeBbB
 tOMBjD5P+lqepvL0/6sWdbVVB//Iz5CHHIuxzdUDOUSHbslXdxQW++o5IY/R4sCRRS6I
 5pIcHEvsFnrTP79IN+cMcxckpQQswIJenXppr68RU3qZqWCJcBL3gZmE4qqe/gorKUEE
 qAqe36CN3WZKd5dlCHXAtucJ3Ad4TS85B0i+M4OksrdCgPoHBiM3XEz4ZafFhUfe77cP
 Yokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jCJjZtUv7RCfcjn4lcHqVi5rUmFu9d6iNS8lKtgJF9w=;
 b=uDeRMwIgyTCdUF68wxXAIt7JC9BBo/8u3L1GVYii39I5w4pR39xlFAVaWL3MHJ7wMt
 nK5lyfLd2HDRLB8fiLUYsRXFs4CpacAgfoS78E/UgBLKRPVF1t60I67dB4PZmyqGRfCw
 CGRBicRKnpd0VrCtnF85irNmgbBJKFwyeS5Sap8zz20vLrQ0bah74INacins3ZYNmO6I
 1tSeYE2Z6D/z/5KSAigKZQSVauEnQgoj5x5619KS5JTYjx9P9ymzQ9dSSkbRUz0h+mcA
 X7YzJvUZWwyBsQmiEWrAb9RF+rdhVPoFchy5nwBC0tVeWvZ5r4dAOWmw6DrQFDfFCXZL
 kaEA==
X-Gm-Message-State: APjAAAVAoiqDcYfyYMBOb0GKKbDCJ3ac5dchSM1pczaREy7RmsyaVsGj
 nNNz9DAJ2iT+Pm33SRpck+9uSw==
X-Google-Smtp-Source: APXvYqzyXmU9YZurgoxu/7y9mmjW26MAt+eWA1KMhRffJRtgNQ80tvDm8CceS17aZ9yF0c7f3ZklHQ==
X-Received: by 2002:a62:1dd7:: with SMTP id
 d206mr15635644pfd.148.1581926921139; 
 Mon, 17 Feb 2020 00:08:41 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id a195sm15586210pfa.120.2020.02.17.00.08.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Feb 2020 00:08:40 -0800 (PST)
Date: Mon, 17 Feb 2020 13:38:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200217080838.btmgydxdgv4tu66c@vireshk-i7>
References: <cover.1581680021.git.viresh.kumar@linaro.org>
 <98f8a5780f679b90f53fdded8b1b8821d7eb1ce9.1581680021.git.viresh.kumar@linaro.org>
 <CAEemH2eju4-Gv8P_H8teuo3qDYbFmfKL6EZbWQfw6xLHqWa5Xg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2eju4-Gv8P_H8teuo3qDYbFmfKL6EZbWQfw6xLHqWa5Xg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/7] lapi/fsmount: Add definitions for fsmount
 related syscalls
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 16-02-20, 17:09, Li Wang wrote:
> Hi Viresh,
> 
> Thank you for creating new tests for LTP.
> 
> Unfortunately, this 1/7 patch has overlap with zlang@'s patch[1]. It
> probably can not be merged if the patch[1] applies first. But the remaining
> part is valuable to LTP, you can drop some of this and rebase your code to
> make use of the header file again.

Thanks for pointing that out Li. I will rebase over zlang's patch once it gets
merged.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
