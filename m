Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B22A3309F0
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 10:05:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 049963C4CC4
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 10:05:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 2DD4F3C176A
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 10:05:09 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 81A0160056A
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 10:05:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615194307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VcE05ty8g4mfiyZiB1/ZDEjp6kwGCDadRXp2UBBvAgA=;
 b=PAqg0TBVfVNI6GjFvwqGweNEcPtK78aHA2w5IVricp4Kn0bdHk7kifUt+cD7U+n7luhKJ8
 zFX7DvU6KsvV8OY+d2SYpcCH6gZVSHQFMQuwqlQaYLW80/r9FpE2ls7/H4ejsFzKUrXBai
 F3YLC0qYrUjzoHHCBnTd38m09nf9chs=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-HIzncxk5Pyal1oWnGmmuAQ-1; Mon, 08 Mar 2021 04:05:03 -0500
X-MC-Unique: HIzncxk5Pyal1oWnGmmuAQ-1
Received: by mail-yb1-f197.google.com with SMTP id 131so12148241ybp.16
 for <ltp@lists.linux.it>; Mon, 08 Mar 2021 01:05:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VcE05ty8g4mfiyZiB1/ZDEjp6kwGCDadRXp2UBBvAgA=;
 b=pZK8lVcvpVrlBtFVO20vSal5/go3p6by5opqEiYvZMyqq10myLhfzMxMRiAFePn0Cf
 Rz1j+6L30fUaKP/TZ+lmFjzVO2y44gLqCBw/iT3F+go8q3rvsnqSOp5X6BKYKGSvt2Os
 MW+aUQOFhNAKTR3ck+uNT7sMbVKducsEuDFBfwf97UQ8tAiSjgEu1of4Hb4ocrSRO8k4
 0aN1knhqXAGkvyRY0IGO8eNlxQ7GAz2YF4m3aFuIir/hV4087ew7poZLQkskHmPvKj+m
 AIqAelCrvjD2nGhPOVmjY+hqH7St8U5kUtuTN7Vluz4xe3hkYw6Wvar0ytd4kWCdREZ9
 bOrQ==
X-Gm-Message-State: AOAM532q+k/HpXI3sQ1N5AdsHd+MjqD7MW3SbRxtB/8KxnbxmLIKixz2
 Vh1S7A5gXIZtLiSQhgqGUNGazRJ226B3O1QvZfs8mEXugdJ3jhyh5vMba+2x9CP+wdOOAA4TBTN
 1b1V8D4Y+bhq0nPAozbr8D6etfPE=
X-Received: by 2002:a25:5ac2:: with SMTP id
 o185mr33279044ybb.252.1615194303126; 
 Mon, 08 Mar 2021 01:05:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKEDuB5fr9qAXrz1fRz7MXDUHAEWSaam0776TrmnwnVDrFkUdv3IPrpSE7GqDFKLth9yB+C2j7Ji8wq4nPIwY=
X-Received: by 2002:a25:5ac2:: with SMTP id
 o185mr33279027ybb.252.1615194302967; 
 Mon, 08 Mar 2021 01:05:02 -0800 (PST)
MIME-Version: 1.0
References: <20210302152510.15116-1-rpalethorpe@suse.com>
 <20210302152510.15116-4-rpalethorpe@suse.com>
In-Reply-To: <20210302152510.15116-4-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 8 Mar 2021 17:04:51 +0800
Message-ID: <CAEemH2fO7Bon38PX5Moq4YxWyXRN67yMX9b6HUyp7Wj4_vT=Jw@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v2 3/7] Add new CGroups Core and Item APIs
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
Content-Type: multipart/mixed; boundary="===============0444249087=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0444249087==
Content-Type: multipart/alternative; boundary="000000000000ac074405bd02bae0"

--000000000000ac074405bd02bae0
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

Thanks for your refactor, this is much better than what I have written
before:).

But I have to say this version is complicated since there are many
interlaced structures defined, especially for the cgroup-item part.
And my concern is that it might unfriendly to maintainers and users.

Anyway, I still need time to understand the whole part and will
try to reduce something to make it more simplified if I can.

-- 
Regards,
Li Wang

--000000000000ac074405bd02bae0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Richard,</div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
>Thanks for your refactor, this is much better than what I have written bef=
ore:).</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">But I have to say =
this version is complicated since there are many</div><div class=3D"gmail_d=
efault" style=3D"font-size:small">interlaced structures defined, especially=
 for the cgroup-item part.</div><div class=3D"gmail_default" style=3D"font-=
size:small">And my concern is that it might unfriendly to maintainers and u=
sers.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">Anyway, I still nee=
d=C2=A0time to understand the whole part and will</div><div class=3D"gmail_=
default" style=3D"">try to reduce something to make it more=C2=A0simplified=
=C2=A0if I can.</div></div><div><br></div>-- <br><div dir=3D"ltr"><div dir=
=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000ac074405bd02bae0--


--===============0444249087==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0444249087==--

