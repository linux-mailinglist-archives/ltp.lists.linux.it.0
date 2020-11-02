Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E742A2324
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Nov 2020 03:43:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 01BAE3C3071
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Nov 2020 03:43:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 479353C24CF
 for <ltp@lists.linux.it>; Mon,  2 Nov 2020 03:43:15 +0100 (CET)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7BCD4200B76
 for <ltp@lists.linux.it>; Mon,  2 Nov 2020 03:43:14 +0100 (CET)
Received: from mail-lj1-f199.google.com ([209.85.208.199])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1kZPoP-0003aK-AO
 for ltp@lists.linux.it; Mon, 02 Nov 2020 02:43:13 +0000
Received: by mail-lj1-f199.google.com with SMTP id d5so2793064ljo.17
 for <ltp@lists.linux.it>; Sun, 01 Nov 2020 18:43:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hbNEN3cN+P8wJIaGHaanPWVZF+5Lkmz/vDH163goETU=;
 b=QdJrcDqC30rfQqMBBAr9hraJvsQU0DCmVGVzg28m0nMPy/RoQic+ZcaZrm/u6pu6aL
 5NfaXR6ZxgTdmuWm5xOPFQWpaIVSqNDHlmIgyU8FQ+R8PxRrsgnLydQiz2710uLz9JxH
 1DNwV/xD+tHK9nKDiDyIO/lu5luFqWzpOpBKmrp3X0OknYuaJoP5JAsX0IP+5FbFOBHJ
 hXhmkDAHB1RedcXTV/gLiMMvy007rasxzNM5C274s8GRey2gjP0ORdT1Td+EzeocG24r
 LMF/S1aj8W7vMgarC2JElLxMpVGdMzqpCBvwrIeVp9P3gSOdui0HfZ6OpPI8WxvW6M0y
 W1Uw==
X-Gm-Message-State: AOAM530O+5i0vXtfPbHEKm/dFG8f/jRP4i4xZItwNSZ+ODP0acjIKmyt
 xSUxfAWbz+U1sXcjLHxePQZ9ZGx3pAgNthEG9+1hkrSME5IUc9BY55r7XmMiEQnOwgxEJvzxl2v
 y0Ja3nM91UWDsnSTtcuRM7n2s9jYfJwNwrFuifb8rnrU=
X-Received: by 2002:a2e:8815:: with SMTP id x21mr6040411ljh.312.1604284992785; 
 Sun, 01 Nov 2020 18:43:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxnWj84GRQZjBn5DLt1jEtBxsofAwzNPs8HeqTQNLQbekwQ5V+MYcIAzdPL4YJlhAJXW7Kptckvn8lw+2ZrLao=
X-Received: by 2002:a2e:8815:: with SMTP id x21mr6040405ljh.312.1604284992506; 
 Sun, 01 Nov 2020 18:43:12 -0800 (PST)
MIME-Version: 1.0
References: <20201029140031.40968-1-po-hsu.lin@canonical.com>
 <20201030131214.GA32451@yuki.lan>
In-Reply-To: <20201030131214.GA32451@yuki.lan>
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
Date: Mon, 2 Nov 2020 10:43:01 +0800
Message-ID: <CAMy_GT_zEnmgD4Sr1PC8PgyhDXhLoor=9yT2JpmS5EeGOjjo8Q@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/statx05: add mkfs.ext4 package version
 check
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

On Fri, Oct 30, 2020 at 9:11 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> > +     int ret, rc, major, minor, patch;
> > +
> > +     f = SAFE_POPEN("mkfs.ext4 -V 2>&1 | awk '/mke2fs/ {print $2}'", "r");
> > +     rc = fscanf(f, "%d.%d.%d", &major, &minor, &patch);
>
> I wonder if the awk is necessary, it may produce TWARN on minimal
> embedded systems where awk is not present. Why can't we use scanf() instead?
>
> As far as I can tell fscanf(f, "mke2fs %d.%d.%d", &major, &minor,
> &patch); should work fine without the awk.
Yes this works,
I will send V2 for this, thanks!

>
> --
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
