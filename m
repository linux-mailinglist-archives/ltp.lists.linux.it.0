Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC81E1F3A9C
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 14:27:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 853113C2E59
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 14:27:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 9F6833C2E45
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 14:27:20 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id B39AA1000672
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 14:27:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591705638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Oy7bDDSNVx6syN7xQc42D1KhEyfopIinK9wf35qbi28=;
 b=L4L0Vdmu8tL7HbvMSiutcXpnavGCwzmmLX9F1K/AJX9c2GvXRXwsKRXUCCzPKBgD7fteOj
 yhSAiSp2aUOuhIYwljlus26bSrgfyB5GFZQEA19uG9VAfujhm+scEjzGanCQz34GpC7YK6
 sofMSnF/kha+O1hNjFEkh3J+lNKIsHU=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-8KXWC5OsNLeU-zn9wE0Y-A-1; Tue, 09 Jun 2020 08:27:15 -0400
X-MC-Unique: 8KXWC5OsNLeU-zn9wE0Y-A-1
Received: by mail-lf1-f70.google.com with SMTP id u5so6737788lfo.6
 for <ltp@lists.linux.it>; Tue, 09 Jun 2020 05:27:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Oy7bDDSNVx6syN7xQc42D1KhEyfopIinK9wf35qbi28=;
 b=OcFUfmWPh2f4suePdL+TBVl1QJcj85NKGw/RLt8//O45MmP09PpeLopPbx3m0m2z6b
 JM7sRj1ADwlvnabasBYB46Jrlxyo9oPNtKLLarfdDmFcLZobzf/CSXSEh45+o95uSt6D
 5gA2ahdCQyjPeuqrCfd1LTXs3c7w8zC6t7cTUMasjRKRBXl/gzCDa8vNrEOLHV88rZFK
 f6xYOSKgcFWl8kG0y/FRgQb+8GbyNNgnfcVq/4d0Vtxp492q/FkcF18w0+hHAE1taGsC
 SEFW3q1rqs1oxn6oFq3mhfSXPPI7PccauefohKCjpmCJKuiiPX5utPIiAyIUojX13Jzl
 uC0A==
X-Gm-Message-State: AOAM533Lqd3L4b1KwORBsyA9VX+c+Nu3HD5Ez0A/AqLORYnd09Lri0ZH
 Hla3ySK28qrFikPM32x8Mb5IOKkJCJo9Zjo+TVf2g9jwQ29WgFgSr4RC8g38GNfnT6Nu+Dpc9ME
 bBHr1atieh33nkCOBFFh3g0ZM9WQ=
X-Received: by 2002:a19:70d:: with SMTP id 13mr15441734lfh.60.1591705634334;
 Tue, 09 Jun 2020 05:27:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAKBtEscIVDxgVcNICe8mJ2D0MLU3hkLfxy/BmSrSJB2KikpTwpcr/+4vaEhGOOYY2b3h1824Ydn7Zh2uvnIQ=
X-Received: by 2002:a19:70d:: with SMTP id 13mr15441720lfh.60.1591705634116;
 Tue, 09 Jun 2020 05:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <33c4abf347e2de96f89b9acea02d731e47dbf2a9.1591700131.git.jstancek@redhat.com>
In-Reply-To: <33c4abf347e2de96f89b9acea02d731e47dbf2a9.1591700131.git.jstancek@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 9 Jun 2020 20:27:01 +0800
Message-ID: <CAEemH2cnbDcqWMo2tLRzTsfMgFxecqP8QMEUFdchS7MxMGErCA@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>,
 Richard Palethorpe <rpalethorpe@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] read_all: scale down how many times we read by
 default
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
Content-Type: multipart/mixed; boundary="===============0102402556=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0102402556==
Content-Type: multipart/alternative; boundary="000000000000e8a8b605a7a5d810"

--000000000000e8a8b605a7a5d810
Content-Type: text/plain; charset="UTF-8"

[Cc Richard] in case he has extra suggest.

On Tue, Jun 9, 2020 at 6:56 PM Jan Stancek <jstancek@redhat.com> wrote:

> read_all is running into timeouts on high cpu systems, where
> access to some per-cpu files is protected by a lock. Latest
> example is /sys/kernel/tracing/per_cpu/*.
>
> At the moment we read each file 10 times, and we have been
> excluding files that take too long. Rather than expanding
> blacklist, scale the default down to 3.
>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
>
Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--000000000000e8a8b605a7a5d810
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">[Cc Richard]<span class=3D"gmail_default" style=3D"font-si=
ze:small"> in case he has extra suggest.</span><div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 9, 2020 at 6:56 P=
M Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" target=3D"_blank">=
jstancek@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">read_all is running into timeouts on high cpu systems, w=
here<br>
access to some per-cpu files is protected by a lock. Latest<br>
example is /sys/kernel/tracing/per_cpu/*.<br>
<br>
At the moment we read each file 10 times, and we have been<br>
excluding files that take too long. Rather than expanding<br>
blacklist, scale the default down to 3.<br>
<br>
Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" targe=
t=3D"_blank">jstancek@redhat.com</a>&gt;<br></blockquote><div><span class=
=3D"gmail_default" style=3D"font-size:small">Reviewed-by: Li Wang &lt;<a hr=
ef=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@redhat.com</a>&gt;=
</span></div><div><span class=3D"gmail_default" style=3D"font-size:small"><=
/span><br></div></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards=
,<br></div><div>Li Wang<br></div></div></div></div></div>

--000000000000e8a8b605a7a5d810--


--===============0102402556==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0102402556==--

