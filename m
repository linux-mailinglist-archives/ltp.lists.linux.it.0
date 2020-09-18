Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FF0270061
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Sep 2020 17:00:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC1463C66F5
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Sep 2020 17:00:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id CB1D53C24E4
 for <ltp@lists.linux.it>; Fri, 18 Sep 2020 17:00:42 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 40B961401123
 for <ltp@lists.linux.it>; Fri, 18 Sep 2020 17:00:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600441240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=76ipI+QI1z0fHc6CrzqgFiEibXIwt9ctAcmc8sJj5ec=;
 b=BQil6sj/oSlQMrQyOnvC0Iqg163/7OZieYSNCsDXoKGqRvkXzC19wjkVM97kOW54WGHL5s
 nXOfRQqkMdrmXlp+uutXUz482pnA1r48NmeK4mAeNRUTq7xiGWi1J+sq27Mt/YiexOJkLk
 e/dWa69W/rmpU/Inhmp7jlV6Dx0vXpQ=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-EenskGcLMzi49A03WfWppw-1; Fri, 18 Sep 2020 11:00:33 -0400
X-MC-Unique: EenskGcLMzi49A03WfWppw-1
Received: by mail-yb1-f198.google.com with SMTP id v106so5715716ybi.6
 for <ltp@lists.linux.it>; Fri, 18 Sep 2020 08:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=76ipI+QI1z0fHc6CrzqgFiEibXIwt9ctAcmc8sJj5ec=;
 b=F6Uiy168pCygKcgYBP5tZoy9gap7ERFrJSn6SK/nYXClqo+OEluMvOnTJzrQ8Gnfok
 hPHMMRROlqVQO3MGhMH5e12pzVOtX6m3sU9fhrVnea7hahqG3WCk5PkmKg0qqUbFneYx
 SLXS0fLjSwM/mYKN2MKygoyiTUvnpXaJXdOa+2v0AGPEtxnN4rfQwrNbFn5jY/59PCty
 j58YctFeIOUzYS6JqloV68dXbIQ7f4Re1rXYnOFRjzLGpFWoEgFWhPpUUW4NUeCZpDIB
 rtn20RUm3WzEX5K/y+4KhzYxRcsG7qCj0Ilhg/S2X1uzESgegjiiDVpFTg24QQzEUJSg
 4YPg==
X-Gm-Message-State: AOAM530RN+Ne2LkQ5iKLIAFNIwVZ7eHZBHYmgxQaeG6j7wiJw5GZe70I
 jjQZq12BbX030YMyicxKITfFB1/vbBzDk+aA924I3895rOZynotfa5CVlXzPIO41u1C/DhJP6fl
 Qfxaob+bLm/JhJ8MqQPbx1n/7UWE=
X-Received: by 2002:a25:b792:: with SMTP id n18mr9705512ybh.286.1600441233398; 
 Fri, 18 Sep 2020 08:00:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCcENKqkwEAbCQE1FtX83hFXDtEcuOtTiJe90Cq1/lksT+3qEgKf57mKaNg/Is4p7Xr3n4oTpwhZP+4Tj6WnU=
X-Received: by 2002:a25:b792:: with SMTP id n18mr9705491ybh.286.1600441233161; 
 Fri, 18 Sep 2020 08:00:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200911035533.30538-1-liwang@redhat.com>
 <20200911130836.GA2582@yuki.lan>
 <CAEemH2fPRTh6drs=h=U7OG07SZDgpDfEB0xRadF8Y1FbaHR8Nw@mail.gmail.com>
 <20200911145730.GA6157@yuki.lan>
 <CAEemH2cXY+-Dgq8PB-ZunzRnjM1iH0KiB5gK5=CLnFDSEiKLdQ@mail.gmail.com>
 <20200915134023.GA18311@yuki.lan> <20200918114301.GA13453@yuki.lan>
In-Reply-To: <20200918114301.GA13453@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Fri, 18 Sep 2020 23:00:20 +0800
Message-ID: <CAEemH2fFQXv=DydGYAyf3jqgUA0dnEYPYPY3y4jDvJ0dWqWKUg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5] Add a test case for mmap MAP_GROWSDOWN flag
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
Cc: pravin <pravinraghul@zilogic.com>, LTP List <ltp@lists.linux.it>,
 "Vijay Kumar B ." <vijaykumar@zilogic.com>
Content-Type: multipart/mixed; boundary="===============2080385526=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2080385526==
Content-Type: multipart/alternative; boundary="0000000000002fd8dc05af97c30d"

--0000000000002fd8dc05af97c30d
Content-Type: text/plain; charset="UTF-8"

Hi Cyril,

On Fri, Sep 18, 2020 at 7:42 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> Li are you working on this, or should I try to finish the test?
>

Sorry for the late reply.

No, I'm working on another urgent issue so far. Feel free work out the
patch V6,
I think you can finish it better than me.

-- 
Regards,
Li Wang

--0000000000002fd8dc05af97c30d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Cyril,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Sep 18, 2020 at 7:42 PM Cyril Hrubis =
&lt;<a href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
Li are you working on this, or should I try to finish the test?<br></blockq=
uote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:sm=
all">Sorry for the late reply.</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">No, I&#39;m working on another urgent issue so far. Feel free work ou=
t the patch V6,</div><div class=3D"gmail_default" style=3D"font-size:small"=
>I think you can finish it better than me.</div></div></div><div><br></div>=
-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Reg=
ards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000002fd8dc05af97c30d--


--===============2080385526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2080385526==--

