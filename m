Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 623A36C075
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2019 19:34:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BED093C1D3C
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2019 19:34:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 7243F3C1D0C
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 19:34:55 +0200 (CEST)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id ABB1210005EC
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 19:34:49 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id w20so26746668edd.2
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 10:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TeVLnGDBXVZE6LrtLnSelUz+bStmaR7KA28G9M9VkeY=;
 b=G6/VRm7AP5bAw0LDtv6VVEb0H6eWr5BREph7EbfWDZcM05rgvtKqETgIvmrnrfbYXV
 5JpZzRf60PiFIFDq6Kl19ioqzRUiyg6xxzKsqgz7XrLBE5OnmtMtFEjmp65v7IYc1JBM
 rKJZAYfcAELG6k1HR7Ih20jNGembZAX+DsD5r3krAoY9ldCHx4aIk9F7EYMgjWund0nH
 if7zFhD46yIM/faLTdLIHCB/UGwNeFj6Aadf3wt5P33GPcjrO6fA3krUBpE5cPDGz6eo
 I7JxPxApgNLyci91ehN8jQMQ5AIH8+LFfatI99r2o1gTp2SnJk6QdO5EYIWwoKz9Pycu
 Bd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=TeVLnGDBXVZE6LrtLnSelUz+bStmaR7KA28G9M9VkeY=;
 b=ZNBnXp2ZqE2lDi2OFOY4Dzwc2vdRkmByf5+MXiCrSo5YpSONZ0FHSm2+RomaUhFa6N
 f9QY4FYQrDmYRuiRVLlJOGWvibodSo+HPhe0D8r4HE+Mnp1ZxJb//v+SH/6uEwDRQg+D
 omIqaJixXQAlMMvV4xIiL9e87n19q4dDmLSEqX4LszuzFYiQwPuTcUhwUGwfSAuo2VwN
 gO2UXaqyQAefJCwulNhWiSV0W8n5Ob8n1yOCZOAVTeNaDx8VE6flmyItJciqBDDRO7T9
 T1d870aBrMKfyN39fHhvLP/4u0xDGGbRNgeR0tt6YRIqAj0eiB7wEZAbt9fHevSEzYyH
 4OlA==
X-Gm-Message-State: APjAAAXJU40zUVOpg7Q5xwU0ILxedcJy77dkh7Z0CNcuiATe9/kKlgkt
 Ceccc6mvU1MQIZQKUSItGmxGasI0
X-Google-Smtp-Source: APXvYqwb3/PDxY7nmYJSKNyDH1/9L6yqrTR5u6ozwMxxqVdrLpU0GLexYNmTniNVUq/keYahQhH+4w==
X-Received: by 2002:a05:6402:782:: with SMTP id
 d2mr36528303edy.80.1563384894154; 
 Wed, 17 Jul 2019 10:34:54 -0700 (PDT)
Received: from dell5510 ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id w13sm5117832eji.22.2019.07.17.10.34.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 17 Jul 2019 10:34:53 -0700 (PDT)
Date: Wed, 17 Jul 2019 19:34:57 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Message-ID: <20190717173456.GA5272@dell5510>
References: <20190617213138.15896-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617213138.15896-1-petr.vorel@gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] syscalls/ustat: Use __kernel_daddr_t instead
 of daddr_t
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> This fixes build for musl, which does not have <sys/ustat.h> nor
> typedef daddr_t. Musl does not define these as ustat is deprecated
> in favor of statfs() and daddr_t is ancient [1].

> Other libc also does not have <sys/ustat.h> (ustat support was removed
> from glibc in 2.28), but they have daddr_t.

> This brings <linux/types.h> dependency for ustat testing.

> Typedef is needed as sparc and mips have __kernel_daddr_t long,
> otherwise it's int.

> [1] https://www.openwall.com/lists/musl/2019/06/10/1

Ping, please.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
