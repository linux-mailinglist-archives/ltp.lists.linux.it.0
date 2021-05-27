Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3773925E6
	for <lists+linux-ltp@lfdr.de>; Thu, 27 May 2021 06:11:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1F1423CA776
	for <lists+linux-ltp@lfdr.de>; Thu, 27 May 2021 06:11:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5BC793C4CB1
 for <ltp@lists.linux.it>; Thu, 27 May 2021 06:11:17 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 835D4600F5F
 for <ltp@lists.linux.it>; Thu, 27 May 2021 06:11:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622088675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wYYvuKHrW7vhmykYsHb/Gyp8QxzhPkOXd2uYjhhm3v0=;
 b=CrzNgkRn0armbxj8LsskRvnh6pME/UZZEwoFhz/XAqnd0JXNQ+kgXDIqzu+wicQesKhR+b
 YXYkftkaZU/SCPCEbjbJm3KbG3csPq//k2r1cBZyH3PwucJs3WN1vYZTC0DDkztNL9xWsR
 ovn7dV4mnLts4+3XaMNc5Mr/8hh1BiA=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-GDZuCDNqMGKK1vP9-5THKw-1; Thu, 27 May 2021 00:11:13 -0400
X-MC-Unique: GDZuCDNqMGKK1vP9-5THKw-1
Received: by mail-yb1-f199.google.com with SMTP id
 u13-20020a25f80d0000b029051d7fee31cfso4260900ybd.22
 for <ltp@lists.linux.it>; Wed, 26 May 2021 21:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wYYvuKHrW7vhmykYsHb/Gyp8QxzhPkOXd2uYjhhm3v0=;
 b=RlN+LlTshc8U/s23UbPBBFDtgXcitmnmGdhMtMwz4cEo8EYBr5XEmD+mdINEP12q2J
 5TSjpUEHk3GyZR1e98cp1+kTzHfE8VReQsvSQMFNrVyR+Zuzdo8mSr5yvefYILX6HdyV
 kixfyMJrIcybYIMy9ejcDs9fSahr29HvBdI43uOWNpulJwVjqEPgpqrpr9jSYR6Aoxgl
 he/9SjZY8lcDaNTrJCWL8EpE6rQZEt1XKtpW4ReNTOCwTDDE4rRyiMlYg/YBfyjf2dJe
 weK5SzvykM5zTFRjwNb6rHdbp7cMgdeFaV43OjQj/QxjzdIZlmSPecPTgeKPBkK8eN6j
 fsRA==
X-Gm-Message-State: AOAM531mEO7OBu6yH2o7sK7JD/2IfD82h2J0767VrYk2YIUKPrQ11CsG
 fGhxgMGaZywaHRkvGclHo89IS5LHG4JRdck5eD6OwWhW3L2WUANnVuoUn8N9kUWDI/LPxn5fjA3
 Q8seXUzVDrp+fZsBNq9UDGizDdFo=
X-Received: by 2002:a25:b44d:: with SMTP id c13mr1978034ybg.86.1622088672995; 
 Wed, 26 May 2021 21:11:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/rbK9/XWeCEWZ8hCljRLYWyP8GfiKscNJpaXfra6llj8vzXRVAjKbGDm2QnP/l372gyxIO7pAK38XJ9ccYI4=
X-Received: by 2002:a25:b44d:: with SMTP id c13mr1978026ybg.86.1622088672854; 
 Wed, 26 May 2021 21:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210519085812.27263-1-liwang@redhat.com>
 <78d1900a-cdc7-77c6-8f01-73ce4236a162@jv-coder.de>
In-Reply-To: <78d1900a-cdc7-77c6-8f01-73ce4236a162@jv-coder.de>
From: Li Wang <liwang@redhat.com>
Date: Thu, 27 May 2021 12:11:01 +0800
Message-ID: <CAEemH2d8tcBVsrmL1-bWWSchy6EpcKCoTO2ZA85jcnsEhESoxA@mail.gmail.com>
To: Joerg Vehlow <lkml@jv-coder.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] tst_test: using SIGTERM to terminate process
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

On Wed, May 19, 2021 at 5:19 PM Joerg Vehlow <lkml@jv-coder.de> wrote:
>
> Hi,
>
> On 5/19/2021 10:58 AM, Li Wang wrote:
> > diff --git a/lib/newlib_tests/shell/timeout03.sh b/lib/newlib_tests/shell/timeout03.sh
> > index cd548d9a2..dabef32a2 100755
> > --- a/lib/newlib_tests/shell/timeout03.sh
> > +++ b/lib/newlib_tests/shell/timeout03.sh
> > @@ -6,8 +6,9 @@
> >   # expected output:
> >   # timeout03 1 TINFO: timeout per run is 0h 0m 1s
> >   # timeout03 1 TINFO: testing killing test after TST_TIMEOUT
> > -# timeout03 1 TBROK: Test timeouted, sending SIGINT! If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1
> > -# timeout03 1 TBROK: test interrupted or timed out
> > +# timeout03 1 TBROK: Test timed out, sending SIGTERM! If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1
> > +# Terminated
> Nit: This Message seems to be only there for bash... I tried to find why
> and if it can be suppressed, but found nothing. I guess it comes from
> the terminated sleep process.

Yes, but that's not a big deal, it only appears in timed out and we
can tolerate:).

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
