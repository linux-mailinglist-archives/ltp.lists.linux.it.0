Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB1E6FD2A
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jul 2019 11:55:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 576253C1CF9
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jul 2019 11:55:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 82EF13C03AD
 for <ltp@lists.linux.it>; Mon, 22 Jul 2019 11:55:17 +0200 (CEST)
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0588914013A5
 for <ltp@lists.linux.it>; Mon, 22 Jul 2019 11:55:15 +0200 (CEST)
Received: by mail-vs1-f66.google.com with SMTP id v6so25714260vsq.4
 for <ltp@lists.linux.it>; Mon, 22 Jul 2019 02:55:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FaqrkOx5DZxpPcHXKrLew4DDMhCy4g7IDouNF8fKAj0=;
 b=plaFGokLNaJn2bamlp0UihwIF4znJ86EnRMaXUVjV838UTvm6WH2s/yAFgzwFkqPpm
 7Q6w3xpZfQQWqk1AkdBCAObaNrOznxMI81kJI9XpmrcqEYcHPpAYLV2MduJKj6AW3hdr
 CacTFiR6Nh7C+fP7rbQuFIcy/eR97unkYIPc+AA44SnUQZaVmryoc/M5g3KPhm7cfx+3
 AGMbVkbT35FmS8kq3pYs0iDKTAsJZCkxh0f4BwS5BmmXewDt1eGo8KoufHf1/bZp8UkM
 Zi01elpY3ABnBgh2cIyX9D2sctPbkDHkPVC66Wg8F+pbh0qLueUb8RJmIOJJc1syRvEt
 H56Q==
X-Gm-Message-State: APjAAAUzbmv7LdGgDOr8r+gEOeWowRcrFFKrD6XjZ/IJPo+hB+zU1hrn
 HMQ8DYPc3G3egIgKbwIZQ874T2e7aLHHm9ZLa4QhNQ==
X-Google-Smtp-Source: APXvYqzJ1RSPefT2oYSsjo67/ynn7pIiS17H9Ii+JiY3X2dre/crW1ynOTgSUamachOjkDsxQYcrAp79csjs46aMI4g=
X-Received: by 2002:a67:ed87:: with SMTP id d7mr18885226vsp.130.1563789314722; 
 Mon, 22 Jul 2019 02:55:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190719124817.5140-1-steven.price@arm.com>
In-Reply-To: <20190719124817.5140-1-steven.price@arm.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 22 Jul 2019 17:55:03 +0800
Message-ID: <CAEemH2fv0AXXVKDNWgATCdS2WKufV1YPDsKHhPBZbk1Dxv77LQ@mail.gmail.com>
To: Steven Price <steven.price@arm.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ustat02: Fix EFAULT in 32bit compatibility mode
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Jul 19, 2019 at 11:19 PM Steven Price <steven.price@arm.com> wrote:
>
> The size of dev_t is larger than 32 bits which causes the dev argument
> to be passed incorrectly. On Arm this means that the EFAULT test case
> actually returns EINVAL because the device number isn't recognised.
>
> Signed-off-by: Steven Price <steven.price@arm.com>
Acked-by: Li Wang <liwang@redhat.com>

Thanks for the fix, this patch works for me,

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
