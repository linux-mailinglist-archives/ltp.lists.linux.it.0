Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCE314A003
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jan 2020 09:45:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 464783C239F
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jan 2020 09:45:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id A064A3C2215
 for <ltp@lists.linux.it>; Mon, 27 Jan 2020 09:45:29 +0100 (CET)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id EAD2D601095
 for <ltp@lists.linux.it>; Mon, 27 Jan 2020 09:45:28 +0100 (CET)
Received: by mail-pj1-x1044.google.com with SMTP id f2so1852094pjq.1
 for <ltp@lists.linux.it>; Mon, 27 Jan 2020 00:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=oQWSWrYml8JtFc/f3j2BSCTzApexv/W6xrMMwjwHP0c=;
 b=hVph+8NwGfRIH/nscKJbcJbAPckIchR/pV3xStNzGEfcdj9DgNhWuK8dTjHiokBCET
 E5+NZslCjaKlU8jlX31OJrJsLmIEyS9/xUJC36G74PPiqge61vPH6naawlI14YSQbP+r
 no0dmW0DKLofFgdOX9xF1NwwR/e4gzy3sOgxq/IeNL0UkBFq6SnXdZzl2jXveeB7/9yh
 GOlF44CKG52rnlfd/Whd2eAGkfXcLZlqc7izunKoL2cMQqSCj72d/P5qourRH/w1cgpY
 qNONhDE6/8USj+0CoL8JYubHN0gwI/jdDsn6yTaS9Ve2ea74OK48xZ08dunF684bWdag
 dRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oQWSWrYml8JtFc/f3j2BSCTzApexv/W6xrMMwjwHP0c=;
 b=nwVHcFXW9HKt2oEdVLt1161hjL62hkax/NzRZaH0a7jtekXcDOs7ZUC8NvyPxTsllJ
 /MZwgiOZM5XOOW52QQHprCy93vQ0XVIcRx7LDIVCCAxB8jSarmWuKCz9E2eu0aUyQDIW
 +t+9cAw9T5HmTxr2t5SgVBnJvAjOfOHWUQuwwyU5V2DyoH81pblnzgkRFx7SX8jXkMyl
 86ANyOEEodJJc+H3jwQtYboeRHuub5hzRRdD4dvOCpwZkAU2BxlxljoqV0x47N56zrHx
 siiWO0cG4R+nl9TjzVUnkQXlBl2Y1ArqGBCGmx5yoq7hwA2egJiLDJAZ2of9dlcSLGJo
 xFQw==
X-Gm-Message-State: APjAAAUjHRlJThed0TSz8tph6deTSCydEneKvdYodPMf++ZqHP4kIRoF
 Q6vBhUBLJhc7pYxKtz0XtN+0Og==
X-Google-Smtp-Source: APXvYqz3QyF5rXFz5rrUA6ut7HdUKeTXRic//B43Bmvsiu+ziyACbQMAxGb0ux/NDcNlQBRWWZsNmQ==
X-Received: by 2002:a17:902:b68c:: with SMTP id
 c12mr16294277pls.160.1580114727297; 
 Mon, 27 Jan 2020 00:45:27 -0800 (PST)
Received: from localhost ([122.172.51.87])
 by smtp.gmail.com with ESMTPSA id s7sm15442505pjk.22.2020.01.27.00.45.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Jan 2020 00:45:26 -0800 (PST)
Date: Mon, 27 Jan 2020 14:15:24 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200127084524.xrrxivkw76zcmlsy@vireshk-i7>
References: <007f89609cfe05cc4f7f0f310f05fc4bb0be829d.1580114160.git.viresh.kumar@linaro.org>
 <169e5dfcac201330511347e38a25f373fc698c92.1580114160.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <169e5dfcac201330511347e38a25f373fc698c92.1580114160.git.viresh.kumar@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V4 2/2] syscalls/pidfd_open
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 27-01-20, 14:07, Viresh Kumar wrote:
> Add tests to check working of pidfd_open() syscall.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V3->V4:
> - Dropped duplicate headers
> - Dropped local variable "fd" and used TST_RET directly.
> - Handle failure tests with global variable
> - Remove else part after creating child process
> - Improved print messages

Cyril,

I did send this email with

--in-reply-to="8dc3dff0390db58b2f472501c30595647a913e34.1579858930.git.viresh.kumar@linaro.org"

so it appear in earlier thread. But git didn't work the way I expected
and so it shows this as a new thread now.

I created two patches (so this patch's header already had -in-reply-to
set to the 1st patch), and sent only the second with with explicit
--in-reply-to field, which in my expectations should have overridden
the setting that were their in patch's header but it didn't :(

Sorry about that. I am not re-sending it for now to avoid unnecessary
traffic.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
