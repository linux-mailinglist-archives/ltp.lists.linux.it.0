Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C91953FC82C
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 15:25:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6582F3C9A50
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 15:25:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 149323C2A75
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 15:25:12 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0BCBA6001F9
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 15:25:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630416310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=plS07h5RkTNE2QgmbgWwKMjq2TTunqpTTMLSq0Dyvko=;
 b=VOTvQLj5P4EDKljHZhoVr/3aK1tp04U/klAsUGDJ6IsDxXpyFDqNEYzxw99XZEqakzTCD8
 dHRyhiMePaIFHk/dAuqZcVKN24c8UxCLzVjjy+gtDsYZmX5PR+VZbbhzwTnNtsBovA8iG/
 I6W0DiXWusajisVGETUfzN5/EF1+tuA=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-Ln6Hz7JaOKKIULFGCTz1cw-1; Tue, 31 Aug 2021 09:25:08 -0400
X-MC-Unique: Ln6Hz7JaOKKIULFGCTz1cw-1
Received: by mail-yb1-f199.google.com with SMTP id
 z15-20020a25868f000000b0059c56f47e94so1161031ybk.21
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 06:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=plS07h5RkTNE2QgmbgWwKMjq2TTunqpTTMLSq0Dyvko=;
 b=s6rdiHoGCmlDBsoA+lUq+/tztcpawxgsWoSPBX7Bq1G+TB/eyoryvA2bc1SNztiyEu
 0Ydj/h1I0GXxJ7meIzgd7PQ5pt6zy4nbKlORZGVy6QSrCxKVinUQz2qzMXi8BtmaKtnu
 LTuuHjdDsapnS//NL9UEoXHTgvsh++lk4FYSXxjdeWrdGGtK3oX3GbvzTaJRh8D2wGEV
 I6vOyHb/RV69p/4p+0sAlO0tLOCAPqau7jsiWi3D5biKxeFGkjzUki/9LZ7xLklNvqaH
 RYm/y1/jUo8jLc+ov7Qukrj451MlB7rfF7HfawVZ/bqEa12Gk9vKSAO7QI/6AVgsHImn
 OZiQ==
X-Gm-Message-State: AOAM5309WQOQygOo0lS9NKp6Acamelg2ilDUDp2Yq/Vg16VuVquQZmys
 5CU1kTTtB1SaEMAU1Aq3XTZTYJFMCbSwnHbQ6cJKNz5QdgKi3nA0+FpF95QWUN1qF6XCD8ITh0v
 Uqy2CmyQbzBCPAE4vaN2M59T+hRo=
X-Received: by 2002:a25:b9cf:: with SMTP id y15mr13583457ybj.110.1630416308435; 
 Tue, 31 Aug 2021 06:25:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRzndhrCAoX5czpJST4IGrifrtFZHgqEQ3clfEyQNdI2Vz1+SrxCdtb9ywNf3alK6UGg1Kyig0/IwmjpwhEGY=
X-Received: by 2002:a25:b9cf:: with SMTP id y15mr13583431ybj.110.1630416308230; 
 Tue, 31 Aug 2021 06:25:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210831090002.1431298-1-lkml@jv-coder.de>
 <87eeaakm4y.fsf@suse.de>
 <2278cad7-66ab-d014-ca2b-ab3081f1284d@jv-coder.de>
In-Reply-To: <2278cad7-66ab-d014-ca2b-ab3081f1284d@jv-coder.de>
From: Li Wang <liwang@redhat.com>
Date: Tue, 31 Aug 2021 21:24:51 +0800
Message-ID: <CAEemH2cSKUz63b_607Zs0_5q3RNb5-muh_jQa+2EBbTBEHsVww@mail.gmail.com>
To: Joerg Vehlow <lkml@jv-coder.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] cfs_bandwidth01: Fix cleanup on failure in
 set_cpu_quota
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
Cc: LTP List <ltp@lists.linux.it>, Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: multipart/mixed; boundary="===============1127905963=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1127905963==
Content-Type: multipart/alternative; boundary="000000000000e371e105cadae07e"

--000000000000e371e105cadae07e
Content-Type: text/plain; charset="UTF-8"

Hi Joerg, Richard,



> >> -static struct tst_cgroup_group *
> >> -mk_cpu_cgroup(const struct tst_cgroup_group *const cg_parent,
> >> +static void mk_cpu_cgroup(struct tst_cgroup_group **cg,
> >> +          const struct tst_cgroup_group *const cg_parent,
> > Seems like there are spaces instead of a tab at the start.
>


> Right, I wanted to keep the same format you had, but did not realize it
> was one tab and 5 spaces instead of 9 spaces.
> I guess this can be fixed during merging.
>

I fixed that and pushed those patches. Thanks!

-- 
Regards,
Li Wang

--000000000000e371e105cadae07e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Joerg, Richard,</div></div><br><div class=3D"gmail_quote">=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;&gt; -static struct tst_cgroup_group *<br>
&gt;&gt; -mk_cpu_cgroup(const struct tst_cgroup_group *const cg_parent,<br>
&gt;&gt; +static void mk_cpu_cgroup(struct tst_cgroup_group **cg,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct tst_cgroup_group =
*const cg_parent,<br>
&gt; Seems like there are spaces instead of a tab at the start.<br></blockq=
uote><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Right, I wanted to keep the same format you had, but did not realize it <br=
>
was one tab and 5 spaces instead of 9 spaces.<br>
I guess this can be fixed during merging.<br></blockquote><div><br></div><d=
iv><div class=3D"gmail_default" style=3D"font-size:small">I fixed that and =
pushed those patches. Thanks!</div></div><div>=C2=A0</div></div>-- <br><div=
 dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></=
div><div>Li Wang<br></div></div></div></div>

--000000000000e371e105cadae07e--


--===============1127905963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1127905963==--

