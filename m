Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 622172554A3
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 08:44:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1E8C03C2E4A
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 08:44:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id BF8AF3C1CDD
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 08:44:16 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id E26161A008B2
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 08:44:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598597054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qEdCIQ1iU8QvdCiBOw9nXmWNPXlLhCtTshWRBJQCBrg=;
 b=Cz+JzldaJOy9tXi5cAlPyIvYbOWlYB+7nmlqqvn6ta9LiVgV9EVkPcd6M4kSVQQF+fSUSb
 fHSTaB+UGoPbTJWoZmB6GNA6RsF272Zasf86nV2FAZHVN4C8HQbnLJtmD6MDeVjePKz71+
 NDKnaRfKUZg8FR+FXxCapnrtx/1DNrg=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-Y9GUSygHOUeNjh66vJ82ZQ-1; Fri, 28 Aug 2020 02:44:10 -0400
X-MC-Unique: Y9GUSygHOUeNjh66vJ82ZQ-1
Received: by mail-yb1-f200.google.com with SMTP id e1so323797ybk.14
 for <ltp@lists.linux.it>; Thu, 27 Aug 2020 23:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qEdCIQ1iU8QvdCiBOw9nXmWNPXlLhCtTshWRBJQCBrg=;
 b=dXT6E6eqCXd2DDTVLX6SIBY1JYRHOX9uXWU7ldV3bfIWYFhTvqtiPFMgnLeRYXtBjz
 TeCBd1kWgdm6NOz+XfXLXuxpxmleGc5KEhXTX/5jCzKgHwb8z9DWHKbcnUrLT9Y6u/jB
 6V1ywxiDgZiQbau6g9OtS486vdEFEfUpi8TB8TmZAit99FvauEyFyTKPKCaLil3PIMla
 Ynjau8tR1u+ereeW6x4qlGOFHhMPKuvTq23UD/S503picMP7fFb7iXTIJbvy/nMrZGCZ
 0pIHvVBj7iT+DB6XPhZtz/PLWUh2gxrev6LoVAR6P+zO6/B/YstYYk/iVmDf9REPUewT
 N0JA==
X-Gm-Message-State: AOAM530fq3ilt69yFuM/olLmZLoSFdKNfJhB8QpNfueazshX16r2osUd
 u/rbfqSgh78+6az1httJKoINddTY+IfSU+ezg0TqYQQrwdwAnv2CERQI7eSYvbZyln0gpUfz1GR
 +iXG5vb4rYDkzv4eLFsCqRxcjdjA=
X-Received: by 2002:a25:ca41:: with SMTP id a62mr510610ybg.252.1598597049922; 
 Thu, 27 Aug 2020 23:44:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjHBYpmAxcl5PGkU2Ezkum/ACqgetCg1mGgCaiGWl0MjaHTPfmpqQ2Z4f/843tetUsg5u9RaWb+yTEcitLkU4=
X-Received: by 2002:a25:ca41:: with SMTP id a62mr510591ybg.252.1598597049760; 
 Thu, 27 Aug 2020 23:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200825064706.GA7135@x230>
 <1598339667-24948-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2eS0PS=hmpiWBzkfBQ3cO4K2u2bVgcO5ZK4fz9N+xg7uQ@mail.gmail.com>
 <716a3ffc-fa20-01df-a63f-86a5a50239af@cn.fujitsu.com>
 <CAEemH2faKH1xUAx7GAS_01UYwZfya3AbJj12fqzOoZ6=OTJZrQ@mail.gmail.com>
In-Reply-To: <CAEemH2faKH1xUAx7GAS_01UYwZfya3AbJj12fqzOoZ6=OTJZrQ@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 28 Aug 2020 14:43:57 +0800
Message-ID: <CAEemH2dvu8+GOfd2EHVFuL=KNCQdQyO3xTKz3OXtLqOL_u+7kQ@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] travis: Use centos:7 instead of centos:6
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
Content-Type: multipart/mixed; boundary="===============1599389088=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1599389088==
Content-Type: multipart/alternative; boundary="0000000000004a58ff05adea615a"

--0000000000004a58ff05adea615a
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 28, 2020 at 2:40 PM Li Wang <liwang@redhat.com> wrote:

> Hi Xu,
>
> Sorry for the delay. I guess many Developers(European or North
> America) are busy with the LPC(Linux Plumbers Conference) recently. please
> keep patience:).
>
> Btw, there is a new build error on CentOS7(seems unrelated to your patch):
>
>   /usr/src/ltp/lib/tst_af_alg.c:205:21: error: 'ALG_SET_AEAD_ASSOCLEN'
> undeclared (first use in this function)
>   2084 cmsg->cmsg_type = ALG_SET_AEAD_ASSOCLEN;
>

Ah, seems you have sent a patch for that, I will help to review soon.
http://lists.linux.it/pipermail/ltp/2020-August/018651.html

-- 
Regards,
Li Wang

--0000000000004a58ff05adea615a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Aug 28, 2020 at 2:40 PM Li Wang &lt;<a href=
=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D=
"ltr"><div style=3D"font-size:small">Hi Xu,</div><div style=3D"font-size:sm=
all"><br></div><div>Sorry=C2=A0for the delay. I guess many Developers(Europ=
ean or North America)=C2=A0are busy with the LPC(Linux Plumbers Conference)=
 recently. please keep=C2=A0patience:).</div><div style=3D"font-size:small"=
><br></div><div style=3D"font-size:small">Btw, there is a new build error o=
n CentOS7(seems unrelated to your patch):</div><div style=3D"font-size:smal=
l"><br></div><span class=3D"gmail_default" style=3D"font-size:small">=C2=A0=
 </span>/<span class=3D"gmail_default" style=3D"font-size:small"></span><sp=
an class=3D"gmail_default" style=3D"font-size:small"></span>usr/src/ltp/lib=
/tst_af_alg.c:205:21: error: &#39;ALG_SET_AEAD_ASSOCLEN&#39; undeclared (fi=
rst use in this function)<br><span class=3D"gmail_default" style=3D"font-si=
ze:small">=C2=A0 </span>2084 cmsg-&gt;cmsg_type =3D ALG_SET_AEAD_ASSOCLEN;<=
/div></div></blockquote><div><br></div><div><div class=3D"gmail_default" st=
yle=3D"font-size:small">Ah, seems you have sent a patch for that, I will he=
lp to=C2=A0review soon.</div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><a href=3D"http://lists.linux.it/pipermail/ltp/2020-August/018651.=
html">http://lists.linux.it/pipermail/ltp/2020-August/018651.html</a></div>=
</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature=
"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div=
></div>

--0000000000004a58ff05adea615a--


--===============1599389088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1599389088==--

