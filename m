Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EF70428ED17
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Oct 2020 08:31:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B20CB3C29C1
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Oct 2020 08:31:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id DEA403C25AE
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 08:31:43 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D4F331A01469
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 08:31:42 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id n14so1390027pff.6
 for <ltp@lists.linux.it>; Wed, 14 Oct 2020 23:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=unLyiKTH/EkbVuJB3NBfpT/3LKUpTBhnwnEORQ/5hr0=;
 b=cK+HkO9w4p08cFRZVKjDccvUHV16t2KsRQsSrIc/aUCeT0yKsdauSkBmys9AB3jU7O
 uIN/8vZxH8UL6iFuysJe5Nx3x13xYtB5bG1RmmazcP64UAOsx4QBmyS/095/ay5cukhp
 m29z8018Ou7kZoF9f1/X/C8aG0lBzKpujssMQkBrxXIeJDAlA578SPG2VDUsbSC4jCZF
 DBkGyS1+jMx2/ZqxCcnBvc0ugesU6lwbNcxnQClvO7tBcHk2jr8JabRctNvH44D+96t4
 OUWBH4Ie4NCGcYh9vnKbzpU/KVuBClSK8Ydi7wHven6eD6Usu7/vjR2sZgMLgZxo3Ynf
 SwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=unLyiKTH/EkbVuJB3NBfpT/3LKUpTBhnwnEORQ/5hr0=;
 b=orHlziXH7mPFRy2c2SYiAcWNN4m+SHmzKIgFTL1ivMBUTbZlEKXZ8RQ4Uy41ByU+Cw
 6OQQTnmiq/s2CdTohphwUSm3+msGbzwaSwDB+HCJpUCI3JhHb81l09U5d62aPSQbD30r
 nKu0h62vriV13wKAKJ4S90oblKYN1Jxyepc33drvsQYCEFG/Rh/NIW45myFkvyiTyH8w
 Gh9KmoTW+725hhgfzfSZuBAR3DUf6T2vkKI4DV3zvrIVOFhKQ4k5XQLMXJs0A0+Awtl8
 +nHw5UAOGiaaQBsXWTSHlnLwAqe9AGiCAv52KiF/pLj6k6s5F1D428Cvu6n+91YvglxL
 WSEw==
X-Gm-Message-State: AOAM533RmcrlCVoqLOPuEf0t533PDrH6OzFhXb3Si/k+V00ZRmD3eoFQ
 drf8uLP3YASHDYstOmH8/b4=
X-Google-Smtp-Source: ABdhPJy1Dmz68MUB/Zc05m4DGKww5Xa4EJ/OX4HoWgEwnKYuOf0rRVacq1aZQ8FnpCkqOzwv+zUojw==
X-Received: by 2002:a63:5a0a:: with SMTP id o10mr2115126pgb.77.1602743501127; 
 Wed, 14 Oct 2020 23:31:41 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
 by smtp.gmail.com with ESMTPSA id z18sm1822440pfn.158.2020.10.14.23.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 23:31:40 -0700 (PDT)
Date: Thu, 15 Oct 2020 15:31:37 +0900
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: Petr Mladek <mladek.petr@gmail.com>
Message-ID: <20201015063137.GA3668@jagdpanzerIV.localdomain>
References: <CA+G9fYt46oC7-BKryNDaaXPJ9GztvS2cs_7GjYRjanRi4+ryCQ@mail.gmail.com>
 <20201014140514.GB17231@alley> <20201014151311.GB13775@alley>
 <20201014175051.GC13775@alley>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014175051.GC13775@alley>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] printk: ringbuffer: Wrong data pointer when
 appending small string
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 John Ogness <john.ogness@linutronix.de>, linux-mm <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 open list <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 lkft-triage@lists.linaro.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On (20/10/14 19:50), Petr Mladek wrote:
> diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
> index 2493348a1631..24a960a89aa8 100644
> --- a/kernel/printk/printk_ringbuffer.c
> +++ b/kernel/printk/printk_ringbuffer.c
> @@ -1125,7 +1125,10 @@ static char *data_realloc(struct printk_ringbuffer *rb,
>  
>  	/* If the data block does not increase, there is nothing to do. */
>  	if (head_lpos - next_lpos < DATA_SIZE(data_ring)) {
> -		blk = to_block(data_ring, blk_lpos->begin);
> +		if (wrapped)
> +			blk = to_block(data_ring, 0);
> +		else
> +			blk = to_block(data_ring, blk_lpos->begin);
>  		return &blk->data[0];
>  	}

Great catch.

Acked-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

	-ss

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
