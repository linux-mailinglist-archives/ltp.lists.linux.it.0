Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 343343BF6E2
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 10:27:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D807B3C6829
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 10:27:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1488B3C1CE5
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 10:27:33 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 547621A014AA
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 10:27:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625732850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kw0lX0x3Wzhzt0r9EQnZtqUqrzF9avty7O1g8YIZ7zo=;
 b=aRwTU5OkmdyqYpMfu/fBPM21YfJ5KVXUGff5XPosmU4ou6NZ64ZlcV70Zp+ZqzrcNxusXp
 dAKPNV99M7UxztpZdnX2ATy8qx5T9n342Pl46JYkAlyOWbkrG2Y/5E75yfxiUZN90sK9Re
 NMvFQS+3mlDhXgjGqQRzYmOsQh8KFgc=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-LWNUkR-mMmS9qfICa836mg-1; Thu, 08 Jul 2021 04:27:29 -0400
X-MC-Unique: LWNUkR-mMmS9qfICa836mg-1
Received: by mail-yb1-f198.google.com with SMTP id
 q10-20020a056902150ab02905592911c932so6060881ybu.15
 for <ltp@lists.linux.it>; Thu, 08 Jul 2021 01:27:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kw0lX0x3Wzhzt0r9EQnZtqUqrzF9avty7O1g8YIZ7zo=;
 b=Qkqvolzpxph7yMZHuo6RWWDUznqIc0NZYTmBrvyVszClUVL3Z844MaVXwvWLFojI+0
 2xRdGevvDfie6Cc2qAiKx0FEqQC+s42ljeXEi8+BANPTOm8ivk0UcvAFhCpGppBUngQm
 BAojuo7kCThsFGF+5jk/gtSLuyQtePZqQpuXa1M6Geis2KkZRdow5AaSl1Vi7zIXVhTK
 /pcF6/o0iDcuc/4DTnwfkUTG6qPh6FD5mxRluJ1io6QM9qYb/K0ju9kWhepvVbgSCTp9
 q9ZMkqa8AGwSGGBS0a0Fsum0+6akAQzSfFXjVIrIOQ5CBcZNm7C+8GsfWNzoc5ZZjOkN
 fWhw==
X-Gm-Message-State: AOAM5316wr2jkXxjnDZEhFx9JhgbmLt1ZdZh3p6xVQEEDzem8dXuHHmg
 G0bITNYi07e8drgkNuPBGQPncj8okF6ahrEwvXaQXN5eqFWsQWPHq0HlOIpssoSXMfbLnu16EDj
 0Nl3B9VjtLBunQ/DY74DOq2ngazI=
X-Received: by 2002:a25:4283:: with SMTP id
 p125mr38944964yba.243.1625732848794; 
 Thu, 08 Jul 2021 01:27:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1xr+/xZrQDP0zz0bqIbMxvDrl2KEmW98LncHED0TUeXNMs0BWFg+3wJH1UMz3jC1XIsjuuTsg/QPcjROPGHE=
X-Received: by 2002:a25:4283:: with SMTP id
 p125mr38944944yba.243.1625732848605; 
 Thu, 08 Jul 2021 01:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210706105758.43220-1-aleksei.kodanev@bell-sw.com>
 <CAEemH2cOm+1BMWE7oWVFttXNOeQsYk9veXePS+ctxAABk2rCWQ@mail.gmail.com>
 <c2c7ff46-df28-c7b6-49dd-c891d9655d00@bell-sw.com>
 <381b8420-3dba-d7c1-027c-e2e2adc719de@bell-sw.com>
 <60E50890.9040903@fujitsu.com>
 <CAEemH2fKXJmgKAr4JXW5y+dcgEwL1taobXLY7OdTWBzLXGVOYg@mail.gmail.com>
 <60E52E00.8020105@fujitsu.com> <60E661ED.7000305@fujitsu.com>
In-Reply-To: <60E661ED.7000305@fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 8 Jul 2021 16:27:16 +0800
Message-ID: <CAEemH2fvp4C4VF8+bNbWbmenJr4Q3duX2va8UqD6y4DMzYbZUw@mail.gmail.com>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] shmget03: fix test when some shm segments already
 exist
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
Cc: LTP List <ltp@lists.linux.it>, Huanian Li <huanli@redhat.com>
Content-Type: multipart/mixed; boundary="===============1183464794=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1183464794==
Content-Type: multipart/alternative; boundary="000000000000f0f1bd05c6986cc5"

--000000000000f0f1bd05c6986cc5
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 8, 2021 at 10:24 AM xuyang2018.jy@fujitsu.com <
xuyang2018.jy@fujitsu.com> wrote:

> Hi Li
>
> How about using CLONE_NEWIPC to test this, so we can avoid this race
> situation.
>

Maybe yes, but that sounds a bit like a new test.

If let me choose from Alex suggestion or this CLONE_NEWIPC,
I think both are OK, because it just an error return check,
not a big deal.

-- 
Regards,
Li Wang

--000000000000f0f1bd05c6986cc5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jul 8, 2021 at 10:24 AM <a href=3D"mailto:x=
uyang2018.jy@fujitsu.com">xuyang2018.jy@fujitsu.com</a> &lt;<a href=3D"mail=
to:xuyang2018.jy@fujitsu.com">xuyang2018.jy@fujitsu.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Li<br>
<br>
How about using CLONE_NEWIPC to test this, so we can avoid this race <br>
situation.<br></blockquote><div><br></div><div class=3D"gmail_default" styl=
e=3D"font-size:small">Maybe yes, but that sounds a bit like a new test.</di=
v><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">If let me choose from Alex s=
uggestion or this CLONE_NEWIPC,</div><div class=3D"gmail_default" style=3D"=
font-size:small">I think both are OK,=C2=A0because=C2=A0it just an error re=
turn check,</div><div class=3D"gmail_default" style=3D"font-size:small">not=
 a big deal.</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gma=
il_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div=
></div></div></div>

--000000000000f0f1bd05c6986cc5--


--===============1183464794==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1183464794==--

