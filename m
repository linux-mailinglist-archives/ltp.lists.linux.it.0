Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DAD4D4496
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Mar 2022 11:28:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CBCA23C0F41
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Mar 2022 11:28:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C9EE83C015C
 for <ltp@lists.linux.it>; Thu, 10 Mar 2022 11:28:45 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D8FBB1A011ED
 for <ltp@lists.linux.it>; Thu, 10 Mar 2022 11:28:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646908123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7UPmNYuwL5UN7p7fgdWtTIDW6fYgjEmstxbgZ+D+a9I=;
 b=jO9kejSkD3/no58STIuNGxTGPf2GSyx7LSFblxfukkrVXhJ4a1V+yfhQvuUMQG718laIEi
 kCYomVA0DrVI25Yt2BKwpUSgPGa4PXo+v8S2W6PbGcoxbtLYR02COPOhJ4r0h9LG/Vb+NE
 VW41BaismYJOioW2APNLet+JMWjZi40=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-pyzIvoD-P3OA8JizAlRbVw-1; Thu, 10 Mar 2022 05:28:42 -0500
X-MC-Unique: pyzIvoD-P3OA8JizAlRbVw-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-2d6994a6942so36850757b3.17
 for <ltp@lists.linux.it>; Thu, 10 Mar 2022 02:28:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7UPmNYuwL5UN7p7fgdWtTIDW6fYgjEmstxbgZ+D+a9I=;
 b=C6A3v8m95fx6WzGsWk5/grJFPr9zhwXgX1s9MCtp274HWiu9ieDFtUAPyQVQEmGC+4
 zNI+ZnJVRpKRih7wxpJv5v/trvNyhYvZWdgpfUuF9f3cAep9dEpdXYAkpoxG2mbK7fPG
 3tb5/bQD9ziCF8tAhgfzXAUVDmM5DYXZxuxHVgu3RXwpMlB3TohwcqWas9K7wxczpXbv
 qgPGU8hWllTbVWTNsKmQJYCzd5sbupzGJ/VPYdkxroU+NLwSWTJfVADL9/fiXdPVm8MS
 Q0/PaWg5fK9cLqanELzBL24aTY4ivinBY5UrdIab0kvVH65pkbCCUArV/uBrNBsAaUqx
 +H5Q==
X-Gm-Message-State: AOAM530tkfhC+TBMBS8Q74zqxt/54F7GoCExj9YU4+olUNnRQUVOBc/i
 ht2AJ7fMdul1IRc3wbPo6pkHADFV4bCAT8Q2Xge9GePYIzJL9EjNTzwgIwgEoW+BMgDbmPo0fzK
 ZD2OgFVMRPETTg0grbUwcHx8mGQ8=
X-Received: by 2002:a25:ad07:0:b0:628:78df:ff24 with SMTP id
 y7-20020a25ad07000000b0062878dfff24mr3266240ybi.233.1646908120697; 
 Thu, 10 Mar 2022 02:28:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQ1LQnLG12T6saRL3TI+geDIYOXF4OvlpHkhGKBe/2hqwjnfJGbqrhCL8MR7oRFJdXHn7bjKmZicdw78JEkyM=
X-Received: by 2002:a25:ad07:0:b0:628:78df:ff24 with SMTP id
 y7-20020a25ad07000000b0062878dfff24mr3266233ybi.233.1646908120513; Thu, 10
 Mar 2022 02:28:40 -0800 (PST)
MIME-Version: 1.0
References: <20220310092227.15854-1-liwang@redhat.com>
 <6229CE8F.6080100@fujitsu.com>
In-Reply-To: <6229CE8F.6080100@fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 10 Mar 2022 18:28:23 +0800
Message-ID: <CAEemH2eS2EarSCKTvSE4GnZrFqPcDAapu-PWXzJimjP_1KjSvg@mail.gmail.com>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib: use braces instead of NULL for struct arrary
 ending
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0296623001=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0296623001==
Content-Type: multipart/alternative; boundary="000000000000805f5105d9daadd0"

--000000000000805f5105d9daadd0
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 10, 2022 at 6:09 PM xuyang2018.jy@fujitsu.com <
xuyang2018.jy@fujitsu.com> wrote:

> Hi Li
>
> Looks good to me,
> Reviewed-by: Yang Xu <xuyang2018.jy@fujitsu.com>
>

Merged, thanks!


-- 
Regards,
Li Wang

--000000000000805f5105d9daadd0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Mar 10, 2022 at 6:09 PM <a href=3D"mailto:x=
uyang2018.jy@fujitsu.com">xuyang2018.jy@fujitsu.com</a> &lt;<a href=3D"mail=
to:xuyang2018.jy@fujitsu.com">xuyang2018.jy@fujitsu.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Li<br>
<br>
Looks good to me,<br>
Reviewed-by: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@fujitsu.com" targe=
t=3D"_blank">xuyang2018.jy@fujitsu.com</a>&gt;<br>
</blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-size=
:small">Merged, thanks!</div></div><br clear=3D"all"><div><br></div>-- <br>=
<div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<b=
r></div><div>Li Wang<br></div></div></div></div>

--000000000000805f5105d9daadd0--


--===============0296623001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0296623001==--

