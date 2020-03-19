Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 279D118B991
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 15:40:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C50103C544C
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 15:40:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id D52E13C544C
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 15:40:12 +0100 (CET)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id F3892601AE5
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 15:40:11 +0100 (CET)
Received: from mail-lj1-f198.google.com ([209.85.208.198])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1jEwLC-0004Rg-Cb
 for ltp@lists.linux.it; Thu, 19 Mar 2020 14:40:10 +0000
Received: by mail-lj1-f198.google.com with SMTP id o2so545609lja.17
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 07:40:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OpLYUAj5BQbl6YSxo/89oQxdBK5RTjrEV0OQbTLmvPA=;
 b=ZzxL7uGPidC6MM9KRYJUqxqSqPtP3jsYpJHn7TaOyloktN+Lgmvrjjxyp/5c8Kyp3K
 QQP3Xwzm5b3t/ol8BcWuW8sfStZuCsAvJZ5D5GxHaWc3/vXHK3qHBR7U4NS3wOmDLhNI
 MY5ULrfhnsDLW1FLXbk8sKAWyfmGfqA/oeBRlS0hxfcM+PUKuCnA2yggEvWWF56+KU2O
 FUMt4Qh+tEhWTjPpFBsbdRUqOpeJyNhmgyXni4i0IvIU/0ACa7uJzWT/7/fvw0mdWLpQ
 Cb3YTIvvyR6HmqYIGepiPXBeVbbAW5vTUGxyC4X0oAVSN0rnXUK+eIlL2QvJtv3TpDxh
 tyBw==
X-Gm-Message-State: ANhLgQ1k60nL9VeTadJSRNwES+8xy87VJr5PejzHtj2EmnTNsaSBMP/f
 gfphPObnLHA9UXE/VcMux3jB1xweR593/9rSgbNt/oRnhBfEjTdR6mdwrmWSVWgq666yljhgd9x
 VPA0lj2QC4SDWGvitKQrA5+epon4ZoJ+8r8PosB/dDxA=
X-Received: by 2002:ac2:51a3:: with SMTP id f3mr2392270lfk.170.1584628809853; 
 Thu, 19 Mar 2020 07:40:09 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vu2Ac8WDkYtyQsWyH++20O2NnNX/lcAu8S3c3gXbPm8Y8gakhce9fF7quPOl+MBvWV41oAIZEsJSdiS8pW9BG4=
X-Received: by 2002:ac2:51a3:: with SMTP id f3mr2392258lfk.170.1584628809605; 
 Thu, 19 Mar 2020 07:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190710072305.25806-1-po-hsu.lin@canonical.com>
 <20190710072305.25806-4-po-hsu.lin@canonical.com>
 <20200317182120.GB11295@dell5510>
In-Reply-To: <20200317182120.GB11295@dell5510>
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
Date: Thu, 19 Mar 2020 22:39:57 +0800
Message-ID: <CAMy_GT9S6a7tFhjXHxmj+-+djjLbRzZP_HjXViX0QZSYF6kAHw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] zram/zram_lib.sh: set the compression
 algorithms back to default after test
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

Hello Petr,

Yes you're right, the zram_cleanup() will kick in after zram01.sh finishes,
so this can be dropped for the moment I think.

Thanks for the review!


On Wed, Mar 18, 2020 at 2:21 AM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi Po-Hsu,
>
> > Set the compression algorithm back to the default one in the end of the
> > zram_compress_alg() test.
>
> Why is this needed? We remove zram in zram_cleanup() anyway.
> This would make sense if we detect whether zram was loaded before testing and
> try to restore the setup of originally loaded module instead of always removing it.
>
> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
