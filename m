Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F8962F39
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jul 2019 06:14:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 846183C1C68
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jul 2019 06:14:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 393DE3C02AB
 for <ltp@lists.linux.it>; Tue,  9 Jul 2019 06:14:48 +0200 (CEST)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 527081A01103
 for <ltp@lists.linux.it>; Tue,  9 Jul 2019 06:14:47 +0200 (CEST)
Received: by mail-pg1-x544.google.com with SMTP id p10so8750552pgn.1
 for <ltp@lists.linux.it>; Mon, 08 Jul 2019 21:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iruiqDdU8RxzyfzLYi+mfwr4FAM1VEmJi0DTx5iv78U=;
 b=mZBjdU9FyFOqTkAkLfeg5jXIGgV+6i2yrs+8r4njK+lLRCXSo/fdWntPYBFy82SI/8
 Tzfdh7Xhm2dTjLtit3mL9Q5cAGXa85PUj97AWy4SUbR8zMEnkeGBCadRTI6bMhTrWMKn
 MIr2Eq16YAsIXsG6cMW3m1hFD8bLJy3CakTsf3EBC0LR4NAvGjZU8VYVQgGBYsboH/7F
 suKWx+XDvOFsqicOMhpEKWMmwYje7IxPC2pH1XCypHYb8oCfjqRbktVOTWlec8Kdue02
 BDaReTymMTEHt+KK/t1vaYoEplaxLRCPoLCjqQdtgKYHTxGlqFjf1CODgGF0Ji6j6bp6
 85eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iruiqDdU8RxzyfzLYi+mfwr4FAM1VEmJi0DTx5iv78U=;
 b=gNf7UpmLj5HBvRE149qnV5cN3ENnWTbpaBV7u8pTVuLGpNMKOXDaURYsxSz68+spsv
 zL4ix6Xyof5frDX+/OYG5nKPrvmzNj0yUlmk4kYgieY+e3sGNKPerKBmgyj7OfMqFfQ1
 7odw+Hw/mQtFLFkuBAEii02orrGfFNXFxmPo1c5IR/LxlT2e1aTJH0F09mez2E8Sy/4q
 ZBfgYPRYm36Uz31af8wCfNdtNphJm7g0zrXGQSQt7fRbuBzzEIq+wZ+UYvF5NZoUq0+S
 Gq53vpjGPJcE2MRqVnUROFA57+TwHZHxBezU9TVDTiXIa8fczJMBR4dKCqRnVvo57OJ0
 HS8g==
X-Gm-Message-State: APjAAAWOem2FqbIRAbavLt49jUr88lMYLGvNyqBtpy7K59256bg9YOEO
 nsl0R87+7sUldYUdfd9zuBBX8A==
X-Google-Smtp-Source: APXvYqwcVn4u7KCcgDixi+5brtfvJ94n8+JA/jScmAqnTewb+zC781FiG/AR0P03ua7MYc9mVS1D9g==
X-Received: by 2002:a17:90a:2041:: with SMTP id
 n59mr29142979pjc.6.1562645685396; 
 Mon, 08 Jul 2019 21:14:45 -0700 (PDT)
Received: from localhost ([2620:0:1000:1601:3fed:2d30:9d40:70a3])
 by smtp.gmail.com with ESMTPSA id a3sm20577451pfi.63.2019.07.08.21.14.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 21:14:44 -0700 (PDT)
Date: Mon, 8 Jul 2019 21:14:44 -0700
From: Sandeep Patil <sspatil@android.com>
To: Yixin Zhang <yixin.zhang@intel.com>
Message-ID: <20190709041444.GA102801@google.com>
References: <20190709021545.23772-1-yixin.zhang@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190709021545.23772-1-yixin.zhang@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH ltp] syscalls/stat: add stat02{,
 _64} into .gitignore
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

On Tue, Jul 09, 2019 at 10:15:45AM +0800, Yixin Zhang wrote:
> Signed-off-by: Yixin Zhang <yixin.zhang@intel.com>
> ---
>  testcases/kernel/syscalls/stat/.gitignore | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/testcases/kernel/syscalls/stat/.gitignore b/testcases/kernel/syscalls/stat/.gitignore
> index 4a8f61858..fa0a4ce9f 100644
> --- a/testcases/kernel/syscalls/stat/.gitignore
> +++ b/testcases/kernel/syscalls/stat/.gitignore
> @@ -1,4 +1,6 @@
>  /stat01
>  /stat01_64
> +/stat02
> +/stat02_64
>  /stat03
>  /stat03_64

I probably should have done this when stat02 was added.
Thanks for fixing.

Acked-by: Sandeep Patil <sspatil@android.com>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
