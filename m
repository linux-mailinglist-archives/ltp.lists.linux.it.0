Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4826E80643
	for <lists+linux-ltp@lfdr.de>; Sat,  3 Aug 2019 15:02:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D8FAD3C1E1F
	for <lists+linux-ltp@lfdr.de>; Sat,  3 Aug 2019 15:02:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id C320B3C194D
 for <ltp@lists.linux.it>; Sat,  3 Aug 2019 15:02:19 +0200 (CEST)
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
 [209.85.221.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 06AC01401103
 for <ltp@lists.linux.it>; Sat,  3 Aug 2019 15:02:19 +0200 (CEST)
Received: by mail-vk1-f196.google.com with SMTP id e83so15846289vke.12
 for <ltp@lists.linux.it>; Sat, 03 Aug 2019 06:02:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0F1sjEGvOi1HPhfF62YveMSPmzdCANlbEUtY4Iqkmpw=;
 b=Zc9O8dCwXWjl6sPvvnS57wMA+ThCl/t8FroWA1kjVaweUVlUVf7CGkIS3zNegMLrHS
 Lhowgb0pvJpk7kH9cWk6v1PETeH4ZZ2RmtAzuTjkCjeN1+lhNIkeuQELJYZQRJ2EveXh
 vtdlw3P8IA1jQL3rEjcRfMCSL6jL7hLK8cNTCO0J879lb8bRFqCITA9yZwlGPe9HZUsP
 0IDrCt4+bSoyFa84L7z/wBiics2lI1sv+OjQUV/D3p2yaFN81GWk95lMn6Paz/qFfLRx
 4ulGqbRf+ptuBivwHHUVS5Hr8NZR1uZDKMWL9W8w4FbHfwFaOlqjCQOq65LG5zCDIIrh
 oeXA==
X-Gm-Message-State: APjAAAU1AT05MYpd/f74SVaEWwb4rUBtsJ5qOfwNefa5VKEFm9b9GsWY
 ILgyFspAeaY7xF54gI7QFkkS0IQsej8c/DbPqthhFg==
X-Google-Smtp-Source: APXvYqwe9lBdU/95XgcVjrP36tnaMlTp1dcqdcYArAfsDhZrCnu5vUHe3gqk3+j/OAKFVD+Wy82JPOK4uKg3d5gelCk=
X-Received: by 2002:ac5:c2d2:: with SMTP id i18mr52961135vkk.36.1564837337715; 
 Sat, 03 Aug 2019 06:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190801092616.30553-1-chrubis@suse.cz>
 <20190801092616.30553-3-chrubis@suse.cz>
In-Reply-To: <20190801092616.30553-3-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Sat, 3 Aug 2019 21:02:06 +0800
Message-ID: <CAEemH2d8dEe0km7FA43S2eQYHE00m9advsAbUbmFfixcV0-qhw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 2/9] lib: Add a canary for guarded buffers
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

On Thu, Aug 1, 2019 at 5:26 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> In a case that the buffer size is not a multiple of a page size there is
> unused space before the start of the buffer. Let's fill that with
> center mirrored random bytes and check that the buffer wasn't modified
> before we unmap it.

I like this check canary part. Amazing to me.

> +
> +static void check_canary(struct map *map)
> +{
> +       size_t i;
> +       char *buf = map->addr;
> +
> +       for (i = 0; i < map->buf_shift/2; i++) {
> +               if (buf[map->buf_shift - i - 1] != buf[i]) {
> +                       tst_res(TWARN,
> +                               "pid %i: buffer modified before address %p %zu",
> +                               (char*)map->addr + map->buf_shift, i);

Here you probably missed the getpid() for printing %i match :).

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
