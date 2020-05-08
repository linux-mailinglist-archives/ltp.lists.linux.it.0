Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0651CA4B9
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 09:03:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 587ED3C25E7
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 09:03:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 59C743C250C
 for <ltp@lists.linux.it>; Fri,  8 May 2020 09:03:34 +0200 (CEST)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 18B171A01529
 for <ltp@lists.linux.it>; Fri,  8 May 2020 09:03:34 +0200 (CEST)
Received: by mail-pl1-x644.google.com with SMTP id t16so328670plo.7
 for <ltp@lists.linux.it>; Fri, 08 May 2020 00:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2WCUFzYgtZmiTSm/ut+mNGjBPaOAz9rexkJj3FXf8SE=;
 b=XG0/t37FUs0lhNH5Alqbf3ngm8EDH7Vjf/PaXVrsLMsAyIaCD9YUS44Pqc3evKAe0k
 n3Iydeyn1Kyy2JvT3l7LXiVqeXIKyobcYWqHcJcAw1XNrDOi9nnqgaY6Y3jEz+usNMOB
 14PZ3/Sx8i4GQtoHkFatuASj95lhNySTuOIlOZcV/i/o7abZvTRyiicaVWf7QVJBoKK6
 ScosOGkkyUyJLaRQnCUuOczIKxYQs8V/gxulaGd5zjVC0M4w5eEewahMcN9NB2dlTOnO
 NpZyzWR/S4+j86X9kKVR9TJB+qKOmovpbplygfDk2mZGpFLCCzWZ4+X4F4ow8G+e5zVW
 txkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2WCUFzYgtZmiTSm/ut+mNGjBPaOAz9rexkJj3FXf8SE=;
 b=a9XlRMI0hVBtcQnTEBz+edn5qYI4Z7NM/xB8yZyRm4vPYk7u345xQIyaSHOQHzt3tC
 iswoWgOeMjY47ffgTNn0u/HAqaambG7Xnp64MuOXdYsclXBQtc72q+aAfC9DFm9K74AP
 tuiVP0NW7qxsLrN1JrWSYSgIxt5IILAG12vABQMvF7EVyKmtqpglf5A39IMHca46ZsV7
 0YQO6Ing+m4eXKXSabi3bKgsrDkN2tjJWDQPVfuhSNG/gSm/qehfvaaqc/7jsHEJCIzl
 dzSIwZ53P9yufvJTNrGe811SDg4yRjEZ/nwzp+xE9jj8DcckqjSeLVn19exYQ6nGt8IZ
 66sw==
X-Gm-Message-State: AGi0PuaV1XQQe5MYOHYULBW9yDn2b3gCFe3Cf8ivJ2hI9DFP1ChPAePO
 CAPSkWxSK1R40ztVI6ZEgf1opA==
X-Google-Smtp-Source: APiQypLUcccmOYnoXXCq1hG/NvzqFtFNSwtKdDgyuY+W77BIELaettNGO8YRr0cK7Tjf63pR3Mhicg==
X-Received: by 2002:a17:90a:5287:: with SMTP id
 w7mr4616173pjh.66.1588921412288; 
 Fri, 08 May 2020 00:03:32 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id s9sm791575pfc.179.2020.05.08.00.03.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 May 2020 00:03:31 -0700 (PDT)
Date: Fri, 8 May 2020 12:33:29 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200508070329.bz6pfndas6wks666@vireshk-i7>
References: <7e037dacaeb0c7f3bfd73cd11d80f3e1567dc052.1588669892.git.viresh.kumar@linaro.org>
 <379f4d58e86b5249f56ff58e1907dee69d67e451.1588669892.git.viresh.kumar@linaro.org>
 <20200507145258.GA16940@dell5510>
 <20200508033034.cyem2olxb7kpvu4s@vireshk-i7>
 <20200508042455.xmf57rcdhtmxqeec@vireshk-i7>
 <20200508065519.GA2556@x230>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200508065519.GA2556@x230>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/8] syscalls/futex: Add support for time64 tests
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
Cc: arnd@arndb.de, Vincent Guittot <vincent.guittot@linaro.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 08-05-20, 08:55, Petr Vorel wrote:
> It might not make it to this release (freeze should be from Monday and probably
> nobody from reviewers work on the weekend + there is a bank holiday today for
> some countries).

That should be fine. I just wanted to post everything I had planned
for LTP :)

I may not have any more significant patches after this. :)

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
