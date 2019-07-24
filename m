Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1B872B53
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 11:27:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 943693C1CF5
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 11:27:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id ED6DB3C1D00
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 11:27:18 +0200 (CEST)
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
 [209.85.222.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0CBAC1A013CC
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 11:27:18 +0200 (CEST)
Received: by mail-ua1-f66.google.com with SMTP id o2so18198132uae.10
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 02:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AJpmcCRmMHYPsjCwAcg/NeAa0ewj1xPSjF4QcUiszjc=;
 b=Exds3BEXyDQUAwB9rT7C6rI190TUZ92mJv35GiBdGUWT8LjQIDDQTb6G5iDwVCjT9F
 wz7JgswIUy5A5sz2IlS8JLvPRkH18NAIpLO8jMyhz7CjzkCzqL+M2wRMygCj86N3l9sP
 /DBtCDHt94qwoslinyKNKAfVYDYmLMnl2hpwN0b8JMuflMWjdgElHaxcjaccIY+uiMdx
 SlH7j3uct8kKTNzWqh31WsUw64wAOtXe/amcyU33SmmyeNwZKZNqdFOHBV6b6xBj2YZ3
 BHpe+/hd09U50/WwUi55usO2j7P/inEpyY997plFQ0gHhrti3Lx8D6j1omEf9UEjmUCW
 aB6Q==
X-Gm-Message-State: APjAAAUk1CKuo8l5hhQTXRD25kFAIrxVbON1FfQJpSlqz7pqaxXD5Ayg
 5zL2uYuP/CFVaabh4ttsDMAFA3Vuypn9G17ISa5k7Q==
X-Google-Smtp-Source: APXvYqzgBLXhHrpHa9RpRaqF2Y7ORe7UdIZ2TZBtqeA4uoX3j0bNzwEADRgCgbU8kecrOvg3jxBEASZuwsGi9/GWr6E=
X-Received: by 2002:ab0:74c7:: with SMTP id f7mr2191312uaq.106.1563960436854; 
 Wed, 24 Jul 2019 02:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190723115937.27247-1-chrubis@suse.cz>
In-Reply-To: <20190723115937.27247-1-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Wed, 24 Jul 2019 17:27:04 +0800
Message-ID: <CAEemH2d2+X=qOvfb-B9r-CKTvOmC=0kuDGqci0XLFc3bM9U_fA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscalls/mbind0{2,3,4}: Add basic mbind tests
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

Hi Cyril,

On Tue, Jul 23, 2019 at 7:59 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> +#include "tst_test.h"
> +#include "tst_numa.h"
> +
> +#ifdef HAVE_NUMA_H

HAVE_NUMA_V2 is needed here, to avoid hitting cross-compilation failures.
    https://travis-ci.com/wangli5665/ltp/builds/120315507

In case you missed some comments from Petr, plz see:
    http://lists.linux.it/pipermail/ltp/2019-June/012226.html
    http://lists.linux.it/pipermail/ltp/2019-June/012227.html

> +
> +       TEST(mbind(ptr, size, mode, bm->maskp, bm->size + 1, MPOL_MF_STRICT));
> +

Maybe we also need to move the tst_numa_unmap/numa_free_nodemask to
here, in case of the mbind02 hit fail and return early.

Besides these tiny issues, patch v3 looks good to me.

--
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
