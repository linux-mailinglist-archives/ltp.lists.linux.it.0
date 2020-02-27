Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F3B1711E3
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 09:03:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6A6143C2530
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 09:03:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id C3C813C1F2A
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 09:03:44 +0100 (CET)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D79B92015E6
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 09:03:43 +0100 (CET)
Received: by mail-pl1-x642.google.com with SMTP id j7so822958plt.1
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 00:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PlcnLqjbMp+xgeAPYQjNqC2tACMSTNNHVa1fmsk1cPE=;
 b=MinJAnTuq8karJICbVWBzFSJhamiWDzUzxaSc1uPX6LGlAtcss5XdC0NCmrpU2rFAV
 UUoS6JGK4BmBZDZe99jkLSxXsxkHwKNWfGjxUuCae95iF3tKCoxSEBiS1nhXNi8+VcjI
 BT/70DnLuIVWo04MsL60imE8QjIr2zhu0MuOClD6a357fyYblU8FIhFmADlOc47Y5yxc
 XBuTaM79StxfdoaKQFQKubX5kGfHhYoJkFGxwkQfeu1rMbzDk3E3ds4fjWePvUx4o5/n
 YCf5MbqKqkMhAp6IPRF9OTqkM0JbY/0qTaUCDeSJl7b+/sr0YGXVjx57TEzEcab0x9TY
 Qt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PlcnLqjbMp+xgeAPYQjNqC2tACMSTNNHVa1fmsk1cPE=;
 b=R6U+sSrWjDm+OaX2f45deUbfJejLaS49fr73WQCm6BaPOHJTzCaujQBsn1MjXcvGzD
 CarWPk8C36lj3Ks2fFi72LBgTNd6MmzZrT1GNaHvGFB4VKHlag9YBJcXIjvAFceBYJdD
 SejEWGsHVb2JtEn2pu4Xo0ctekx1nLBNcWswlMMRX+/fvFSW9ab0DXOFW/UokT+Rpij+
 4Yft1vQocqarU9PasQwNHbSJY1P+yqkD2BPhxBuEqTbE6B3uk5iDMM5s9W/8DA6LltE0
 yYNHb03AQ83B8uWTxFUYNEsREQ8O92kejBwzkR+vGAxJMXZf3a2zL5+ZgbAhRPeVdwv0
 LaFA==
X-Gm-Message-State: APjAAAV7SAZfM56jGP7yyPJHbheXvqzqBlOSZnjWRylwYamzbW5OvLFh
 75HGGaomBWTQo1OdQdzU9PO2Y3/liU8=
X-Google-Smtp-Source: APXvYqxB8PTikdUxFnnZpV56eIaY6H+9BLngxCDsgxlUngWqzJ2JehXmSeYc53w78l+JRueW/7VOPw==
X-Received: by 2002:a17:902:c209:: with SMTP id 9mr970027pll.311.1582790622240; 
 Thu, 27 Feb 2020 00:03:42 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id 129sm1585448pgf.10.2020.02.27.00.03.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Feb 2020 00:03:41 -0800 (PST)
Date: Thu, 27 Feb 2020 13:33:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200227080339.lo27tae6feizlf6z@vireshk-i7>
References: <20200226232649.8736-1-pvorel@suse.cz>
 <20200227032524.yldx3diebom3wqod@vireshk-i7>
 <20200227064442.GB7096@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227064442.GB7096@dell5510>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] lap/syscalls: Update syscall numbers
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

On 27-02-20, 07:44, Petr Vorel wrote:
> Hi Viresh,
> 
> > > to sync with the kernel v5.6-rc3.
> 
> > This doesn't look right, you missed some text here ?
> I dared to change this
> 
> Get Syscall numbers in sync with latest Linux kernel source
> 
>     This gets the Syscall numbers in sync with latest kernel source.
> 
> to this:
> lap/syscalls: Update syscall numbers
> 
>     to sync with the kernel v5.6-rc3.

Ah, so subject and body must be read together, I missed that :)

> => typo: s/lap/lapi/
> Hope you don't mind.

Surely not.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
