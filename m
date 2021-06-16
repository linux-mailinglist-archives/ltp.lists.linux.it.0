Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F4E3A9728
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 12:22:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C15903C88F5
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 12:22:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 51E553C2174
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 12:22:10 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 579D510009B6
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 12:22:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623838928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KZ1KIoO2zys4d9fwpNrlTyi7ckuYXSXzd6litrSJiVE=;
 b=VfYU1gvKpbFFLOAfNsQclnr5+hujLfLay4nbdI9C+2YBw8isNZ8tCZg5j1HHAoQ6s9pnwI
 Z3RPrGUdQkBtUAECnnDRlRNjPow0ZxEpFsV9qxDm59xFIIbPeyjBkBORSaXXVJ+QER/H+f
 UnJL7TEtSFDy5A5PUO+4SU/ys+gPlJo=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541--3291-qxPsSYs7qBa7CJvw-1; Wed, 16 Jun 2021 06:22:06 -0400
X-MC-Unique: -3291-qxPsSYs7qBa7CJvw-1
Received: by mail-yb1-f197.google.com with SMTP id
 q63-20020a25d9420000b0290532e824f77cso2147310ybg.10
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 03:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KZ1KIoO2zys4d9fwpNrlTyi7ckuYXSXzd6litrSJiVE=;
 b=ACLwgw2oplpllPjLugVWpMtU+rBRwEWPdn+DyU9VSrhRkuH7q9ELf8wVb/rYqsN+J2
 B2wMzAmqWpTvGK2qeFmWQ7JM8IGt0KFz5ABJJe2+KGlgr5NbxS5xxKMLqu6p9X+lEqMl
 eVUKhiET9+Qv20Z2JlogymdOosPlOHLEUfFZMgrZZ4Le7TaLN0Hf5Wd+xw9e7GdvYPjV
 ZLBP5qMAgGMK9vSCqPMmNPamWOYSyMgN+9bMhxgr0GwGecPVKuathMRhHp+YyZZoXeMx
 +ACZ+tRH1SI4vFylnmY6/X7bKZ1ntXWPqOcAXNtqckD581Fpk4M3pVv2uNEx7YcDZRdO
 6yDQ==
X-Gm-Message-State: AOAM531pClzzrFBJVppI0mpdk3sxE2ZvYbtLgCzzwGAyhdJhUtRw2AOt
 5TgL5CZLYmzZHu3v0ZsYxoNrqW1ZXYCIQaWudkmdMme6WvuqJPNqghtOBB7d38xJJ9F+aUMXLQi
 4tZQQeELbEOiSrpxhJGKjqvf+PbU=
X-Received: by 2002:a25:b44d:: with SMTP id c13mr5272220ybg.86.1623838926431; 
 Wed, 16 Jun 2021 03:22:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxomD7b97I/CpwplHKTBofEK4N/XI6buMIE1ZC2P2IC/U8zM1MjpxwqvNq7uDnHBjp3uLlfdJXUEXqxmETGzxA=
X-Received: by 2002:a25:b44d:: with SMTP id c13mr5272197ybg.86.1623838926235; 
 Wed, 16 Jun 2021 03:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210615163307.10755-1-pvorel@suse.cz>
 <20210615163307.10755-4-pvorel@suse.cz>
 <CAEemH2eLDk8rb3wUMCjz6Txo333f4Mae1AWZy0Rt6mTYuvYf6w@mail.gmail.com>
 <YMnMDulm9C+SDdXa@pevik>
In-Reply-To: <YMnMDulm9C+SDdXa@pevik>
From: Li Wang <liwang@redhat.com>
Date: Wed, 16 Jun 2021 18:21:54 +0800
Message-ID: <CAEemH2e8K27bABdo=DQJUbiVKewex=EK27DT3P9oNWhK3bB7mQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 3/3] doc: Update LTPROOT and PATH environment
 variables
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>,
 Xiao Yang <yangx.jy@cn.fujitsu.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Jun 16, 2021 at 6:02 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi Li,
>
> > > -$ LTPROOT=/opt/ltp PATH="$PATH:$LTPROOT/testcases/bin" testcases/bin/wc01.sh
> > > +$ LTPROOT=/opt/ltp testcases/bin/wc01.sh
>
> > I'm wondering does this really work? or, did I miss something?
> Oops, I'm sorry to send broken patchset, this is obviously wrong.
> We have to keep path set when calling script directly, because tst_test.sh would
> be missing.
>
> when in LPTROOT directory:
> LTPROOT=/opt/ltp testcases/bin/wc01.sh
> testcases/bin/wc01.sh: line 13: .: tst_test.sh: file not found
>
> But we don't want to set path in each script nor load library as
> . testcases/bin/tst_test.sh
>
> Thus I guess setting PATH in LTP API doesn't make much sense if it works only
> when using LTP runner (runltp{,-ng}, which BTW set path as well.

Exactly :).

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
