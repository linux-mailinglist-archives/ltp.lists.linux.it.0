Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 198143DA0CF
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jul 2021 12:05:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9CE9D3C6339
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jul 2021 12:05:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6ECAE3C2B15
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 12:05:43 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id AF7C2600F78
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 12:05:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627553141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vf33SUupf6v/OEH2ird2KcuNvUMyaSyQK1tZA/6WyAk=;
 b=K0/a4DDf2hp21MTk3x7l7VtzLoHd8VB2+c02zHLY7hy1ejCfY8SJJHq9V7Xb/4GOA5ns60
 VzL/sOPotlxmCLoPNz8LsPhhs9DcaY3kgoyPVUvxiS+ChYGQVmQZtW5JvNPp/SnNwZ/gdy
 ENJrCiIhks8+JAWSlAamrq0ZASv4LPY=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-VyErcSM6NFKTcraqqx_DgA-1; Thu, 29 Jul 2021 06:05:39 -0400
X-MC-Unique: VyErcSM6NFKTcraqqx_DgA-1
Received: by mail-oo1-f70.google.com with SMTP id
 u64-20020a4a21430000b029026aefcb0601so2339183oou.10
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 03:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vf33SUupf6v/OEH2ird2KcuNvUMyaSyQK1tZA/6WyAk=;
 b=ZRFStVX/9aBIDJvFZF7WRQyVHh+qBcx+c98mnUlQUmWDD0I8WQcm1tsYbnvlUP0uFY
 NLSeENgF1Rbi9K80sqjOMmZY9ziRyq2bkpqs1ez+dasHR1H5qLFtIqoA4ngmTvazWZyi
 4VwFBoM4PdtsHNHLL5OfSKixb9awV1dPEpe0S7WbSJtTGsyPQrRDVyTLZSH8HGruNY0u
 1jM39cctPNrcRegVoETqmnykzsoAsjgB19Y6DsphtY/pJKBcupuAQ74cIM+a827GiMg7
 o2fZ1evE9Jtw2ioSpUgFssDLUAk5g4J3a1zcz9I9PqzILl5ZjMU2pi3Uh3TP1hLLfPZ2
 bFsg==
X-Gm-Message-State: AOAM5320GnoWQA0oxZ/XznmFbQIXklxhHvhSbatmEVd5d6iErFp6teFJ
 LFoUmOp91ek1nvCuCJWvatfp63pyMlHOtXNqxe5O3u8sWZjP2Xz4p3DwgmSvDXLrQVQAOVz3iMh
 cYHIOUVqH04RhZoBaMGzyTzd0y4s=
X-Received: by 2002:a54:4107:: with SMTP id l7mr9286733oic.66.1627553138945;
 Thu, 29 Jul 2021 03:05:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+ppBVihN/Um4r7BR6FjFZEWMwll5fb9qNMkMW9R2HrJnd2LchlBc0Et0qBsjzQTEt0SxKcjHG9s5dSyPLxRw=
X-Received: by 2002:a54:4107:: with SMTP id l7mr9286722oic.66.1627553138815;
 Thu, 29 Jul 2021 03:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <3d693985aafc13fba1cd7c4fa807bbbddd015c7b.1627303875.git.jstancek@redhat.com>
 <CAEemH2fR-2pF5WpvgEQrNRVHJKYekXPwe72_KmQy4Bvh+NRs6Q@mail.gmail.com>
 <CAASaF6yiAv=cw8OFAVoT9VHnbyrSapcphpuH85N-vDBpBMNY6Q@mail.gmail.com>
 <CAEemH2eqkQK+JYoawHK3s68oez26HmJtMJau1GvWm7a4-j26bw@mail.gmail.com>
In-Reply-To: <CAEemH2eqkQK+JYoawHK3s68oez26HmJtMJau1GvWm7a4-j26bw@mail.gmail.com>
From: Jan Stancek <jstancek@redhat.com>
Date: Thu, 29 Jul 2021 12:05:23 +0200
Message-ID: <CAASaF6xu=fraEQrfsPAqZQqxRUugf0Uvmztp=C=0gKr=Lb5LWA@mail.gmail.com>
To: Li Wang <liwang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] mbind01: accept MPOL_LOCAL when passing empty set
 for MPOL_PREFERRED
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
Content-Type: multipart/mixed; boundary="===============0301999297=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0301999297==
Content-Type: multipart/alternative; boundary="000000000000b147db05c8403e61"

--000000000000b147db05c8403e61
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 29, 2021 at 10:52 AM Li Wang <liwang@redhat.com> wrote:

