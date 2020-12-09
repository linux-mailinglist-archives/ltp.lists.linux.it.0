Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E5F2D3B41
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Dec 2020 07:13:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 52B1E3C2B8A
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Dec 2020 07:13:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 396CF3C25D3
 for <ltp@lists.linux.it>; Wed,  9 Dec 2020 07:13:08 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id D47206005D7
 for <ltp@lists.linux.it>; Wed,  9 Dec 2020 07:13:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607494385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cObXzg4KpPJ7vKK5/6zFA71BPE5n5+9tRodsesroh9A=;
 b=ZJp+DTcQiL2BBEC3asZFiqjxsPYGxqLkNwKETQ4LhkE7tatAQIKuLPtOFJ1WTlBnU1zRA6
 ynVpzB5DIb+yEZ3FJsNLjg7+NWAcLe6mhkejdEY+QxkdoxcBu0k5oHeev27CBD6hSoSRmX
 cXWwjOh0o6Cr3Dge4Z3fmUTJkrYP2LY=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-5UaNkhsuNM6KHpZHLNC7Iw-1; Wed, 09 Dec 2020 01:13:03 -0500
X-MC-Unique: 5UaNkhsuNM6KHpZHLNC7Iw-1
Received: by mail-yb1-f197.google.com with SMTP id j1so558025ybj.11
 for <ltp@lists.linux.it>; Tue, 08 Dec 2020 22:13:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cObXzg4KpPJ7vKK5/6zFA71BPE5n5+9tRodsesroh9A=;
 b=DL670EsqLfUTFQxju1CYGVL3grWSlxpkORIdZFvp5fVokhktrPy1RWj2rdA08iH/qk
 SlyizHwTAiYbvjlTtk6LyxrbtQYTIOBJJLYcRjwFwTCt8g8pf6kXtCMQCoeU1liSay1d
 hb3EuBws7bgtmcyfFqCjexr/WFE2NJtObO89JcB0lnw8YKgn4TlE+Axa9q6/zBAJQpH1
 kG2x7PteCEsmpBxpqwI12ggzhtUjQCibl+CRoXH9wYULHJ4hcdMwnSGjqLR1PdWB2GLX
 Ahg+Di2fTKQX5soFqP1S2h/K4Ag2iRh+mbhVjnEPskUCGDnS46LxVO/CQbVTpXh2lWmt
 n0jw==
X-Gm-Message-State: AOAM532Ji890aLjKUSMcDZcZBT2tSHzcl8FUIu3p1LEtL+pyxMPEwV/B
 ZwDnBHxfA4g4CXIZgDzSsjiu2Hb7Po7tzuYlhnw9t5P8FvhbLp+Lxz+IS+/a9c+auK6S82klh/N
 KUh4grOABzUImJ8E88sRFm3Z4xSA=
X-Received: by 2002:a25:2c58:: with SMTP id s85mr1442923ybs.366.1607494382548; 
 Tue, 08 Dec 2020 22:13:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCvOLNNm+RJnOxwi593HvZaewPUxZOqnVYr/WrsxyQ0cgFVIupl1otq3eDTpA8q2U4oHCR/V8hcWMESuFrEjw=
X-Received: by 2002:a25:2c58:: with SMTP id s85mr1442887ybs.366.1607494382237; 
 Tue, 08 Dec 2020 22:13:02 -0800 (PST)
MIME-Version: 1.0
References: <20201203110616.28302-1-liwang@redhat.com>
 <20201204063305.6820-1-liwang@redhat.com>
 <20201204063305.6820-3-liwang@redhat.com>
In-Reply-To: <20201204063305.6820-3-liwang@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 9 Dec 2020 14:12:50 +0800
Message-ID: <CAEemH2exy7xkSDxWBdGpYib+3rJPR3JhwMOi9X1x2v28+ta7TQ@mail.gmail.com>
To: LTP List <ltp@lists.linux.it>
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
Subject: Re: [LTP] [PATCH v2 3/3] af_alg07: add dynamic bias for ARM
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: multipart/mixed; boundary="===============0137649060=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0137649060==
Content-Type: multipart/alternative; boundary="000000000000a1d50f05b601f33f"

--000000000000a1d50f05b601f33f
Content-Type: text/plain; charset="UTF-8"

Hi all,

Any objection to merging this one? or comments?

-- 
Regards,
Li Wang

--000000000000a1d50f05b601f33f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi all,</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Any=
 objection to merging this one? or comments?</div></div><div><br></div>-- <=
br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards=
,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000a1d50f05b601f33f--


--===============0137649060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0137649060==--

