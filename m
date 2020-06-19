Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8501200084
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 05:07:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5E9D53C2CA1
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 05:07:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 796513C1419
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 05:07:37 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 49AF9601075
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 05:07:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592536055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2tGGXJj0JqrwAnWL50XKgXLT5Ngu8h/uaTmhGormE5I=;
 b=XHo8LYHR/y1dTlSULSLjosR3bLihYCaYNlCdzx83lv+/upKHSaB2bNu19/Xehx4M7KiglI
 vI8F6WDMX488K4K6G9WF4IF1KveLgqlJhTNx3PQu+7+lJKhbHuMJZqtxCbKFF/qz/qkS2i
 5O6eQ8/8rhM1fCrS7sB2R9mLnxpLlVg=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-dbpC8WpwM6-Go8c0qQbqqQ-1; Thu, 18 Jun 2020 23:07:32 -0400
X-MC-Unique: dbpC8WpwM6-Go8c0qQbqqQ-1
Received: by mail-lf1-f71.google.com with SMTP id y133so2792699lff.20
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 20:07:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2tGGXJj0JqrwAnWL50XKgXLT5Ngu8h/uaTmhGormE5I=;
 b=XtSAcjUj/ATbJ8JuZaK5EVcwXzGb8eSmSQ6eSCI0Cw/qlRUZC69js03jXTk3aEf2tX
 BWspOgSeDbljx4UdfZequFH4VgMtcVYlv6YDAM6QM+P/40RvAIyJA2Nmv8JOxqU4YGiw
 6SW3VZ42RB5ORkYLm7OqGXVgN2Y24yI4wXrzuNNjZ+/3suYu4KZSh2MRXdQMNDL4p4yh
 LiHkCC0yXmrBs1RTKpa5MqHjm2lP/yf3p2gyfLsZUTUwKDd+h/0D6wEg1GOPrwy5lgNn
 J4ZUxMkbg58tXFiWuQRVRS2wYS++CqaOY6n3z4GB2d1YLZWqoOfoEGQu1v1OPJOsCUJl
 HsOw==
X-Gm-Message-State: AOAM533NCVC8mmoECw/77kjAvMkjy5rqW7WmdZDxun3rha1Tq4oSwX33
 TzZsQ1NzgyBJJUj0adAUWz9s3zfsrZWjBd8ShmIrIQHnPuXV6aZ/S4+sjwMECvfdubN5FURbdvg
 EfmHHbpncAetEJgjxVyd+J668M9U=
X-Received: by 2002:a2e:9b8c:: with SMTP id z12mr665108lji.257.1592536050718; 
 Thu, 18 Jun 2020 20:07:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJze38oP4B3qYwFxQuQhlPLaogH5lguW+w0YhzHwXOQV6Rr6BufCGg5wg2myfpqQ9yEskKJd0dBDxNJICcHVdEM=
X-Received: by 2002:a2e:9b8c:: with SMTP id z12mr665103lji.257.1592536050502; 
 Thu, 18 Jun 2020 20:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200609095102.21153-1-liwang@redhat.com>
 <1111554317.15300411.1591699362992.JavaMail.zimbra@redhat.com>
 <CAEemH2fkUX2KA+dPqgjqrBftxAZ722k9B7i3fi8eSxEmzSLk6w@mail.gmail.com>
In-Reply-To: <CAEemH2fkUX2KA+dPqgjqrBftxAZ722k9B7i3fi8eSxEmzSLk6w@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 19 Jun 2020 11:07:18 +0800
Message-ID: <CAEemH2e+BE4=jikyu92CNarVGefd9piwDdWxSzwua3rWj6_dkQ@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/4] lib: add new cgroup test API
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
Content-Type: multipart/mixed; boundary="===============0562303283=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0562303283==
Content-Type: multipart/alternative; boundary="0000000000009523a705a8673192"

--0000000000009523a705a8673192
Content-Type: text/plain; charset="UTF-8"

I have pushed the patchset with the following changes:

1. use SAFE_MALLOC to replace SAFE_MMAP
2. set 1 to cgroup.clone_children before creating dir
3. add more code comments in tst_cgroup.h

Let's see how things going on with these new APIs using in next.

-- 
Regards,
Li Wang

--0000000000009523a705a8673192
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">I have pushed the patchset with the following changes:</div><=
div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">1. use SAFE_MALLOC to replace =
SAFE_MMAP</div><div class=3D"gmail_default" style=3D"font-size:small">2. se=
t 1 to cgroup.clone_children before creating dir</div><div class=3D"gmail_d=
efault" style=3D"font-size:small">3. add more code comments in tst_cgroup.h=
</div></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
"><br></div><div dir=3D"ltr" class=3D"gmail_attr"><div class=3D"gmail_defau=
lt" style=3D"font-size:small">Let&#39;s see how things going on with these =
new APIs using in next.</div></div><div dir=3D"ltr" class=3D"gmail_attr"><b=
r></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D=
"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000009523a705a8673192--


--===============0562303283==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0562303283==--

