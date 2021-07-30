Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 296C83DB7F9
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jul 2021 13:43:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9F1793C6250
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jul 2021 13:43:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4F6743C232D
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 13:43:49 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 817416006CE
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 13:43:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627645426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lKmCPCx35g0KvAbWwyfZl5fB6jOx2TUsRMuC0d4upjo=;
 b=OISIzQQ97OPwR8XqOa+71xRL+RtTRghLmviPwC8yEr+atgk9es1gd5Dx6bbczUJr1jDrz+
 FzW09Ol+1Itn3zlGfJRxfsmTqVjAbnntbM4DpOD7WB9F/+R/HbQbEE+wxKxy04xpS+nxMU
 yjgD5GNYmu83FhoC6q5hdsZ9fsidJBI=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-LOizF1GqN-G6YcjKvzqg4w-1; Fri, 30 Jul 2021 07:43:44 -0400
X-MC-Unique: LOizF1GqN-G6YcjKvzqg4w-1
Received: by mail-yb1-f198.google.com with SMTP id
 e145-20020a2550970000b029056eb288352cso10096319ybb.2
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 04:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lKmCPCx35g0KvAbWwyfZl5fB6jOx2TUsRMuC0d4upjo=;
 b=p1w+jLBfOHgUjEMMK2OpeFAwYm4Vh6PlK1mCtVyC7wpOir9MAxnlJckVJ4PBqUYK70
 NUVPSNF9F2LJT+VHHGqLKTjM3fDN6qjiHvxiB2cXVFr2IjS5lMTiaoauV2rT6Mg3SyMn
 irUd/wNokKoHbaBZ91bUuuWiv84HFfC7LI6x9sStrZIqm5P35cBm26ozHhezL3DF+M1l
 lHZogRpIieEj7w6RJaAVDsYFl52mcag8cyX55ugph+emVAao3yb2Wym4o/9BZjL3Wd/o
 HpjpfwZBT4yMrNgZ79XDG96i/Sk9pq1MFqK1IXd7zgtICqxkl8yf5LyAIb9uZWhrOg+9
 pqvw==
X-Gm-Message-State: AOAM530U0ouE9YSqrMJP0YIYraDLxwZoUQuxl+UDSL2uBZuxwWQnle5L
 zCd7xS9uHVXaabZ2BSKVPHZ73faUv4TTzRP38uH/ZUXFOTIEiUeECi0Ly0YJadCiK6aToBkqoBC
 NcINaak+bXJF8chQbXwYbN67kKVE=
X-Received: by 2002:a25:38c6:: with SMTP id f189mr2507959yba.110.1627645423919; 
 Fri, 30 Jul 2021 04:43:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxCyOPwz2bw5FkAGjrrYAt9kRLWRk6HAe7W3hKWymBhY1EPkH3A9mAAHn51sffzf1LYKNkKQSMQEKhDgKdFrY=
X-Received: by 2002:a25:38c6:: with SMTP id f189mr2507947yba.110.1627645423737; 
 Fri, 30 Jul 2021 04:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210720101249.10118-1-aleksei.kodanev@bell-sw.com>
 <YQPCcew5Are2VrDh@yuki> <0c978fd5-9772-ad4e-c14e-c8b4a8344506@jv-coder.de>
 <CAEemH2d8sHSWCAst9-q6KiKfJTSULYS8-KivWHrS04mR6ZXjzQ@mail.gmail.com>
 <668aa923-dda1-b3ce-8f5e-042e3a2174f5@jv-coder.de>
In-Reply-To: <668aa923-dda1-b3ce-8f5e-042e3a2174f5@jv-coder.de>
From: Li Wang <liwang@redhat.com>
Date: Fri, 30 Jul 2021 19:43:32 +0800
Message-ID: <CAEemH2etw1W0dBzHG+X+1EA4qsKr95DuqOHeWqEv=N0Bo2T2QQ@mail.gmail.com>
To: Joerg Vehlow <lkml@jv-coder.de>
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
Subject: Re: [LTP] [PATCH v2] crypto/af_alg02: thread termination fixes
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
Content-Type: multipart/mixed; boundary="===============0443075679=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0443075679==
Content-Type: multipart/alternative; boundary="0000000000004d756b05c855bb91"

--0000000000004d756b05c855bb91
Content-Type: text/plain; charset="UTF-8"

Hi Joerg,

> > That should work but no precise log to indicate where goes wrong,
> > so I vote to go the loop way:).
> Does it really matter? The being stuck in the read does not seem to be
> the failure case tested with this test. Otherwise it would TFAIL.
> Additionally the loop and "custom" timeout was only introduced at a
> later stage of the test. Initially it relied on the default timeout
> handling.
>

It's doesn't matter actually.


> If my assumption, that being stuck in the read is not the failure case
> of this test, then your argument is invalid. Your argument would work for
> each and every line of code, that might be executed, when the timeout hits.
>

Yes right, but I was not arguing for that.
I just provide more opinions for Alexey to make a final decision:).

-- 
Regards,
Li Wang

--0000000000004d756b05c855bb91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div class=3D"gmail_default" st=
yle=3D"font-size:small">Hi Joerg,</div><div class=3D"gmail_default" style=
=3D"font-size:small"></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
&gt; That should work but no precise log to indicate where goes wrong,<br>
&gt; so I vote to go the loop way:).<br>
Does it really matter? The being stuck in the read does not seem to be <br>
the failure case tested with this test. Otherwise it would TFAIL.<br>
Additionally the loop and &quot;custom&quot; timeout was only introduced at=
 a <br>
later stage of the test. Initially it relied on the default timeout <br>
handling.<br></blockquote><div><br></div><div><div class=3D"gmail_default" =
style=3D"font-size:small">It&#39;s doesn&#39;t matter actually.</div></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
If my assumption, that being stuck in the read is not the failure case <br>
of this test, then your argument is invalid. Your argument would work for<b=
r>
each and every line of code, that might be executed, when the timeout hits.=
<br></blockquote><div><br></div></div><div class=3D"gmail_default" style=3D=
"font-size:small">Yes right, but I was not arguing for that.</div><div clas=
s=3D"gmail_default" style=3D"font-size:small">I just provide more opinions =
for Alexey to make a final decision:).</div><div><br></div>-- <br><div dir=
=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></di=
v></div></div>

--0000000000004d756b05c855bb91--


--===============0443075679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0443075679==--