>
>
> On Thu, Jul 29, 2021 at 4:33 PM Jan Stancek <jstancek@redhat.com> wrote:
>
>>
>>
>> On Thu, Jul 29, 2021 at 9:27 AM Li Wang <liwang@redhat.com> wrote:
>>
>>>
>>>
>>> On Mon, Jul 26, 2021 at 8:53 PM Jan Stancek <jstancek@redhat.com> wrote:
>>>
>>>> When empty set is passed to MPOL_PREFERRED, memory is allocated
>>>> on the node of the CPU that triggered the allocation.
>>>>
>>>> After kernel commit:
>>>>   7858d7bca7fb ("mm/mempolicy: don't handle MPOL_LOCAL like a fake
>>>> MPOL_PREFERRED policy")
>>>> kernel returns stored policy as MPOL_LOCAL.
>>>>
>>>
>>> As the MPOL_LOCAL has been setup as a real policy, I'm wondering should
>>> we
>>> add more tests for it in the next? e.g.
>>>
>>
>> Right, but we also need something in setup to avoid running it
>> for kernels that don't support MPOL_LOCAL.
>>
>
> +1 we can achieve that in a separate patch.
>
> I'm also planning to add one more function which named mbind_policy_name()
> in the mbind.h to help make the log more readable, just like what we did
> in:
>    static inline const char *mbind_flag_name(unsigned flag)
>
> And yes, we can do that separately.
>
>
>> You're right that parameters in tst_res message appear to be in wrong
>> order.
>>
>
> Feel free to fix it while merging this patch.
>

Pushed with fix for tst_res parameters.



>
> --
> Regards,
> Li Wang
>

--000000000000b147db05c8403e61
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace"><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Jul 29, 2021 at 10:52 AM Li Wang &lt;=
<a href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div=
 dir=3D"ltr"><div style=3D"font-size:small"><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 29, 2021=
 at 4:33 PM Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" target=
=3D"_blank">jstancek@redhat.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div sty=
le=3D"font-family:monospace"><br></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 29, 2021 at 9:27 AM Li W=
ang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@redha=
t.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small"><br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Mon, Jul 26, 2021 at 8:53 PM Jan Stancek &lt;<a href=3D"mailto:jsta=
ncek@redhat.com" target=3D"_blank">jstancek@redhat.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">When empty set is pas=
sed to MPOL_PREFERRED, memory is allocated<br>
on the node of the CPU that triggered the allocation.<br>
<br>
After kernel commit:<br>
=C2=A0 7858d7bca7fb (&quot;mm/mempolicy: don&#39;t handle MPOL_LOCAL like a=
 fake MPOL_PREFERRED policy&quot;)<br>
kernel returns stored policy as MPOL_LOCAL.<br></blockquote><div><br></div>=
<div><div style=3D"font-size:small">As the MPOL_LOCAL has been setup as a r=
eal policy, I&#39;m wondering should we</div><div style=3D"font-size:small"=
>add more tests for it in the next? e.g.</div></div></div></div></blockquot=
e><div><br></div><div><div style=3D"font-family:monospace">Right, but we al=
so need something in setup to avoid running it</div><div style=3D"font-fami=
ly:monospace">for kernels that don&#39;t support=20
MPOL_LOCAL.</div></div></div></div></blockquote><div>=C2=A0</div><div><span=
 class=3D"gmail_default" style=3D"font-size:small">+1 we can achieve that i=
n a separate patch.</span>=C2=A0</div><div><br></div><div><div style=3D"fon=
t-size:small">I&#39;m also planning to add one more function which named mb=
ind_policy_name()</div><div style=3D"font-size:small">in the mbind.h to hel=
p make the log more readable, just like what we did in:</div><div style=3D"=
font-size:small">=C2=A0 =C2=A0static inline const char *mbind_flag_name(uns=
igned flag)</div><div style=3D"font-size:small"><br></div><div style=3D"fon=
t-size:small">And yes, we can do that separately.</div><div style=3D"font-s=
ize:small"></div></div><div><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><div style=3D=
"font-family:monospace"><br></div><div style=3D"font-family:monospace">You&=
#39;re right that parameters in tst_res message appear to be in wrong order=
.<br></div></div></div></div></blockquote><div><br></div><div style=3D"font=
-size:small">Feel free to fix it while merging this patch.</div></div></div=
></blockquote><div><br></div><div><div style=3D"font-family:monospace" clas=
s=3D"gmail_default">Pushed with fix for tst_res parameters.</div><br></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regar=
ds,<br></div><div>Li Wang<br></div></div></div></div>
</blockquote></div></div>

--000000000000b147db05c8403e61--


--===============0301999297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0301999297==--

