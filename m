Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7558034A4CB
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Mar 2021 10:43:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ABEC73C7857
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Mar 2021 10:43:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id DBA053C27C9
 for <ltp@lists.linux.it>; Fri, 26 Mar 2021 10:43:18 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 51DAB600E38
 for <ltp@lists.linux.it>; Fri, 26 Mar 2021 10:43:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616751796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I8s6LH3FAhidLJNk0j67uF68SlOGX5ZwwvDez0iVYxQ=;
 b=dmF/UtLrB2Fgs4NSJbCUJrrJGm0yuiS842MxZtdoNXaoAVWE3Lqrk8gwp10AaCmdJcjDWh
 e4fdINVuBdjdxMTKTXFQXdf/S0AFFquKlVjy8SPb8dnzZLIFfw5nT2V1b6+89G0UhMYdZw
 RsnQVbjWTLAQ7XAuUd5zuHdlRvdivrw=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-Jf_pNzS6OjOuJcm0K88AeQ-1; Fri, 26 Mar 2021 05:43:13 -0400
X-MC-Unique: Jf_pNzS6OjOuJcm0K88AeQ-1
Received: by mail-yb1-f197.google.com with SMTP id 131so9446209ybp.16
 for <ltp@lists.linux.it>; Fri, 26 Mar 2021 02:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I8s6LH3FAhidLJNk0j67uF68SlOGX5ZwwvDez0iVYxQ=;
 b=ntAuhPCUqquKNZrg4RsyOuJ8AMF2kxRkwEBVdEME1DSgEGxGevF5SMQk5h+XuElIou
 WHVt5DGN/2gZaDsIiXiNBlOMByaIn7vN6klokXLrtKhew8bWrloyLPS+bX8sk6oiJhUW
 LQpeweZATneb4+feUHnLjxsmtlmU2nXbeDEiK554zyu/5Z2mMHGynoOJVCWmSAZWIHvI
 YmalNVM6QN8/FeM0m8rfi15wNHj2TvZjzH6b4zC6fyP5uiSJkAp42fZUPXwgubEfeZZI
 XlxMjUY2u3jbPc3w21RbJ4QWevoqyVVSi1yYqefw4bWES2gGehL4FRGAMU5Tqq7bnnT8
 lnQQ==
X-Gm-Message-State: AOAM530aW4OfAwjeY47MeGYdGGCnfLFaRyeeNAkNr1uAxXeW3LYVSLxv
 2ttpkLZOBSZYCdV/wHcDaX9pODSHTTYhcnwRqfNwf5o0fjji9QL+T8pxv4bgsUbRhX2AxtemApx
 b3LjWbxCn2IMWCxEbIlz3GEKQEFE=
X-Received: by 2002:a5b:787:: with SMTP id b7mr18335353ybq.243.1616751793056; 
 Fri, 26 Mar 2021 02:43:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzg02C/9i5bfOu4UCvQVmngF1ZFqHBCxUUo3jvR3CG6kw0N5dL6WEdWg7AYfyHGahvhrD4x7OJZm+Oym3mIgbA=
X-Received: by 2002:a5b:787:: with SMTP id b7mr18335340ybq.243.1616751792837; 
 Fri, 26 Mar 2021 02:43:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210326080530.11211-1-xieziyao@huawei.com>
In-Reply-To: <20210326080530.11211-1-xieziyao@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 26 Mar 2021 17:43:01 +0800
Message-ID: <CAEemH2ck0c+UAzw7-midEc0q=GS9EsBYSOo48Lwd_MF5tuJpeg@mail.gmail.com>
To: Xie Ziyao <xieziyao@huawei.com>
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
Subject: Re: [LTP] [PATCH] syscalls/clock_adjtime: fix some mistakes for
 commit 135affca95dca84bc9ce6b1e2238e6db6e6b0f56
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
Content-Type: multipart/mixed; boundary="===============0550351407=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0550351407==
Content-Type: multipart/alternative; boundary="0000000000004d6a1005be6d5cd2"

--0000000000004d6a1005be6d5cd2
Content-Type: text/plain; charset="UTF-8"

Hi Ziyao,

On Fri, Mar 26, 2021 at 4:06 PM Xie Ziyao <xieziyao@huawei.com> wrote:

> - change TTERRNO to TERRNO after the safe_macros interface is not used;
> - delete the unnecessary tst_res(TFAIL | TTERRNO, ...), which has been
>   determined in the previous logic.
>
> Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
>

As a convention, we add "Fixes: xxxxxxxxxx" here to track the commit id.

Anyway, I help to modified some format issues and pushed it, thanks!


-- 
Regards,
Li Wang

--0000000000004d6a1005be6d5cd2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Ziyao,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Mar 26, 2021 at 4:06 PM Xie Ziyao &lt=
;<a href=3D"mailto:xieziyao@huawei.com">xieziyao@huawei.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">- change TTERRNO=
 to TERRNO after the safe_macros interface is not used;<br>
- delete the unnecessary tst_res(TFAIL | TTERRNO, ...), which has been<br>
=C2=A0 determined in the previous logic.<br>
<br>
Signed-off-by: Xie Ziyao &lt;<a href=3D"mailto:xieziyao@huawei.com" target=
=3D"_blank">xieziyao@huawei.com</a>&gt;<br></blockquote><div><br></div><div=
><div class=3D"gmail_default" style=3D"font-size:small">As a convention, we=
 add &quot;Fixes: xxxxxxxxxx&quot; here to track the commit id.</div><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">Anyway, I help to modified some form=
at issues and pushed it, thanks!</div></div><div><br></div></div><div><br><=
/div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><di=
v>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000004d6a1005be6d5cd2--


--===============0550351407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0550351407==--

