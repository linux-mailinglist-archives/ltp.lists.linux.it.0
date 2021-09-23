Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDC84159FF
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Sep 2021 10:23:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 07DC23C8F5C
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Sep 2021 10:23:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3F3E83C79C0
 for <ltp@lists.linux.it>; Thu, 23 Sep 2021 10:23:27 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id AB8C71400537
 for <ltp@lists.linux.it>; Thu, 23 Sep 2021 10:23:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632385405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LCJ1ucgEb8mGtcE6wna65r7eYodxkoaJyqDAapAhXx4=;
 b=g23MaUP4i5TNTvf4k+xNYJUZjpfbbqOFDLyRHXuBI/3FYotbGGkmTBAfQEQl4xV4XqQhg0
 4oaUtb25g39iOaukWsZWkllQrrDPIQkAxkRDqhrILUeKtjw5sKstat7bYuDLU8xSKL8pN6
 ZAnzPvimbFPKaSBPuE6DINQ4QXa0h1c=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38--bBk9OBDM6Kzc9CuqczURA-1; Thu, 23 Sep 2021 04:23:23 -0400
X-MC-Unique: -bBk9OBDM6Kzc9CuqczURA-1
Received: by mail-qt1-f197.google.com with SMTP id
 o6-20020a05622a008600b002a6c2fbc853so2766774qtw.16
 for <ltp@lists.linux.it>; Thu, 23 Sep 2021 01:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LCJ1ucgEb8mGtcE6wna65r7eYodxkoaJyqDAapAhXx4=;
 b=k5Bh7yt4bOblJgrU6AM2dsv92XRb6eWEonM8HS+Aj/93E/BpyMx6ufifXmIv34Qk9v
 g45aEecC6WPmB/pdbc+jtxnkhhkm/oGgSuLPEC+flFvWlquizMPv6fXgnbe0+Ubdx+mI
 7DrWRh2I4jA5YqY7lpy+7diDdJNA46jTZ60XDn0T2m9SNaWhEMXUunC10u4mgEd4aEuK
 /pJa/Q5O2EPUeeFzdUo7lMGhMSWBque6hbDXOWgyjZZqUqv7bpJKjiwz2kNGJgBvPGsK
 a6iNBeXbrjcc8/VqTVWX5qAa9n7Pv81jpcJV4Qa2TqsyGXeXztweUKlXjAQlVfYgL1uJ
 LIyw==
X-Gm-Message-State: AOAM533jdipr39B9kErIHcCfN+RLsz77e1LFahDocienklabIPXxK1Yn
 wJjOMUyp/JC3MIgLtVySzesbyEP8k+cv6Dw4euaXHLR9JtI12PWmnxzsfYj9ezlbod0m6FQtv7k
 YStD5jjkbem6rnLULMB44Vzb86RQ=
X-Received: by 2002:a25:2f48:: with SMTP id v69mr4168970ybv.339.1632385403470; 
 Thu, 23 Sep 2021 01:23:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJEj8frDnagjZHyAAeH0gFiucxSaqccT6uw4LwoYdLCdqkqxBLntM18kpK1TYJe1qgHAoOfpL4pT7CwZntMYw=
X-Received: by 2002:a25:2f48:: with SMTP id v69mr4168937ybv.339.1632385403109; 
 Thu, 23 Sep 2021 01:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210920221212.8478-1-zhaogongyi@huawei.com>
In-Reply-To: <20210920221212.8478-1-zhaogongyi@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 23 Sep 2021 16:23:11 +0800
Message-ID: <CAEemH2e+_kfVatbd8X0zLx2GW+k2Ds4nCNSD2Re3mKX-F6GzbQ@mail.gmail.com>
To: Zhao Gongyi <zhaogongyi@huawei.com>
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
Subject: Re: [LTP] [PATCH v2] open_posix: Add failure handling of fork()
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
Content-Type: multipart/mixed; boundary="===============0344740330=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0344740330==
Content-Type: multipart/alternative; boundary="00000000000016deba05cca55812"

--00000000000016deba05cca55812
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 23, 2021 at 3:42 PM Zhao Gongyi <zhaogongyi@huawei.com> wrote:

> When fork() failed and transfer the return value(-1) to kill(),
> it would freeze the system, so it is very serious in this
> cases and should be avoided.
>
> Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
>

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--00000000000016deba05cca55812
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Sep 23, 2021 at 3:42 PM Zhao Gongyi &lt;<a =
href=3D"mailto:zhaogongyi@huawei.com">zhaogongyi@huawei.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">When fork() fail=
ed and transfer the return value(-1) to kill(),<br>
it would freeze the system, so it is very serious in this<br>
cases and should be avoided.<br>
<br>
Signed-off-by: Zhao Gongyi &lt;<a href=3D"mailto:zhaogongyi@huawei.com" tar=
get=3D"_blank">zhaogongyi@huawei.com</a>&gt;<br></blockquote><div>=C2=A0</d=
iv><div><span class=3D"gmail_default" style=3D"font-size:small">Reviewed-by=
: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt=
;</span></div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></d=
iv></div></div>

--00000000000016deba05cca55812--


--===============0344740330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0344740330==--

