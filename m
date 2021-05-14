Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9133805EC
	for <lists+linux-ltp@lfdr.de>; Fri, 14 May 2021 11:10:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F2E793C3326
	for <lists+linux-ltp@lfdr.de>; Fri, 14 May 2021 11:10:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3064B3C1937
 for <ltp@lists.linux.it>; Fri, 14 May 2021 11:10:44 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DE578100048F
 for <ltp@lists.linux.it>; Fri, 14 May 2021 11:10:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620983442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cGcgyQcDCBF4taJ7RSpDeIbnfKbGU6iUqwxIGdu2YyM=;
 b=FkYQJS8Ek6TYhvwgOxaVFgPrbN3I5QkEjDtQqW9hkX/zQ6YcmOE4heu/Xb+RwP6rSWAAwq
 4qV4FHgb+diajbsky97hItZYkHEp0O8lpHHsn14txCrNaPiiE8J6IRquMA5PknHP4lLKvM
 DtbsH71AmI8Ty3rEqTsonAUQ5n5IqaI=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-KF0v8P_xN1SRNwQ5Wjl8Ww-1; Fri, 14 May 2021 05:10:40 -0400
X-MC-Unique: KF0v8P_xN1SRNwQ5Wjl8Ww-1
Received: by mail-yb1-f200.google.com with SMTP id
 e75-20020a25d34e0000b02904f982184581so6011489ybf.4
 for <ltp@lists.linux.it>; Fri, 14 May 2021 02:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cGcgyQcDCBF4taJ7RSpDeIbnfKbGU6iUqwxIGdu2YyM=;
 b=QA3Qy8zwLgtiJ32prMiAahS5+uv0Y5yAF+5wBeeoEUhyfFtj1ByG9CJz+YeWAKCqSx
 k2JyTAe6I1G3j9cG9d+/kRegAc7gV9Ar421bC9oiYYB6GsSNWmVDjv6NjSaDBgkrgDxb
 /6hZvKKTLv/TegRVd4Y6/VVGNidCF8IE9l/pGrYvLSi16YVbDl0eyw8xOTNwYxIANxAV
 rEdl/iApmTCBPMFtbYMaDOoGbzTnqjj+cGec5KzeV3WtamJl2r+Wg+iwMSnSDP7ECyxF
 /Y2FdU4LyCeWzltG8iGadotjfIUU0649ATVIw3p1ji1rWuY0ty05ie/TyML0xATQdOkL
 B2WQ==
X-Gm-Message-State: AOAM5307aL9Twa7uL/zDeW+wSfqCxkwjDSXT4W7ndgkZKr5uGunVCUeK
 WiQr60h00zPV31p4iuD8gcKTgXADtua/sZ5bl6TJBFBEIQ9cWWMILORBYp0dB1cx8M1+hN/oP3H
 zZ/r7et0B9nuSuM44s6/IcSbVKkc=
X-Received: by 2002:a5b:787:: with SMTP id b7mr62426598ybq.243.1620983440209; 
 Fri, 14 May 2021 02:10:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxifAy+ogP6CyXIQwUp6evb+cPclO9DQFFNj/7j9eEenDcxsWpJe96/TakFL8jvneZoH+mG9qas4XpsQ5YbcEw=
X-Received: by 2002:a5b:787:: with SMTP id b7mr62426577ybq.243.1620983439993; 
 Fri, 14 May 2021 02:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210508055109.16914-4-liwang@redhat.com>
 <dfdd8e9a-90ca-642d-1c21-da169ca3878f@jv-coder.de>
 <CAEemH2et8_SXWJTsofdt7gc0NRV=91rPe0RtAMt1BX=SbAzhig@mail.gmail.com>
 <YJvkFTUWS2iuZ00H@pevik>
 <CAEemH2fRLqipQWTxVsakYNGsmQT+2X8_xzgepCiAY1O8YWtKFA@mail.gmail.com>
 <YJ4sh7zBOZxQy1S0@pevik>
In-Reply-To: <YJ4sh7zBOZxQy1S0@pevik>
From: Li Wang <liwang@redhat.com>
Date: Fri, 14 May 2021 17:10:27 +0800
Message-ID: <CAEemH2dOg0JN6XrptGZ6WN3C1SOYpWKgSTdXtpcjSZzBjsnOMQ@mail.gmail.com>
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
Subject: Re: [LTP] [PATCH v3 3/4] lib: ignore SIGINT in _tst_kill_test
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

Petr Vorel <pvorel@suse.cz> wrote:

> > Does this below (rough solution in my mind) work for you?
> LGTM, but Joerg, Metan, could you please have a look?

Thanks, I wouldn't send a patch until Joerg/Cyril has a review.
(Maybe Joerg will have another better solution:)

> > diff --git a/lib/newlib_tests/shell/timeout03.sh
> > b/lib/newlib_tests/shell/timeout03.sh
> > index cd548d9a2..f39f5712a 100755
> > --- a/lib/newlib_tests/shell/timeout03.sh
> > +++ b/lib/newlib_tests/shell/timeout03.sh
> > @@ -30,6 +30,7 @@ TST_TIMEOUT=1
>
> >  do_test()
> >  {
> > +       trap "echo 'Sorry, timeout03 is still alive'" TERM
> Any reason why not use tst_res TINFO? (working on bash).

+1
I just use echo for a quick test, but surely we can replace it with tst_res.


> > -       while kill -0 $pid 2>&1 > /dev/null && [ $i -gt 0 ]; do
> > +       while kill -0 $pid &>/dev/null && [ $i -gt 0 ]; do
> FYI: &> is a bashism (we need to keep the original).

I just want the error does not to redirect to standard output.
Because with SIGTERM sending, it seems easier to kill all
processes, so 'kill -0 $pid' returns "No such process" errors often.

Mayby I should go with: kill -0 $pid >/dev/null 2>&1

e.g.

# ./timeout04.sh
timeout04 1 TINFO: timeout per run is 0h 0m 1s
timeout04 1 TINFO: Start
timeout04 1 TBROK: Test timeouted, sending SIGTERM! If you are running
on slow machine, try exporting LTP_TIMEOUT_MUL > 1
Terminated
./../../../testcases/lib/tst_test.sh: line 448: kill: (74911) - No such process
./../../../testcases/lib/tst_test.sh: line 454: kill: (74911) - No such process


-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
